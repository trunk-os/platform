include ../include.mk

pre-down:
	rm -rf /tmp/buckle

run: down
	mkdir -p /tmp/buckle
	podman run -it -d --privileged --name $(NAME) --pid host -v /tmp/buckle:/trunk/socket "$(TAG)"
