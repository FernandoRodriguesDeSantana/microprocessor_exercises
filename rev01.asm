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
li $t3, 8  #i
li $t4, 16 #j
######################################
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

######################################
# B[f+g] = A[i] / (A[j] - B[j])

