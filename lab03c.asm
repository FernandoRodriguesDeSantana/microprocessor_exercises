#########################################################
# Laboratório 03 - MCP22105
# Estruturas de Controle
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Faça um programa para buscar um determinado valor em um 
# array de inteiros. O endereço inicial do vetor está 
# armazenado no endereço de memória 0x10010000, o tamanho 
# do vetor está no endereço 0x10010004 e valor que será 
# pesquisado está no endereço 0x10010008. Caso o valor 
# seja encontrado, escreva 0x01 no endereço 0x1001000C, 
# caso contrário, escreva 0x00.
#

.data	0x10010020    # armazenando o vetor a partir do endereço 0x10010020	
	Array: 	      .word 0,1,2,3,4,5,6,7,8,9

.data 	0x10010000    
	Array_Adress: .word 0x10010020 # armazenando o endereço de Array[0] no endereço 0x10010000
	Size:	      .word 10         # tamanho do Array	
	Search:	      .word 5          # procurando um elemento pertencente a Array 
	Result:	      .word 0x1001000C		
.text
	lw  $t0, Search		# número a ser procurado
	la  $t1, Array		# endereço do Array[i]
	
loop:	lw  $t2, 0($t1)		# valor contido no endereço do Array[i]
	beq $t0, $t2, then	# if(num == num_search)
	add $t1, $t1, 4		# adiciona 4 ao endereço contido em $t1
	li  $a0, 0x00		# armazenando o valor 0x00 em $a0
	sw  $a0, Result		# escrevendo o valor de $a0 = 0x00 em 0x1001000C
	j   loop
	
then:  	li $a1, 0x01		# armazenando o valor 0x01 em $a1
	sw $a1, Result		# escrevendo o valor de $a1 = 0x01 em 0x1001000C
#########################################################


#########################################################
# Faça um programa para contar o número de elementos 
# encontrados em um array de inteiros. O endereço inicial 
# do vetor está armazenado no endereço de memória 0x10010000, 
# o tamanho do vetor está no endereço 0x10010004 e valor que 
# será contado está no endereço 0x10010008. Armazene no 
# endereço 0x1001000C o número de elementos encontrados 
# na procura.
#
.data	0x10010000
	Array_Adress:	.word 0x1001020
	Array_Size:	.word 10
	Array_Count:	.word 10
	Array_Counted:	.word 0x1001000C

.data	0x10010020
	Array:		.word 0,1,2,3,4,5,6,7,8,9

.text
	la $t0, Array			# Armazena o endereço do array em $t0
	lw $t1, 0($t0)			# Armazena o valor contido no respectivo endereço em $t1
	
#########################################################

