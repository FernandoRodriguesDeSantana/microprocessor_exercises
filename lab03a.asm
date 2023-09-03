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
	C: .word 4
	D: .word 5
.text
	lw $t1, A
	lw $t2, B
	lw $t3, C
	lw $t4, D

	slt $t0, $t1, $t2 # ( a < b )
	seq $t5, $t3, $t4 # ( c == d )
	and $t0, $t0, $t5 # ( a < b ) &&  ( c == d )
	beq $t0, 1, then # if ( ( a < b ) &&  ( c == d ) )

#	a = a / ((c+4)/b); ELSE BLOCK:
	add $t0, $t3, 4
	div $t0, $t0, $t2	
	div $t1, $t1, $t0

	j, end # go to a++

#	a = a * (((c/b) * 2) + 10); IF BLOCK:
then: 	div $t0, $t3, $t2
	mul $t0, $t0, 2
	add $t0, $t0, 10
	mul $t1, $t0, $t1

end:	add $t1, $t1, 1
#########################################################


#########################################################
# if ( a < 10 ) {
#   b = 20;
#   if ( a <= 5 ){
#     for(int i = 0; i < a; i++) {
#       b += a * i;
#     }
#   } else {
#       while( a-- > 5) {
#         b -= b / a;
#       }
#   }
# }
#########################################################
.data 0x10010000
	A: .word 7
	B: .word 2
	i: .word 0

.text
	lw $t1, A
	lw $t2, B
	lw $a0, i
	
	blt $t1, 10,  then	# if(a < 10)
then:	
	li  $t2, 20		# b = 20
	ble $t1, 5,   next	# if(a =< 5)

	bgt $t1, 5,   next3	# ELSE IF
next3:	
	loop2:
		ble $t1, 5,   end2
		div $a2, $t2, $t1 	# b / a
		sub $t2, $t2, $a2	# b -= b / a
		sub $t1, $t1, 1		# a--
		j   loop2
			
next:	blt $a0, $t1, next2	# for (int i = 0; i < a; i++)
	

next2:	
	loop: 	mul $a1, $t1, $a0	# a * i
		add $t2, $t2, $a1	# b += a * i
		add $a0, $a0, 1		# i++
		beq $a0, 5,   end 	# i = 5
		j loop
end:
end2:
	
