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
