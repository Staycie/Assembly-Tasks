.model small
.stack 100h

.data
msg1 db "Enter the first string: $"
msg2 db "Enter the second string: $"
msg3 db "Enter the third string: $"
buffer db 100 dup(?) ; Buffer to store the user input
string1 db 100 dup(?)
string2 db 100 dup(?)
string3 db 100 dup(?)
output_msg db "Entered strings are: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt for and read the first string
    lea dx, msg1
    mov ah, 09h
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h
    mov si, offset buffer
    mov di, offset string1
    call copy_string

    ; Prompt for and read the second string
    lea dx, msg2
    mov ah, 09h
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h
    mov si, offset buffer
    mov di, offset string2
    call copy_string

    ; Prompt for and read the third string
    lea dx, msg3
    mov ah, 09h
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h
    mov si, offset buffer
    mov di, offset string3
    call copy_string

    ; Print the entered strings
    lea dx, output_msg
    mov ah, 09h
    int 21h

    lea dx, string1
    mov ah, 09h
    int 21h

    lea dx, string2
    mov ah, 09h
    int 21h

    lea dx, string3
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h

copy_string proc
    mov cl, [si]  ; Load character from source string
    mov [di], cl  ; Store character in destination string

    cmp cl, '$'  ; Check if end of string
    je end_copy

    inc si
    inc di

    jmp copy_string

end_copy:
    mov byte ptr [di], '$'  ; Add null terminator to destination string
    ret
copy_string endp

end main