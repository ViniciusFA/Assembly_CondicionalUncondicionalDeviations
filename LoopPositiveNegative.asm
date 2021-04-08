.data
	msgPosivito: .asciiz "Esse número é um positivo."
	msgNegativo: .asciiz "Esse número é um negativo."
	msg1:        .asciiz "Digite um número: "
	fim:         .asciiz "\nFim do Programa!\n"

.text
	li $v0, 4 # Imprimir uma string
	la $a0, msg1 # a0 = msg1
	syscall      # Executa a isntrução
	
	li $v0, 5    # Recebe um número inteiro
	syscall      # Executa a isntrução
	 
	move $t0, $v0      #  $t0 = $v0
	beq $t0,$0, sair   # Se $t0 = 0 cai no bloco de código chamado sair
	jal verifica       # se $t0 != 0 então cai no bloco de codigo chamado verifica
		
		
	verifica:
		bgt $t0, $0, maior  # Se o valor de $t0 for maior que 0 então cai no bloco chamado maior
		blt $t0, $0, menor  # Se o valor de $t0 for menor que 0 então cai no bloco chamado menor
	
	maior:
		li $v0, 4 	    # Imprime uma string
		la $a0, msgPosivito # $a0 = msgPositivo
		syscall 	    # Executa a isntrução
		j sair              # pula para o bloco sair
	
	menor:
		li $v0, 4           # Imprime uma string
		la $a0, msgNegativo # $a0 = msgNegativo
		syscall             # Executa a isntrução         	
		j sair              # pula para o bloco sair
		
	sair:
		li $v0, 4           # Imprime uma string
		la $a0, fim         # $a0 = fim
		syscall             # Executa a isntrução
		
		li $v0, 10          # Preparando para o processador finalizar
		syscall             # Executa a isntrução
