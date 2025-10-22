include ../include.mk

pre-build:
	sudo podman pull quay.io/prometheus/node-exporter:latest

run: down
	sudo podman run -it -d --cap-add SYS_TIME --name "$(NAME)" --net host --pid host -v "/:/host:ro,rslave" "$(LATEST_TAG)" --path.rootfs=/host
