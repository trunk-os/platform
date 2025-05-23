include ../include.mk

run: down
	mkdir -p /tmp/gild
	podman run -it -d --name "$(NAME)" -p 5309:5309 -v /tmp/buckle:/trunk/socket -v /tmp/gild:/trunk/gild "$(TAG)"
