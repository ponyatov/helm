# var
MODULE = $(notdir $(CURDIR))
PORT  ?= 12345

# dir
CWD    = $(CURDIR)
NBIN   = $(CWD)/node_modules/.bin
STATIC = $(CWD)/static

# tool
CURL = curl -L -o
ELM  = $(NBIN)/elm
ELF  = $(NBIN)/elm-format
ELV  = $(NBIN)/elm-live

# src
E += src/Main.elm $(wildcard src/*.elm)
H  = static/index.html

# all
.PHONY: all
all: $(H)
$(H): $(E)
	$(ELM) make $^ --output=$@

.PHONY: live
live: $(E)
	$(ELV) $^ \
		--path-to-elm=$(ELM) --port=$(PORT) -d $(STATIC) \
		-- --output=$(H)

# format
.PHONY: format
format: tmp/format_elm
tmp/format_elm: $(E)
	$(ELF) --yes $? && touch $@

# doc
.PHONY: doc
doc: ../doc/Elm/elm-language.pdf

../doc/Elm/elm-language.pdf:
	$(CURL) $@ https://riptutorial.com/Download/elm-language.pdf

# install
.PHONY: install update ref gz
install: doc ref gz
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
