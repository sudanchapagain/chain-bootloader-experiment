Boot Loader
==========

Commands
--------

```sh
# assemble
nasm -f bin src/main.asm -o boot.bin
nasm -f bin stage2.asm -o stage2.bin

# make images
dd if=/dev/zero of=boot.img bs=512 count=2
dd if=boot.bin of=boot.img conv=notrunc
dd if=stage2.bin of=boot.img bs=512 seek=1 conv=notrunc

# run
qemu-system-x86_64 -drive file=boot.img,format=raw
# or
qemu-system-x86_64 -drive file=boot.img,format=raw -d int
```

Resource
--------

- [How computer boots up](https://manybutfinite.com/post/how-computers-boot-up/)
- [Boot loader](https://wiki.osdev.org/Bootloader)
- [Rolling Your Own Boot loader](https://wiki.osdev.org/Rolling_Your_Own_Bootloader)
- [hello world boot loader](https://www.viralpatel.net/taj/tutorial/hello_world_bootloader.php)
- [Writing a Boot loader from Scratch](https://www.cs.cmu.edu/~410-s07/p4/p4-boot.pdf)
- [How to Write a Boot loader from Scratch](https://interrupt.memfault.com/blog/how-to-write-a-bootloader-from-scratch)
