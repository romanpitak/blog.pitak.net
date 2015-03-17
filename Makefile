
builder = build.litcoffee
config = config.yaml
index = redirect.jade

.PHONY: all clean

all: html

html: node_modules $(builder) $(config) $(index)
	@mkdir -p $@
	coffee $(builder) $(config) $(index) $@

node_modules: package.json
	npm install
	@touch $@

clean:
	rm --recursive --force -- html
	rm --recursive --force -- node_modules
