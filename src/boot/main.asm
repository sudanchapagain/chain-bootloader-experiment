; boot from bios
; load next sector
; jump to it

[org 0x7C00]
[bits 16]

start:
    mov ah, 0x02 ;bios func to read disk sector
    mov al, 1 ; read 1 sector
    mov ch, 0 ; cylinder
    mov cl, 2 ; sector 2
    mov dh, 0 ; head
    mov dl, 0x80 ; drive
    mov bx, 0x8000 ; load address
    int 0x13; call bios interrupt to read sector

    jc .fail

    jmp 0x0000:0x8000 ; ^

.fail:
    mov si, failmsg
.fail_print:
    lodsb
    or al, al
    jz .halt
    mov ah, 0x0E
    int 0x10 ; print chars in AL
    jmp .fail_print

.halt:
    cli ; disable interrupts
    hlt

failmsg db "bootloader loadinng fail", 0
times 510-($-$$) db 0 ; pad 512 bytes
dw 0xAA55 ; boot signature apparently
