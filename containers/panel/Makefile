include ../include.mk

run: down
	sudo podman run -it -d -p 80:80 --name "$(NAME)" -e VITE_API_BASE_URL "$(LATEST_TAG)"
