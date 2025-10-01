REPOSITORY ?= quay.io/trunk-os
NAME ?= $(shell basename ${PWD})
BASE_TAG ?= $(REPOSITORY)/$(NAME)
TAG ?= $(BASE_TAG):$(shell date +%Y-%m-%d)
LATEST_TAG ?= $(BASE_TAG):latest
BUILD_ARGS ?= --pull=always --no-cache
VITE_API_BASE_URL ?= http://localhost:5309

all: .stamp.make

# ignore the Makefile changes for builds since they never modify it
.stamp.make: $(wildcard *)
	make build
	touch .stamp.make

build-default:
	sudo podman build $(BUILD_ARGS) -t "$(TAG)" .
	sudo podman tag "$(TAG)" "$(LATEST_TAG)"

clean-default:
	rm -f .stamp.make

pre-down-default:

down-default: pre-down
	sudo podman rm -f $(NAME)

run-default: down
	sudo podman run -it -d --name "$(NAME)" "$(LATEST_TAG)"

%: %-default
	@true

.PHONY: all build-default run-default pre-down-default clean-default down-default
