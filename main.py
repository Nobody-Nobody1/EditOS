# main.py
from pyos import Kernel, Screen, Keyboard

kernel = Kernel(arch="x86")

@kernel.on_boot
def main():
    Screen.clear()
    Screen.set_color("white", "black")
    Screen.print("Hello from EditOS!")

if __name__ == "__main__":
    kernel.build("EditOS.bin")