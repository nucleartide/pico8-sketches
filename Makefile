
NAME = p
LUA = $(shell find . -name '*.lua')
SRC_ONLY = $(filter-out %_test.lua,$(LUA))

# TODO: before shipping, you should check stat(0) for memory leaks

# Can `require` modules or individual files.
$(NAME).p8: $(SRC_ONLY) $(CURDIR)/picokit/old-stuff/platformer.p8
	@p8tool build $@ --lua $(NAME).lua \
		--gfx $(CURDIR)/picokit/old-stuff/platformer.p8 \
		--map $(CURDIR)/picokit/old-stuff/platformer.p8 \
		--lua-path $(CURDIR)/?/init.lua\;$(CURDIR)/?.lua \
		--gff $(CURDIR)/picokit/old-stuff/platformer.p8

run: $(NAME).p8
	@open -a PICO-8 --args -run $(CURDIR)/$^
.PHONY: run

old-shit:
	@open -n -a PICO-8 --args -run $(CURDIR)/picokit/old-stuff/platformer.p8
.PHONY: run

watch: run
	@watch -i 100ms --halt make $(NAME).p8 >/dev/null
.PHONY: watch
