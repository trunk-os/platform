REPOSITORY ?= localhost
NAME ?= $(shell basename ${PWD})
BASE_TAG ?= $(REPOSITORY)/$(NAME)
TAG ?= $(BASE_TAG):$(shell date +%Y-%m-%d)
LATEST_TAG ?= $(BASE_TAG):latest
BUILD_ARGS ?= --pull=always --no-cache

all: .stamp.make

.stamp.make: *
	make build
	touch .stamp.make

build-default:
	podman build $(BUILD_ARGS) -t "$(TAG)" .
	podman tag "$(TAG)" "$(LATEST_TAG)"

clean-default:
	rm -f .stamp.make

pre-down-default:

down-default: pre-down
	podman rm -f $(NAME)

run-default: down
	podman run -it -d --name $(NAME) $(TAG)

%: %-default
	@true

.PHONY: all build-default run-default pre-down-default clean-default down-default
