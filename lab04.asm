# void changeCase(char * str, bool type);
#
#  A função deve converter as letras da string
# para maiúsculo ou minúsculo, conforme o segundo
# parâmetro type (0 - minúsculo, 1-maiúsculo). 
#
#  As letras minúsculas estão entre os valores 97(a) e
# 122(z), e as letras maiúsculas entre os valores
# 65(A) e 90(Z). A conversão pode ser feita somando
# ou subtraindo a diferença entre esses valores.

.data
	word: .asciiz "MicRoPROcesSoRS"
	
.text
	la $a0, word
	
	
	
	changeCase:
	
	jr $ra	
