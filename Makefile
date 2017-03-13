
FUSE=/Users/yuhan/LocalDoc/UCSD/demo_prog/Fuse/Fuse.app/Contents/MacOS/Fuse
%:
	z80asm -o $@.bin $@.s 
	bin2tap -b -o $@.tap $@.bin
	$(FUSE) $@.tap
    

clean:
	rm *.bin *.tap
