        [org 0x8000]
        [bits 16]

start:
        mov si, msg

print:
        lodsb
        or al, al
        jz halt
        mov ah, 0x0E
        int 0x10
        jmp print

halt:
        cli
        hlt

msg:
        db "stage2 loaded", 0

        times 512-($-$$) db 0
