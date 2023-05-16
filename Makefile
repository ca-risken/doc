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
	pip install mkdocs
	pip install mkdocs-material
	pip install mkdocs-static-i18n
