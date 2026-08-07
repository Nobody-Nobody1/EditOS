all:
	nasm -f bin boot.asm -o boot.bin
	copy /b boot.bin EditOS.img

run:
	qemu-system-i386 -drive format=raw,file=EditOS.img