#########################################################
# Realize a conversão das expressões abaixo considerando
# que os valores das variáveis já estão carregados nos
# registradores, conforme o mapeamento indicado abaixo
#
# Mapeamento dos registradores:
# f: $t0, g: $t1, h: $t2, i: $t3, j: $t4
# Endereço base A: $s0, Endereço base B: $s1
#########################################################
li $t0, 1  #f
li $t1, 2  #g
li $t2, 4  #h
li $t3, 2  #i
li $t4, 3  #j
######################################
.data
	A: .word 0,1,2,3,4
	B: .word 2,4,5,6,7
######################################
.text
# f = ((g+1) * h) - 3
addi $t1, $t1, 1	#g+1
sll  $t1, $t1, 2	#(g+1)*h
subi $t0, $t1, 3	#((g+1)*h)-3 
######################################
# f = (h*h + 2) / f - g
sll  $t2, $t2, 2	#h*h
addi $t2, $t2, 2	#(h*h)+2
sub  $t0, $t0, $t1	#f-g
div  $t0, $t2, $t0	#(h*h + 2) / f - g
######################################
# B[i] = 2 * A[i] 
.text
	sll $t3, $t3, 2	# Multiplicando o índice i por 4, já que o índice percorrerá a .word de 4 em 4 bytes
	la  $s0, A	# Carrega o endereço da .word A em $s0
	la  $s1, B	# Carrega o endereço da .word B em $s1
	
	# Algoritimo para percorrer  o vetor:
	# 0xXXXXXXXX + (4 bytes)*(i) 
	
	add $s0, $s0, $t3 # Soma 2*(4 Bytes) para percorrer o vetor até o endereço indicado pelo índice i
	lb  $t5,0($s0)	  # Carrega o valor contido no endereço armazenado em $s0 no reg. $t5
	sll $t5, $t5, 1	  # Multiplica por 2 o valor armazenado em $t5
	
	# Armazenando o valor de $t5 no B[i]
	add $s1, $s1, $t3 # Percorrendo o vetor i vezes
	sb  $t5, 0($s1)
######################################
# B[f+g] = A[i] / (A[j] - B[j])

