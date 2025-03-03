.POSIX:
.SUFFIXES: .olea .asm

OLEAC := olea
FOX32ASM := fox32asm
RYFS := ryfs

SOURCE = main.olea

main.img: main.fxf
	$(RYFS) create -l "Reversi" $@
	$(RYFS) add $@ $<

main.fxf: entry.asm binding_addresses.asm fox32.def.asm main.asm
	$(FOX32ASM) $< $@

binding_addresses.asm: fox32.def.olea
	./gen_bindings.rs

fox32.def.asm: fox32.def.olea
	$(OLEAC) $< --binding=fox32 > fox32.def.asm

main.asm: $(SOURCE) fox32.def.olea
	cat $^ > main.dump
	$(OLEAC) main.dump > $@

clean:
	rm -f binding_addresses.asm fox32.def.asm main.asm main.dump main.fxf main.img

.PHONY: clean
