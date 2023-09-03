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
	Size:	        .word 10	         # tamanho do Array	
	Search:	      .word 7          # procurando um elemento pertencente a Array 		
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
#########################################################

