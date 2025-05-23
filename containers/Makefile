DIRS ?= $(shell find . -maxdepth 1 -type d | tail -n +2)

all:
	for i in $(DIRS); do cd $$i && make; cd ..; done

clean:
	rm -f */.stamp.make

.PHONY: all clean
