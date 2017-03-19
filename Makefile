# Comment this out to use the other fuse
#FUSE=$(which fuse)
FUSE=/Applications/Fuse.app/Contents/MacOS/Fuse
#FUSE=/Users/yuhan/LocalDoc/UCSD/demo_prog/Fuse/Fuse.app/Contents/MacOS/Fuse

default: main
%:
	z80asm -o $@.bin $@.s 
	bin2tap -b -o $@.tap $@.bin
	$(FUSE) $@.tap
    

clean:
	rm *.bin *.tap
