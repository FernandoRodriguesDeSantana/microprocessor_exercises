.macro print_str_ptr (%ptr)
  li $v0, 4
  la $a0, %ptr
  syscall
.end_macro

.macro print_str (%str)
.data
mStr: .asciiz %str
.text
   li $v0, 4
   la $a0, mStr
   syscall
.end_macro

.macro print_int_reg (%reg)
  move $a0, %reg
  li $v0, 1
  syscall
.end_macro

.macro get_str (%ptr, %max_size)
  li $v0, 8
  la $a0, %ptr
  li $a1, %max_size
  syscall
.end_macro

.macro get_int(%reg)
	li $v0, 5
	syscall
	move %reg, $v0
.end_macro

.macro exit
   li $v0, 10
   syscall
.end_macro

.data
str1:       .asciiz "MCP22105 is cool"

.text
	print_str("Str1: ")
	print_str_ptr(str1)		#PONTEIRO EM 0x10010011 ("Str1:")
	print_str("\n")
	
	## Chamar strlen
	la $a0, str1			#CARREGA O ENDEREÇO 0X10010000 (FRASE) EM $a0 
	jal strlen			#JUMP AND LINK PARA A FUNÇÃO STRLEN
	move $s0, $v0			#s0 RECEBE O CONTEÚDO DE $v0 (QTD DE LETRAS)
	
	print_str("A str1 tem ")
	print_int_reg($s0)		#EXIBE NO PROMPT A QTD DE LETRAS
	print_str(" caracteres\n")
	
	## Resize str1
	la $a0, str1			#CARREGA O ENDEREÇO DA FRASE STR1 EM $a0
	li $a1, 17			#PARÂMETRO RESIZE (QTD DE LETRAS)DA FUNÇÃO STRRESIZE
	jal strResize
	
	print_str("\nStr1 ajustada: ")
	print_str_ptr(str1)
	print_str("\n")
	
	## Chamar strlen
	la $a0, str1
	jal strlen
	move $s0, $v0
	print_str("A str1 ajustada tem ")
	print_int_reg($s0)
	print_str(" caracteres\n")
	
	
	print_str("Final do programa\n")
	exit

#############################################	
# int strResize(char * str, int size);
#
#  O procedimento deve modificar o tamanho da string
# de acordo com o tamanho especificado pelo parâmetro
# size. O size deve ser sempre menor que o tamanho
# atual da string.
#
#  O procedimento retorna o valor -1, caso o size seja
# maior que o tamanho da string, ou o novo tamanho da
# string, caso contrário, ou seja, o próprio valor de
# size.
#
strResize:
	.data 0x10010080
	nullStr: .asciiz ""	#CARACTER NULO PARA APAGAR LETRAS DA FRASE
	returnValue:  .word -1
	.text
	#$a0 POSSUI O ENDEREÇO DA FRASE
	sub $t3, $s0, $a1	#QTD DE LETRAS A SER ELIMINADA
	bltz $t3, end
	add $a0, $a0, $s0	#SOMA O ENDEREÇO COM A QTD DE LETRAS. SERVE COMO UM PONTEIRO PARA A ÚLTIMA LETRA DA FRASE
	sub $a0, $a0, 1		#ELIMINA O OFFSET DE 1 
	lb $t1, nullStr
	#lb $t1, 0($a0)		#CARREGA A LETRA ARMAZENADA NO ENDEREÇO 0x100100XX
	
loop:	sb $t1, 0($a0)		#CARREGA OPERADOR NULO NO LUGAR DE UMA LETRA
	sub $a0, $a0, 1		#JUMP PARA A LETRA ANTERIOR
	addi $t2, $t2, 1	#CONTADOR
	bne $t2, $t3, loop
	
	jr $ra
end:
	li $v0, 1
	la $a0, returnValue		#RETORNA -1 SE QTD DE LETRAS A ELIMINAR FOR MAIOR DO QUE A QTD DE LETRAS DA FRASE	
	lw $a0, ($a0)
	syscall
	jr $ra		
	
#############################################

#############################################	
# int strlen(char * str) {
#   int len = 0;
#   while ( *str != 0 ){
#     str = str + 1;
#     len = len + 1;
#   }
#   return len;
#}
strlen:
	li $v0, 0 # len = 0
	strlen_L0:
		lb   $t0, 0($a0)
		beq  $t0, $zero, strlen_L0_exit
		addi $a0, $a0, 1
		addi $v0, $v0, 1
		j strlen_L0
	strlen_L0_exit:
	jr $ra
#############################################
