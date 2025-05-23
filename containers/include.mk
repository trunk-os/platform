BASE_TAG ?= $(shell basename ${PWD})
TAG ?= $(BASE_TAG):$(shell date +%Y-%m-%d)
LATEST_TAG ?= $(BASE_TAG):latest

all: Containerfile.stamp

Containerfile.stamp: Containerfile
	podman build -t "$(TAG)" .
	podman tag "$(TAG)" "$(LATEST_TAG)"
	touch Containerfile.stamp

.PHONY: all
