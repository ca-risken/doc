.PHONY: all
all: build

.PHONY: run
run: build
	mkdocs serve --dirtyreload -a localhost:8001

.PHONY: build
build:
	mkdocs build --clean --strict

.PHONY: install
install:
	pip install --upgrade pip
	pip install mkdocs==1.4.3
	pip install mkdocs-material==8.4.3
	pip install mkdocs-static-i18n==0.56
