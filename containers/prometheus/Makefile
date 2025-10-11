include ../include.mk

run: down
	sudo zfs create trunk/prometheus || :
	sudo zfs set quota=50G trunk/prometheus || :
	sudo podman run -u 0 --net host -d -v /trunk/prometheus:/prometheus:shared --name "$(NAME)" "$(LATEST_TAG)"
