#########################################################
# Laboratório 03 - MCP22105
# Estruturas de Controle
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Faça um programa que leia o conteúdo da posição de 
# memória 0x10010000 e armazene-a na posição 0x10010004 
# se ela for positiva, ou 0x10010008 se for negativa.
#

.data	0x10010000
	A:  .word 3
	
.text
	la  $t0, A		# armazena em $t0 o endereço de A
	lw  $t1, 0($t0)		# lê o valor armazenado em A e o salva em $t1

	bgt $t1, 0, then 	# se o valor armazenando em A é > 0
	sw  $t1, 8($t0)   # armazena o valor de A no segundo espaço consecutivo 
	j   end		
then:	
	sw  $t1, 4($t0)		# armazena o valor de A na próximo espaço de memória
end:
#########################################################



#########################################################
# Faça um programa que teste se o conteúdo da posição de 
# memória 0x10010000 e 0x10010004 são iguais e, em caso 
# positivo, armazene o valor na posição 0x10010008.
#
#########################################################


#########################################################
# Faça um programa que leia o conteúdo da posição de 
# memória 0x10010000 e 0x10010004 e, armazene o maior 
# deles na posição 0x10010008.
#
#########################################################


#########################################################
# Faça um programa que leia 3 notas dos endereços 
# 0x10010000, 0x10010004 e 0x10010008 e, sabendo que a 
# média é 7, armazene 1 no endereço 0x1001000C caso ele 
# esteja aprovado ou no endereço 0x10010010 caso ele 
# esteja reprovado.
#
#########################################################


