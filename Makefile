.PHONY: all
all: help

.PHONY: help
help:
	@echo "Usage: make <sub-command>"
	@echo "\n---------------- sub-command list ----------------"
	@cat Makefile | grep -e "^.PHONY:" | grep -v "all" | cut -f2 -d' '

.PHONY: build
build:
	mkdocs build --clean

.PHONY: run
run:
	mkdocs serve -a localhost:8001

.PHONY: docker-build
docker-build:
	docker build -t doc:local .
