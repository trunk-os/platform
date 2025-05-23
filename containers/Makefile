DIRS ?= $(shell find . -maxdepth 1 -type d | tail -n +2)

all:
	for i in $(DIRS); do cd $$i && make; cd ..; done

run: all
	for i in $(DIRS); do cd $$i && make run; cd ..; done

down:
	for i in $(DIRS); do cd $$i && make down; cd ..; done

clean:
	for i in $(DIRS); do cd $$i && make clean; cd ..; done

.PHONY: all run clean down
