.PHONY: all
all: build

.PHONY: run
run: build
	mkdocs serve --dirtyreload -a localhost:8001

.PHONY: build
build:
	mkdocs build --clean

.PHONY: install
install:
	pip install --upgrade pip
	pip install mkdocs==1.5.3
	pip install mkdocs-material==9.4.6
	pip install mkdocs-static-i18n==0.56
	pip install mkdocs-material-extensions==1.3
