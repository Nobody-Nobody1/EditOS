[org 0x7C00]

print_string:
    mov si, msg        ; SI = address of string

.next_char:
    lodsb              ; load byte at [SI] into AL, increment SI
    cmp al, 0          ; check for null terminator
    je .done

    mov ah, 0x0E       ; BIOS teletype function
    int 0x10           ; print AL

    jmp .next_char

.done:
    ret

msg db "Hello from EditOS!", 0

; Call the print routine
call print_string

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