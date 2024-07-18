

# install
.PHONY: install update ref gz
install: ref gz
	$(MAKE) update
update:
ref:
gz:
