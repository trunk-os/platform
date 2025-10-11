include ../include.mk

run: down
	sudo zfs create trunk/grafana || :
	sudo zfs set quota=50G trunk/grafana || :
	sudo podman network create prometheus || :
	sudo podman run -it -u 0 --net prometheus -d --name "$(NAME)" -p 5100:3000 -v /trunk/grafana:/var/lib/grafana:shared,rw "$(LATEST_TAG)"
