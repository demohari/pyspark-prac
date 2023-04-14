.PHONY: docs

setup:
	bash init_setup.sh

c_activate:
	conda activate ./env

install:
	pip install -r requirements.txt


dev: install
	pip install -r requirements_dev.txt

git:
	rm -rf /config/workspace/.git/
	git config --global user.email "kishore_koneru@yahoo.com"
	git config --global user.name "demohari"

git_initial:
	git init
	git add .
	git commit -m 'update'
	git branch -M main
	git remote add origin https://github.com/demohari/pyspark-prac.git
	git push -u origin main

test:
	pytest tests.py


clean:
	rm -rf __pycache__ .pytest_cache .mypy_cache .tox


flake:
	flake8 common.py tests.py


check: flake test clean


docs:
	pdoc --html --force --output-dir docs common
