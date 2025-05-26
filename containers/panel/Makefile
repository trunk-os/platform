include ../include.mk

run: down
	sudo podman run -it -p 80:80 --name "$(NAME)" "$(LATEST_TAG)"
