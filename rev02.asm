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
li $s0, 4 # a
li $s1, 3 # b
li $s2, 1 # c
li $s3, 5 # d
li $s4, 3 # i

	bne  $s0, $s1, then1 # if(a != b)
	
loop:	add  $s1, $s1, $s4 # b = b + i
 	addi $s4, $s4, 2 # i = i + 2
 	blt  $s4, 15, loop # for(int i = 3; i < 15; i += 2)
 	j    end
then1: 
	la   $s0, ($s1)	# a = b
	
	blt  $s2, 3, then2 # if(c < 3)
then2:  addi $s0, $s0, 1 # a = a + i
end:
