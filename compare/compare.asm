
section .data
    msg_maior_de_idade db 'Maior de idade',0xA,0
    len_msg_maior_de_idade equ $-msg_maior_de_idade
    msg_menor_de_idade db 'Menor de idade',0xA,0
    len_msg_menor_de_idade equ $-msg_menor_de_idade
    pergunta db 'Qual sua idade?',0xA,0
    len_pergunta equ $-pergunta

; Variáveis que são armazenadas em runtime, ou seja, durante a execução do programa
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

    mov esi, user_input
    mov edx, 4
    call string_to_int

    mov esi, 18
    cmp eax, esi
    
    jge maior_de_idade
    jl menor_de_idade

maior_de_idade:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_maior_de_idade
    mov edx, len_msg_maior_de_idade
    int 0x80

    mov eax, 1      ; syscall exit
    xor ebx, ebx
    int 0x80

menor_de_idade:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_menor_de_idade
    mov edx, len_msg_menor_de_idade
    int 0x80

    mov eax, 1      ; syscall exit
    xor ebx, ebx
    int 0x80

; ESI = STRING
limpar_input:
    

; ESI = STRING INPUT
; EDX = TAMANHO STRING
; EAX = RESULTADO
string_to_int:
    xor ecx, ecx
    xor ebx, ebx

.next_digit:
    movzx eax, byte [esi]
    cmp al, '0'
    jl .exit
    cmp al, '9'
    jg .exit
    inc esi
    sub eax, '0'
    imul ebx, 10
    add ebx, eax
    inc ecx
    cmp ecx, edx
    jl .next_digit

.exit:
    mov eax, ebx
    ret