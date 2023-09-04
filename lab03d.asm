#########################################################
# Laboratório 03 - MCP22105
# Estruturas de Controle
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Uma cadeia de caracteres (string) é definida como um 
# conjunto de bytes, ordenados de forma consecutiva na 
# memória, terminada por um caractere nulo (byte 0). Faça 
# um programa que receba o endereço do início de uma string 
# e calcule o seu tamanho (número de caracteres). O 
# endereço da string é armazenado no endereço 0x10010000. 
# Armazene o resultado no endereço de memória 0x10010004.
#

.data	0x10010000
	Adress: .word 0x10010000
	Result:	.word 0x10010004
	
.data	0x10010020
	Word: .asciiz "Microprocessadores"
	
.text
	la $t0, Word		# carregando em $t0 o endereço da string "Word"
	sw $t0, Adress		# carregando este endereço em 0x10010000

#########################################################
