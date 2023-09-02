l#########################################################
# Laboratório 03 - MCP22105
# Estruturas de Controle
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Converta para assembly os trechos de código C a seguir
# 
# Faça a alocação das variáveis na memória (.data)
#########################################################

#########################################################
# a = 0;
# b = 0;
# 
# do {
#   if ( b % 2 ){
#      a++;
#   }
#   b++;
# } while (a < 10)


# RESPOSTA:
.data 0x10010000
	A: .word 1
	B: .word 2
.text
	lw $t1, A
	lw $t2, B
	
loop:		rem  $t0, $t2, 2   # B % 2
		beq  $t0, 0, then  # (B % 2) == 0
		j,  end
	then:   addi $t1, $t1, 1
	end:    addi $t2, $t2, 1
		blt  $t1, 10, loop
#########################################################

#########################################################
# if ( ( a < b ) &&  ( c == d ) ) 
# {
#   a = a * (((c/b) * 2) + 10);
# } else {
#   a = a / ((c+4)/b);
# }
# a++;


# RESPOSTA
.data 0x10010000
	A: .word 1
	B: .word 2
	C: .word 3
	D: .word 4
.text
	lw $t1, A
	lw $t2, B
	lw $t3, C
	lw $t4, D
#   a = a * (((c/b) * 2) + 10);
	slt $t0, $t1, $t2
	seq $t5, $t3, $t4 
	and $t6, $t0, $t5
	beq $t6, 1, then
	j, end
then: 	
#########################################################
	
