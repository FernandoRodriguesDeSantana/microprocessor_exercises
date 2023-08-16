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

# Eu, Fernando, declarei o registrador $t5 como um registrador para armazenamento temporário
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

add $t4, $t1, $t2
mul $t4, $t4, $t0

######################################
# res = a + (b - 5)

li $t5, -5
add $t4, $t1, $t5 # Soma do tipo x + (-Y)
add $t4, $t4, $t0
li $t4, 0

######################################
# res = ((b % 2) == 0)

# FORMA NÃO OTIMIZADA:
#li $t5, 2
#div $t1, $t5
# mflo $t5 # Copia o valor de $lo (quociente) para $t5
#mfhi $t4 # Copia o valor de $hi (resto) para o $t4
#seq $t4, $t4, 0

# FORMA OTIMIZADA:
sra $t4, $t1, 1

######################################
# res = (a < b) && (((a+b) % 3) == 10)


######################################
# res = (a >= b) && (c != d)


######################################
# res = (((a/2)+1) > b) || (d == (b-a))
