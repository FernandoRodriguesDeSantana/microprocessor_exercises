#########################################################
# Laboratório 02 - MCP22105
# Alocação de dados em memória e Chamada de Sistemas
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Faça um programa que solicite dois números para o
# usuário e exiba a soma destes dois números
#
#########################################################

.data

messagea: .asciiz "Enter a integer number: \n"
messageb: .asciiz "Enter another integer number: \n"

.text

li $v0, 4
la $a0, messagea
syscall

li $v0, 5
move $a0, $t3
syscall
move $t3, $v0

li $v0, 4
la $a0, messageb
syscall

li $v0, 5
move $a0, $t4
syscall
move $t4, $v0

add $t2, $t3, $t4
li $v0, 1
move $a0, $t2
syscall
li $v0, 10
syscall

