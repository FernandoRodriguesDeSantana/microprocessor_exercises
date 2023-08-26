#########################################################
# Laboratório 02 - MCP22105
# Alocação de dados em memória e Chamada de Sistemas
#
# Aluno: Fernando Rodrigues de Santana
#########################################################


#########################################################
# Faça um programa que imprime a cadeia de caracteres
# "Hello World!" em linguagem assembler para o MIPS
#
#########################################################

.data 
message: .ascii "Hello World"

.text

la $a0, message

li $v0, 4
syscall

li $v0, 10
syscall
