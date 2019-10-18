		.data
TEXTO_1:	.asciiz "(1) ADICIONAR NA FILA \n(2) REMOVER DA FILA \n(3) FECHAR PROGRAMA\n"
TEXTO_2:	.asciiz "\nENCERRANDO PROGRAMA..."
TEXTO_3:	.asciiz "numero de elemetos para adicionar: "

		.text
		.globl	menu
	
menu:		li $v0, 4		#imprime o menu de opcoes
		la $a0, TEXTO_1
		syscall
		
get_opc_menu:	li, $v0, 5		#pega a opcao do menu
		syscall

decide_opc:	li, $a0, 1		#decide qual metodo chamar
		beq $v0, $a0, q_insert	#chama insert se usuario digitou 1
		li $a0, 2		
		beq $v0, $a0, q_remove	#chamar remove se usuario digitou 2

fecha_prog:	li $v0, 4		#printa texto_2
		la $a0, TEXTO_2
		syscall
		li $v0, 10		#encerra programa
		syscall

q_insert:	li $v0, 4  		#printa texto_3
		la $a0, TEXTO_3
		syscall
		
		li $v0 5		#pega numero de nodos que serao inseridos
		syscall
		j menu
		
q_remove:	j menu
