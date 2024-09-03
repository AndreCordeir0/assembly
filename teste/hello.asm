section .data
    LF equ 0xA ;quebra de linha
    NULL equ 0xD ;Final da string
    SIS_EXIT equ 0x1 ;Syscal exit
    RET_EXIT equ 0x0 ;Exit
    STD_OUT equ 0x1 ;Output
    STD_IN equ 0x0 ;Input
    SYS_READ equ 0x3 ;Leitura
    SYS_WRITE equ 0x4 ;ESCREVER
    pergunta db 'Qual seu nome?', LF,0
    teste db 'Teste', LF,0
    len equ $ - pergunta
    lenTeste equ $ - teste

section .bss
    nome resb 10
    resposta resb 100

section .text
    global _start


_start:
    push len
    push pergunta
    call escrever
    add esp, 8

    push lenTeste
    push teste
    call escrever
    add esp, 8

    ; ; Escrever o que eu coloquei
    ; mov eax, SYS_READ
    ; mov ebx, STD_IN
    ; mov ecx, nome
    ; mov edx, 10
    ; int 0x80

    
    ; push dword 'Seu'
    ; pop dword [resposta]
    ; push dword [eax]
    ; pop dword [resposta+3]

    ; Saída do programa
    call saida

saida:
    mov eax, SIS_EXIT
    mov ebx, RET_EXIT
    int 0x80

escrever:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, [esp+4]
    mov edx, [esp+8]
    int 0x80
    ret