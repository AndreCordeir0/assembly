section .text
    global saida

saida:
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80