#########################################################
# Realize a conversão das expressões abaixo considerando
# que os valores das variáveis já estão carregados nos
# registradores, conforme o mapeamento indicado abaixo
#
# Mapeamento dos registradores:
# a: $s0, b: $s1, c: $s2, d: $s3
#########################################################

#########################################################
# if (a != b) {
#    a = b;
#    if( c < 3 ){
#      a++;
#    } else {
#      for(int i = 3; i < 15; i += 2) {
#         b += i;
#      }
#    }
# }
#########################################################
li $s0, 3 # a
li $s1, 4 # b
li $s2, 2 # c
li $s3, 5 # d
li $s4, 3 # i

	bne $s0, $s0, then1:

then1: 
 	  
