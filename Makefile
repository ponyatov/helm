# all
.PHONY: all
all: install

# format
.PHONY: format
format: tmp/format_elm
tmp/format_elm:
	touch $@

# install
.PHONY: install update ref gz
install: ref gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
ref:
gz:

package.json:
	npm init
