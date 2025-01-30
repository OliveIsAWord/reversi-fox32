.POSIX:
.SUFFIXES: .olea .asm

OLEAC := olea
FOX32ASM := fox32asm
RYFS := ryfs

SOURCE = main.olea

main.img: main.fxf
	$(RYFS) create $@
	$(RYFS) add $@ $<

main.fxf: entry.asm main.asm
	$(FOX32ASM) $< $@

main.asm: $(SOURCE) fox32rom.def.olea
	cat $^ > main.dump
	$(OLEAC) main.dump > $@
