define iterate_dirs
	for project in $(DIRS); do (cd $$project && make $(1)) || exit 1; done
endef

all: run

build:
	$(call iterate_dirs, build)

run: build 
	$(call iterate_dirs, run)

down:
	$(call iterate_dirs, down)

clean:
	$(call iterate_dirs, clean)

push:
	$(call iterate_dirs, push)

.PHONY: all run clean down push

