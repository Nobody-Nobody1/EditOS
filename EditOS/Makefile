build:
	cargo +nightly bootimage

clean:
	cargo clean

run:
	qemu-system-x86_64 -drive format=raw,file=target/x86_64-unknown-none/debug/bootimage-edit_os.bin
