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
	Array_Adress:	.word 0
	Array_Size:	.word 0
	Array_Count:	.word 0
	Array_Counted:	.word 0

.data	0x10010020
	Array:		.word 1,2,3,4,5,6,7,8,9,10
	
.text
	la $t0, Array   	# armazenando o endereço inicial do array em $t0
	sw $t0, Array_Adress	# armazenando este endereço em 0x10010000
	
	li $t1, 5		# valor a ser contado
	sw $t1, Array_Count	# armazenando este valor em 0x10010004
	
	
	# Contabilizando o tamanho do Array:
loop:	lw  $t2, 0($t0)		# valor contido no endereço 0x10010000 (+4)
	beq $t2, 0, then	# if($t2 == 0)
			
				# ELSE
	add $t0, $t0, 4		# pula para o próximo endereço
	add $t3, $t3, 1		# contador de 1 em 1
	j   loop
	
then:  	sw $t3, Array_Size
	
	la $t0, Array
	
	
	# Procurando o número do Array_Count
loop2:	lw  $t2, 0($t0)		# valor contido no endereço 0x10010000 (+4)
	beq $t2, $t1, then2	# if($t2 == 5)
			
				# ELSE
	add $t0, $t0, 4		# pula para o próximo endereço
	add $t4, $t4, 1		# contador de 1 em 1
	j   loop2
	
then2:  sw $t4, Array_Counted
#########################################################


