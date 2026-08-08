ASM=nasm

all:
	$(ASM) -f bin boot.asm -o boot.bin
	$(ASM) -f bin stage2.asm -o stage2.bin
	copy /b boot.bin + stage2.bin EditOS.img

run:
	qemu-system-i386 -drive format=raw,file=EditOS.img