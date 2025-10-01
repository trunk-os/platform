DIRS ?= $(filter-out ./control-plane, $(shell find . -maxdepth 1 -type d | tail -n +2 | sort))

all:
	cd control-plane && make
	for i in $(DIRS); do cd $$i && make; cd ..; done

build:
	cd control-plane && make build
	for i in $(DIRS); do cd $$i && make build; cd ..; done

run: all
	for i in $(DIRS); do cd $$i && make run; cd ..; done

down:
	for i in $(DIRS); do cd $$i && make down; cd ..; done

clean:
	for i in $(DIRS); do cd $$i && make clean; cd ..; done

push:
	for i in $(DIRS); do sudo podman push quay.io/trunk-os/$$(basename $$i) || exit 1; done

.PHONY: all run clean down push
