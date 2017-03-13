# Comment this out to use the other fuse
#FUSE=$(which fuse)
FUSE=/Applications/Fuse.app/Contents/MacOS/Fuse

%:
	z80asm -o $@.bin $@.s 
	bin2tap -b -o $@.tap $@.bin
	$(FUSE) $@.tap
    

clean:
	rm *.bin *.tap
