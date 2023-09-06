#########################################################
# Laboratório 03 - MCP22105
# Estruturas de Controle
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Faça um programa que receba dois endereços de memória 
# (fonte e destino) (0x10010000, 0x10010004), além da 
# quantidade de posições de memória (bytes) que devem 
# ser copiados (0x10010008), e faça a transferência dos 
# dados presentes no endereço de fonte, para o endereço 
# de destino.
#
#########################################################
.data
	fonte: 		.asciiz "Dog"	
	destino: 	.asciiz ""
	quantidade: 	.word 0
.text
	la   $t0, fonte
	la   $t1, destino
	la   $t2, quantidade
	
loop:	lb   $t3, 0($t0)	# carrega o byte atual em $t3
	beq  $t3, 0, then	# if($t3 == 0)
	
	
	sb   $t3, 0($t1) 	# armazena o byte no destino
	add  $t1, $t1, 1	# destino++
		
	add  $t0, $t0, 1	# $t0 += 1
	add  $t4, $t4, 1	# $t4 += 1, sendo $t4 o contador
	
	j   loop

then:
	sw   $t4, quantidade	# armazena a contagem no endereço da label "quantidade"
