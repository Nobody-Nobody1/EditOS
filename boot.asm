[org 0x7C00]

; Print 'E'
mov ah, 0x0E
mov al, 'E'
int 0x10

; Load kernel (sector 2) to 0x8000
mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, 0
mov bx, 0x8000
int 0x13

; Jump to kernel
jmp 0x0000:0x8000

; Pad to 510 bytes
times 510-($-$$) db 0

; Boot signature
dw 0xAA55