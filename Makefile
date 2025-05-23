all: containers

clean: clean-containers

containers:
	cd containers && make

clean-containers:
	cd containers && make clean

run-containers:
	cd containers && make run

.PHONY: all clean containers clean-containers run-containers
