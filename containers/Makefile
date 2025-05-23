all:
	@# i suck at make
	for i in $$(find . -maxdepth 1 -type d | tail -n +2); \
	do \
		cd $$i; \
		make; \
		cd ..; \
	done

.PHONY: all
