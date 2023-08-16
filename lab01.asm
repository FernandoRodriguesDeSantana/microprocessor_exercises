#########################################################
# Laboratório 01 - MCP22105
# Expressões Aritméticas e Lógicas
#
# Aluno: Fernando Rodrigues de Santana
#########################################################
# Realize a conversão das expressões abaixo considerando
# que os valores das variáveis já estão carregados nos
# registradores, conforme o mapeamento indicado abaixo
#
# Mapeamento dos registradores:
# a: $t0, b: $t1, c: $t2, d: $t3, res: $t4
#########################################################
li $t0, 5
li $t1, 10
li $t2, 15
li $t3, 20
######################################
# res = a + b + c
add $t4, $t0, $t1
add $t4, $t4, $t2

######################################
# res = a - b - c
sub $t4, $t0, $t1
sub $t4, $t4, $t2

######################################
# res = a * b - c
mul $t4, $t0, $t1
sub $t4, $t4, $t2

######################################
# res = a * (b + c)


######################################
# res = a + (b - 5)


######################################
# res = ((b % 2) == 0)


######################################
# res = (a < b) && (((a+b) % 3) == 10)


######################################
# res = (a >= b) && (c != d)


######################################
# res = (((a/2)+1) > b) || (d == (b-a))
