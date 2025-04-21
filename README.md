bootloader
==========

commands
--------

```sh
nasm -f bin src/boot/hello_world.asm -o boot.img
qemu-system-x86_64 -drive format=raw,file=boot.img
vncviewer localhost:5900
```

resource
--------

[How computer boots up](https://manybutfinite.com/post/how-computers-boot-up/)

[Bootloader](https://wiki.osdev.org/Bootloader)

[Rolling Your Own Bootloader](https://wiki.osdev.org/Rolling_Your_Own_Bootloader)

[hello world bootloader](https://www.viralpatel.net/taj/tutorial/hello_world_bootloader.php)

[Writing a Bootloader from Scratch](https://www.cs.cmu.edu/~410-s07/p4/p4-boot.pdf)

[How to Write a Bootloader from Scratch](https://interrupt.memfault.com/blog/how-to-write-a-bootloader-from-scratch)
