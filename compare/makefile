gerar_exe: compilar linkar exec

compilar:
	nasm -f elf64 -o compare.o compare.asm

linkar:
	ld -s -o compare compare.o

gerar_exe_32: remover_arquivos compilar_utils_32 compilar_32 linkar_32 exec

compilar_32:
	nasm -f elf32 -o compare.o compare.asm

compilar_utils_32:
	nasm -f elf32 -o utils.o ../utils/utils.asm 

linkar_32:
	ld -m elf_i386 -s -o compare compare.o utils.o

exec:
	./compare

remover_arquivos:
	rm -rf compare compare.o utils.o