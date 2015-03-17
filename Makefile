
builder = build.litcoffee
config = config.yaml

.PHONY: all clean

all: html

html: node_modules $(builder) $(config)
	@mkdir -p $@
	coffee $(builder) $(config) $@

node_modules: package.json
	npm install
	@touch $@

clean:
	rm --recursive --force -- html
	rm --recursive --force -- node_modules
