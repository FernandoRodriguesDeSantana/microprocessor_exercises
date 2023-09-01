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

#########################################################
# Realize a conversão das expressões abaixo considerando
# que os valores das variáveis já estão carregados nos
# registradores, conforme o mapeamento indicado abaixo
#
# Mapeamento dos registradores:
# i: $s3, j: $s4
# Endereço base dos vetores: A: $s6 e B: $s7
#########################################################

.data
A: .word 0,1,2,3,4,5,6,7,8,9,10
B: .word 10,9,8,7,6,5,4,3,2,1,0
i: .word 5
j: .word 3

.text
la $s6, A
la $s7, B
la $s3, i
la $s4, j

#########################################################
# B[8] = A [i-j]

sub $t0, $s6, $s7
sll $t0, $t0, 2
add $s6, $s6, $t0
lw $t1, 0($t0)
sw $t1, 32($s7)
#########################################################


#########################################################
# B[32] = A[i] + A[j]
#
#########################################################
