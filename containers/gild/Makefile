include ../include.mk

run: down
	mkdir -p /tmp/gild
	sudo podman run -it -d --name "$(NAME)" -p 5309:5309 --net bridge --volumes-from buckle -v /tmp/buckle:/trunk/socket -v /tmp/gild:/trunk/gild "$(TAG)"
