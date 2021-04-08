.data
	pergunta: .asciiz "Digite a sua idade: "	
	msg1:     .asciiz "Voc� � menor de idade.\n "
	msg2:     .asciiz "Voc� � maior de idade.\n "
	fim:       .asciiz "Fim do programa...\n"
.text
.globl prog

prog:
	li $v0, 4           #Imprimir uma string
	la $a0, pergunta    # $v0 = pergunta
	syscall             # Executa a instru��o
	
	li $v0, 5           # Le um n�mero inteiro
	syscall             # Executa a instru��o
	
	move $t1, $v0       # $t1 = $v0
	beq $t1, $0, sair   # Desvia para o bloco sair
	blt $t1, 18, menor  # Desvia para o bloco menor caso seja < 18
	bge $t1, 18, maior  # Desvia para o bloco maior caso seja > 18
	j prog              # Desvia para o bloco prog da linha 8

menor:
	li $v0, 4           # Imprimir uma string
	la $a0, msg1        # $v0 = msg1
	syscall             # Executa a instru��o
	j prog              # Desvia para o bloco prog da linha 8
	
maior:
	li $v0, 4           # Imprimir uma string
	la $a0, msg2        # $v0 = msg1
	syscall             # Executa a instru��o
	j prog              # Desvia para o bloco prog da linha 8

sair:
	li $v0, 4           # Imprimir uma string
	la $a0, fim         # $a0 = fim
	syscall             # Executa a instru��o
	
	li $v0, 10 	    # Finalizar o programa
	syscall             # Executa a instru��o