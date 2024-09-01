gerar_exe: compilar linkar exec

compilar:
	nasm -f elf64 -o hello.o hello.asm

linkar:
	ld -s -o hello hello.o

gerar_exe_32: compilar_32 linkar_32 exec

compilar_32:
	nasm -f elf32 -o hello.o hello.asm

linkar_32:
	ld -m elf_i386 -s -o hello hello.o

exec:
	./hello



