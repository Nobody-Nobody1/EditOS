#![no_std]
#![no_main]

use bootloader_api::{entry_point, BootInfo};
use core::panic::PanicInfo;

entry_point!(kernel_main);

fn kernel_main(boot_info: &'static mut BootInfo) -> ! {
    let fb = boot_info.framebuffer.as_mut().unwrap();
    let buffer = fb.buffer_mut();

    // Fill screen with white pixels
    for pixel in buffer.chunks_exact_mut(4) {
        pixel.copy_from_slice(&[255, 255, 255, 0]); // RGBA
    }

    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}