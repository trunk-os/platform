all: containers

clean: clean-containers

containers:
	cd containers && make

clean-containers:
	cd containers && make clean

.PHONY: all containers
