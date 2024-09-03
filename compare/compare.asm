extern saida

section .data
    msg_maior_de_idade db 'Maior de idade',0xA,0
    len_msg_maior_de_idade equ $-msg_maior_de_idade
    msg_menor_de_idade db 'Menor de idade',0xA,0
    len_msg_menor_de_idade equ $-msg_menor_de_idade
    pergunta db 'Qual sua idade?',0xA,0
    len_pergunta equ $-pergunta

section .bss
    user_input resb 4

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pergunta
    mov edx, len_pergunta
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, 4
    int 0x80

    mov ebx, 18
    cmp ebx, [user_input]
    jge maior_de_idade
    jl menor_de_idade
    call saida


maior_de_idade:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_maior_de_idade
    mov edx, len_msg_maior_de_idade
    int 0x80

menor_de_idade:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_menor_de_idade
    mov edx, len_msg_menor_de_idade
    int 0x80