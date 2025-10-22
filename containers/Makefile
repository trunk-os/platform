DIRS ?= $(shell find . -maxdepth 1 -type d | tail -n +2 | sort)

all: run

build:
	cd base && make build
	cd services && make build

run: build 
	cd services && make run

down:
	cd services && make down

clean:
	cd base && make clean
	cd services && make clean

push:
	cd base && make push
	cd services && make push

.PHONY: all run clean down push
