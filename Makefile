all: containers

clean: clean-containers

containers:
	cd containers && make

clean-containers:
	cd containers && make clean

run-containers:
	cd containers && make run

import-trunk:
	sudo zpool import -d ./trunk_files trunk

recreate-trunk:
	sudo zpool destroy trunk || :
	mkdir -p trunk_files
	for i in one two three four; do rm -f trunk_files/$$i; truncate -s50G trunk_files/$$i; done
	sudo zpool create trunk raidz ./trunk_files/one ./trunk_files/two ./trunk_files/three ./trunk_files/four

.PHONY: all clean containers clean-containers run-containers
