include ../include.mk

run: down
	sudo zfs create trunk/grafana || :
	sudo zfs set quota=50G trunk/grafana || :
	sudo podman run -it -u 0 --net host -d --name "$(NAME)" -v /trunk/grafana:/var/lib/grafana:shared,rw "$(LATEST_TAG)"
