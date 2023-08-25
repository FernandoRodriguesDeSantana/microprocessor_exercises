#########################################################
# Laboratório 02 - MCP22105
# Alocação de dados em memória e Chamada de Sistemas
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Considere o seguinte programa em linguagem 
# Assembly do MIPS
#
#    .data 0x10010400 # segmento de dados
#      palavra1: .word 13
#      palavra2: .word 0x15
#
# Indique, em hexadecimal, os endereços de memória dos 
# símbolos palavra1 e palavra2


# RESPOSTA: 
# Uma palavra (.word) ocupa 4 bytes na memória.
# Dessa forma, o endereço de palavra1 será: 0x10010400,
# ocupando os primeiros 4 bytes deste segmento de endereço base

 # Portanto, o endereço de palavra2 será: 0x10010404
##########################################################

#########################################################
# Considere o seguinte programa em linguagem 
# Assembly do MIPS
#
#    .data 0x10010800 # segmento de dados
#
#      variavel_a: .word 13
#      nums:       .word 2, 6, 8, 5, 98, 74, 28
#
# Indique, em hexadecimal, o endereço do elemento com o
# valor 74 do vetor nums


# RESPOSTA:

# adress(variavel_a) = 0x10010800
# adress(nums[0]) = 0x10010804
# adress(nums[1]) = 0x10010808
# adress(nums[2]) = 0x1001040C
# adress(nums[3]) = 0x10010410
# adress(nums[4]) = 0x10010414
# adress(nums[5]) = 0x10010418 -> endereço do elemento com o valor 72
# adress(nums[6]) = 0x1001041C
##########################################################
