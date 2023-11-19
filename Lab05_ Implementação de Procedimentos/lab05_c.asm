#########################################################
# Laboratório 03 - MCP22105
# Procedimentos
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Implemente como procedimento para ordenar um vetor de
# inteiros na memória. O procedimento de ordenação utilizado
# pode ser o BubbleSort, conforte o algoritmo abaixo:
#
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
#
# Além do procedimento, implemente também um código para
# testar a função implementada
#
#########################################################]
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

#	int i; # t0
	li   $t0, 0
	
#	int j; # t1
	li   $t1, 0

#	int k = size - 1 ; # t2
	addi $t2, $a1, -1  
	
#   	for(i = 0; i < size; i++) {
	bge  $t0, $a1, then1
	addi $t0, $t0, 1 #i++
	then1:
	
#        for(j = 0; j < k; j++) {
	bge  $t1, $t2, then2
	addi $t1, $t1, 1 #j++
	addi $t2, $t2, -1
	then2:
#         if(v[j] > v[j+1]) {
	addi $t4, $t1, 1   #j+1
	sll  $t4, $t4, 2   #j+1
	sll  $t1, $t1, 2   #j*4 -> tamanho de 1 byte
	add  $t3, $a0, $t1 #v[j] 
	lb   $t3, 0($t3)   #v[j]
	lb   $t4, 0($t4)   #v[j+1]
	
#             aux = v[j];
	add  $t5, $t3, $zero	#aux = $t5

#             v[j] = v[j+1];
	add  $t3, $t4, $zero	

#             v[j+1] = aux;
	add  $t4, $t5, $zero
	jr $ra













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

#	int i; # t0
	li   $t0, 0
	
#	int j; # t1
	li   $t1, 0

#	int k = size - 1 ; # t2
	addi $t2, $a1, -1  
	
#   	for(i = 0; i < size; i++) {	
	bge  $t0, $a1, end
	addi $t0, $t0, 1   #i++
	
#       for(j = 0; j < k; j++) {
	bge  $t1, $t2, end
	addi $t1, $t1, 1   #j++ 	

#       if(v[j] > v[j+1]) {
	
end:
	jr $ra
