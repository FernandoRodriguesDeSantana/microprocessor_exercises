#Elaborar uma programa para realizar as 4 operações básicas de soma, subtração, divisão e multiplicação, utilizando operações com ponto flutuantes.

# acumullator = $f0
.data
	number1:	.float 3.3
	number2:	.float 4.6
	number_zero:	.float 0
	show_option:	.asciiz "1.Show acumullator\n2.Reset acumullator\n3.Add\n4.Subtration:\n5.Division\n6.Multiplication\n7.Exit\n	>Option: "
.text
	lwc1	$f2, number1
	lwc1	$f4, number2
	lwc1	$f1, number_zero
	
	main:
		loop:
			# show menu:
			li $v0, 4	# syscall 4 = printf()
			la $a0, show_option
			syscall
			# read the option:
			li $v0, 5	# syscall 5 = scanf()
			syscall
			move $t0, $v0
			# chosen option:
			beq  $t0, 1, option1
			beq  $t0, 2, option2
			beq  $t0, 3, option3
			beq  $t0, 4, option4
			beq  $t0, 5, option5
			beq  $t0, 6, option6
			beq  $t0, 7, option7
			
			option1:
				li $v0, 2
				mov.s $f12, $f0
				syscall
				j  loop
			option2:
				lwc1 $f0, number_zero
				j  loop 
			option3:
				add.s $f0, $f2, $f4
				j  loop
			option4:
				sub.s $f6, $f2, $f4
				add.s $f0, $f0, $f6
				j  loop			
			option5:
				div.s $f6, $f2, $f4
				add.s $f0, $f0, $f6
				j  loop
			option6:
				mul.s $f6, $f2, $f4
				add.s $f0, $f0, $f6
				j  loop
			option7:				
				li $v0, 10
				syscall			
