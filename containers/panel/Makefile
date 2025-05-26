include ../include.mk

run: down
	sudo podman run -it -d -p 80:80 --name "$(NAME)" "$(LATEST_TAG)"
