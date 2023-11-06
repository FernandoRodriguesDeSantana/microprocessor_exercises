#########################################################
# Laboratório 03 - MCP22105
# Procedimentos
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Um número é dito quadrado perfeito, se puder ser escrito 
# como o quadrado de um número natural (Ex. 1, 4, 9, 16, 25). 
# É possível (embora não muito prático) calcular o quadrado 
# perfeito de um número natural de forma recursiva, conforme 
# o algoritmo abaixo:
#
# int q_perfeito(int n){ 
#     if(n == 0) {
#         return n; 
#     } else {
#         return q_perfeito(n-1) + 2*n - 1; 
#     }
# }
#
# Implemente a função do quadrado perfeito apresentada acima, 
# e faça um programa que irá apresentar os valores do quadrado 
# perfeito dos primeiros 10 números naturais. Utilize as chamadas 
# de sistema para a entrada e saída de dados. O código deve ser 
# implementado seguindo a convenção de chamada de procedimento 
# estudada em sala de aula.
#########################################################
.include "macros.inc"
.text 0x00400000
init:
	la $sp, 0x7FFFEFFC
	jal main
	exit
.include "string.inc"

main:
	addiu $sp, $sp, -16
	sw    $s0, 4($sp)
	sw    $s1, 8($sp)
	sw    $ra, 12($sp)

	li $s0, 11
main_L0:
	beqz $s0, main_L0_end
	addi $s0, $s0, -1
	
	print_str("Quadrado (")
	print_intReg($s0)
	print_str(")= ")
	
	move $a0, $s0
	jal  quadrado
	move $s1, $v0
	
	print_intReg($s1)
	print_str("\n")
	
	j main_L0
main_L0_end:
  	lw	$ra, 12($sp)
  	lw    $s1, 8($sp)
  	lw    $s0, 4($sp)
	addiu $sp, $sp, 16
	jr $ra
	
quadrado:
	addiu $sp, $sp, -8	
	sw   $ra, 4($sp)	

	li   $v0, 0
	beqz $a0, then
	
	sw   $a0, 8($sp)		
	addi $a0, $a0, -1
	jal  quadrado
	
	lw   $a0, 8($sp)
	sll  $a0, $a0, 1

	add  $v0, $a0, $a0
	addi $v0, $v0, -1
then:
	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr $ra