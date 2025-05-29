include ../include.mk

run: down
	sudo podman run -it -d --name "$(NAME)" -p 5309:5309 --net bridge --volumes-from buckle -v /trunk:/trunk:shared "$(LATEST_TAG)"
