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

msg db "Hello from Kernel!", 0

; Call the print routine
call print_string

; Pad to 510 bytes
times 510-($-$$) db 0

; Boot signature
dw 0xAA55