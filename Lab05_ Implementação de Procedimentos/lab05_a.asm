#########################################################
# Laboratório 03 - MCP22105
# Procedimentos
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# O fatorial de um número pode ser calculado através de 
# um procedimento recursivo, conforme definido abaixo:
#
# unsigned int fatorial(unsigned int n){ 
#     if(n == 0) {
#         return 1; 
#     } else {
#         return n * fatorial(n-1); 
#     }
# }
#
# Implemente a função fatorial apresentada acima, 
# e faça um programa que irá apresentar o fatorial dos 
# primeiros 10 números naturais. Utilize as chamadas de 
# sistema para a entrada e saída de dados. O código deve 
# ser implementado seguindo a convenção de chamada de 
# procedimento estudada em sala de aula.
#########################################################
.include "macros.inc"
.text 0x00400000
init:
	la $sp, 0x7FFFEFFC
	jal main
	exit
.include "string.inc"

#-----------
# ($a0) old_stk -> 16($sp)
#-----------
#   $ra         -> 12($sp)
#-----------
#   $s1         -> 8($sp)
#-----------
#   $s0         -> 4($sp)
#-----------
#   $a0         -> 0($sp)
#############################################
main:
	addiu $sp, $sp, -16
	sw    $s0, 4($sp)
	sw    $s1, 8($sp)
	sw    $ra, 12($sp)

	li $s0, 11 #
main_L0:
	beqz $s0, main_L0_end
	addi $s0, $s0, -1
	
	print_str("fatorial(")
	print_intReg($s0)
	print_str(") = ")
	
	move $a0, $s0
	jal  fatorial
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
############################################
fatorial:
	addi $sp, $sp, -8	#aloca��o din�mica de mem�ria
	sw   $ra, 4($sp)	#endere�o de $ra armazenado na 2� posi��o de $sp
	sw   $a0, 0($sp)	#argumento n armazenado na 1� posi��o de $sp
	
	bnez $a0, else		
	addi $v0, $zero, 1	#$v0 retorna 1
	addi $sp, $sp, 8	#desaloca��o de mem�ria
	jr   $ra		#volta para o endere�o armazenado em $ra
else:
	addi $a0, $a0, -1	#itera��o do argumento
 	jal  fatorial		#la�o de repeti��o
 
	lw   $a0, 0 ($sp)	#argumento n armazenado na 1� posi��o de $sp
	lw   $ra, 4 ($sp)	#endere�o de $ra armazenado na 2� posi��o de $sp
	addi $sp, $sp, 8 	#desaloca��o de mem�ria
	mul  $v0, $a0, $v0	#multiplica��o fatorial
	jr   $ra
	
######################
# unsigned int fatorial(unsigned int n){ 
#     unsigned int ret;
#     if(n == 0) {
#         ret = 1; 
#     } else {
#         ret = n * fatorial(n-1); 
#     }
#		  return ret;
# }
#
#############################################
