all: containers

containers:
	cd containers && make

.PHONY: all containers
