
%:
	z80asm -o $@.bin $@.z80 
	bin2tap -b -o $@.tap $@.bin
	fuse $@.tap
    

clean:
	rm *.bin *.tap
