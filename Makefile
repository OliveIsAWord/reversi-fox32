.POSIX:

OLEAC := olea
FOX32ASM := fox32asm
RYFS := ryfs

SOURCE = main.olea std.olea fox32os.def.olea fox32rom.def.olea

main.img: main.fxf
	$(RYFS) create -l "Reversi" $@
	$(RYFS) add $@ $<

main.fxf: entry.asm binding_addresses.asm fox32.def.asm main.asm menu.asm
	$(FOX32ASM) $< $@ > /dev/null

binding_addresses.asm: main.dump
	./gen_bindings.rs $< > $@

fox32.def.asm: main.dump
	$(OLEAC) $< --binding=fox32 > fox32.def.asm

# we have #include at home
# concatenate all source files, using awk so they're separated by newlines
main.dump: $(SOURCE)
	awk '{print $0}' $^ > $@

main.asm: main.dump
	$(OLEAC) $< > $@

clean:
	rm -f binding_addresses.asm fox32.def.asm main.asm main.dump main.fxf main.img

.PHONY: clean
