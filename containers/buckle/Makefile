include ../include.mk

pre-down:
	rm -rf /tmp/buckle

run: down
	sudo podman run -it -d --privileged --name "$(NAME)" --net bridge --device /dev/zfs --pid host -v /trunk:/trunk:shared "$(LATEST_TAG)"
