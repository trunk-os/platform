include ../include.mk

pre-down:
	rm -rf /tmp/buckle

run: down
	mkdir -p /tmp/buckle
	sudo podman run -it -d --privileged --name "$(NAME)" --net bridge --device /dev/zfs --pid host -v /tmp/buckle:/trunk/socket "$(LATEST_TAG)"
