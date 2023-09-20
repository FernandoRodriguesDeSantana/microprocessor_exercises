#########################################################
# Qual é o valor do registrador $s0 após a execução das 
# instruções abaixo? O registrador $s1 possui o valor 
# 0x0000FEFE. Apresente a sua resposta em hexadecimal.
#########################################################
R: O valor final de $s0 será 14 enquanto que o de $s1 será 0
#########################################################
	add  $s0, $0, $0	# $s0 = 0
LOOP:	
	beq  $s1, $0,  DONE	# if($s1 == 0)
	# ELSE:
	andi $t0, $s1, 0x01	# $s1 && 0x01

	beq  $t0, $0, SKIP	# if($t0 == 0)
	# ELSE: 
	addi $s0, $s0, 1	# $s0++
SKIP:
	srl  $s1, $s1, 1	# $s1 / 2
	j    LOOP
DONE:
#########################################################

#########################################################
	addi $t0, $0, 12	# $t0 += 12
	sll  $t0, $t0, 4	# $t0 * 16
	xori $t0, $t0, 10	# if($t0 != 10): $t0 <- 1
	sll  $t0, $t0, 8	# $t0 * 256
	xori $t0, $t0, 255	# if($t0 != 255): $t0 <- 1
	and  $s0, $s1, $t0	# if(s1 == $t0): $s0 <- 1
R: $s0 = 51966 e $s1 = 65278
#########################################################


