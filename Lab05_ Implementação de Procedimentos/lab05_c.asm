#########################################################
# Laboratório 03 - MCP22105
# Procedimentos
#
# Aluno: Fernando Rodrigues de Santana
#########################################################
.include "macros.inc"
.text 0x00400000
init:
	la $sp, 0x7FFFEFFC
	jal main
	exit
.include "string.inc"

.data
vetor:  .word 45,3,7,89,32,76

.data 0x10010020
vetorB: .word 78,2,6,90,124,76,34,71

.data 0x10010060
resultado: .word 
.text

#-----------
# ($a0) old_stk -> 16($sp)
#-----------
# <empty>      -> 12($sp)
#-----------
#   $ra        -> 8($sp)
#-----------
#   $a1        -> 4($sp)
#-----------
#   $a0        -> 0($sp)
#############################################
main:
	la    $s7, resultado
	addiu $sp, $sp, -16
	sw    $ra, 8($sp)

	la  $a0, vetor
	li  $a1, 6	
	jal bubble
	
	la  $a0, vetorB
	li  $a1, 8	
	jal bubble

	lw    $ra, 8($sp)
	addiu $sp, $sp, 16
	jr $ra

#########################################################
# void bubble(int* v, int size) {
#	int i; # t0
#	int j; # t1
#	int aux;
#	int k = size - 1 ; # t2
#
#   for(i = 0; i < size; i++) {
#      for(j = 0; j < k; j++) {
#         if(v[j] > v[j+1]) {
#             aux = v[j];
#             v[j] = v[j+1];
#             v[j+1] = aux;
#         }
#      }
#      k--;
#   }
# }
########################################################
bubble:
	addiu $sp,   $sp, -16
	sw    $a0,  0($sp)
	sw    $a1,  4($sp)
	sw    $ra,  8($sp)
	
#	int i; 
	li   $t0, 0
	
#	int j; 
	li   $t1, 0
	
#	int k = size - 1 ; # t2
	addi $t2, $a1, -1
	
#	int aux;
	li   $t3, 0
	
	loop:
#   	for(i = 0; i < size; i++) {
	bgt  $t0, $a1, end

#       for(j = 0; j < k; j++) {
	bgt  $t1, $t2, end

#       if(v[j] > v[j+1]) {
#		v[j]
		sll  $t4, $t1, 2
		add  $t5, $t4, $a0
		lb   $s0, 0($t5)	#v[j]
#		v[j+1]
		addi $t4, $t4, 4
		add  $t6, $t4, $a0
		lb   $s1, 0($t6)	#v[j+1]
		
		addi $t0, $t0, 1	#i++
		addi $t1, $t1, 1	#j++		
		
		blt  $s0, $s1, dontSwitch
#               aux = v[j];
		move $s2, $s0
#               v[j] = v[j+1];
		move $s0, $s1
#               v[j+1] = aux;
		move $s1, $s2
		 
		dontSwitch:
		sw   $s0, resultado
		j    loop
end:
