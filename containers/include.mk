BASE_TAG ?= $(shell basename ${PWD})
TAG ?= $(BASE_TAG):$(shell date +%Y-%m-%d)
LATEST_TAG ?= $(BASE_TAG):latest

all: .stamp.make

.stamp.make: *
	podman build -t "$(TAG)" .
	podman tag "$(TAG)" "$(LATEST_TAG)"
	touch .stamp.make

.PHONY: all
