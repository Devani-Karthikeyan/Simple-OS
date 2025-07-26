[org 0x7C00]
bits 16

start:
    mov si, message
.print_loop:
    lodsb
    or al, al
    jz load_kernel
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp .print_loop

load_kernel:
    mov ax, 0x0000
    mov es, ax
    mov bx, 0x7E00

    mov ah, 0x02
    mov al, 5
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x00
    int 0x13

    jmp 0x0000:0x7E00

message db "Welcome to MyOS!", 0

times 510-($-$$) db 0
dw 0xAA55

