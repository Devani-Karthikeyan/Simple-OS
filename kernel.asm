[org 0x7E00]
bits 16

start:
    mov si, msg
.loop:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    int 0x10
    jmp .loop

halt:
    hlt
    jmp halt

msg db "Hello from the Kernel!", 0
