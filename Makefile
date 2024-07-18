# var
MODULE = $(notdir $(CURDIR))

# dir
CWD  = $(CURDIR)
NBIN = $(CWD)/node_modules/.bin

# tool
CURL = curl -L -o
ELM  = $(NBIN)/elm
ELF  = $(NBIN)/elm-format

# src
E += src/Main.elm $(wildcard src/*.elm)

# all
.PHONY: all
all: $(E)
	$(ELM) make $^

# format
.PHONY: format
format: tmp/format_elm
tmp/format_elm: $(E)
	$(ELF) --yes $? && touch $@

# install
.PHONY: install update ref gz
install: ref gz
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
ref:
gz:


elm.json:
	$(ELM) init

package.json:
	npm init
