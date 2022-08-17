default: dist/known_hosts

dist/known_hosts: known_hosts
	@mkdir -p $(@D)
	sed -f public.sed $< > $@

.PHONY: default
