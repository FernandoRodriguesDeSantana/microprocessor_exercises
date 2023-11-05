#########################################################
# LaboratÃ³rio 03 - MCP22105
# Procedimentos
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# O fatorial de um nÃºmero pode ser calculado atravÃ©s de 
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
# Implemente a funÃ§Ã£o fatorial apresentada acima, 
# e faÃ§a um programa que irÃ¡ apresentar o fatorial dos 
# primeiros 10 nÃºmeros naturais. Utilize as chamadas de 
# sistema para a entrada e saÃ­da de dados. O cÃ³digo deve 
# ser implementado seguindo a convenÃ§Ã£o de chamada de 
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
	addi $sp, $sp, -8	#alocação dinâmica de memória
	sw   $ra, 4($sp)	#endereço de $ra armazenado na 2ª posição de $sp
	sw   $a0, 0($sp)	#argumento n armazenado na 1ª posição de $sp
	
	bnez $a0, else		
	addi $v0, $zero, 1	#$v0 retorna 1
	addi $sp, $sp, 8	#desalocação de memória
	jr   $ra		#volta para o endereço armazenado em $ra
else:
	addi $a0, $a0, -1	#iteração do argumento
 	jal  fatorial		#laço de repetição
 
	lw   $a0, 0 ($sp)	#argumento n armazenado na 1ª posição de $sp
	lw   $ra, 4 ($sp)	#endereço de $ra armazenado na 2ª posição de $sp
	addi $sp, $sp, 8 	#desalocação de memória
	mul  $v0, $a0, $v0	#multiplicação fatorial
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
