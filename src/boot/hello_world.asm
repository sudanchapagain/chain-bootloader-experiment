ORG 0x7c00 ;; the memory address where the BIOS loads the boot sector
BITS 16 ;; 16-bit real mode assembly

message: db 'meow', 0 ;; null terminated str

start:
     mov si, message
     call print
     jmp $ ;; infinite loop to halt exec

print:
     mov bx, 0
.loop:
      lodsb ;; load byre from [SI] to AL
      cmp al, 0 ;; null terminate check
      je .done ;; on null, done
      call print_char ;; print char
      jmp .loop

.done:
    ret

print_char:
     mov ah, 0eh ;; bios func. teletype out
     int 0x10 ;; print AL chars
     ret

times 510-($ - $$) db 0 ;; padd with 0s upto 512bytes
dw  0xAA55 ;; magic num for bios
