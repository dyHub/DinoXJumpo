
%:
	z80asm -o $@.bin $@.s
	bin2tap -b -o $@.tap $@.bin
	fuse $@.tap
    

clean:
	rm *.bin *.tap
