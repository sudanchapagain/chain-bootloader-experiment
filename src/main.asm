        [org 0x7C00]
        [bits 16]

start:
        xor ax, ax
        mov es, ax
        mov bx, 0x8000

        mov ah, 0x02                   ; bios function to read disk sector
        mov al, 1                      ; read 1 sector
        mov ch, 0                      ; cylinder
        mov cl, 2                      ; sector 2
        mov dh, 0                      ; head
        int 0x13

        jc .fail

        jmp 0x0000:0x8000              ; ^

.fail:
        mov si, failmsg
.fail_print:
        lodsb
        or al, al
        jz .halt
        mov ah, 0x0E
        int 0x10                       ; print chars in AL
        jmp .fail_print

.halt:
        cli                            ; disable interrupts
        hlt

failmsg:
        db "bootloader loading fail", 0
        times 510-($-$$) db 0          ; pad 512 bytes
        dw 0xAA55                      ; boot signature apparently
