
%:
	./z80asm -o $@.bin $@.s
	./bin2tap -b -o $@.tap $@.bin
    

clean:
	rm *.bin *.tap
