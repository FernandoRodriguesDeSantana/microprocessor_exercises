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
	B: .word 1
.text
	li $t1, 1
	li $t2, 2
	
loop:		rem  $t0, $t2, 2   # B % 2
		beq  $t0, 0, then  # (B % 2) == 0
		j,  end
	then:   addi $t1, $t1, 1
	end:    addi $t2, $t2, 1
		blt  $t1, 10, loop
#########################################################
	
