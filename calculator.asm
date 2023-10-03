#Elaborar uma programa para realizar as 4 operações básicas de soma, subtração, divisão e multiplicação, utilizando operações com ponto flutuantes.

# acumullator = result = $f12
.data
	number_zero:	.float 0
	show_option:	.asciiz "1.Show acumullator\n2.Reset acumullator\n3.Add\n4.Subtration:\n5.Division\n6.Multiplication\n7.Exit\n	>Option: "
	prompt1:	.asciiz "\nEnter the first number: "
	prompt2:	.asciiz "\nEnter the second number: "

.text
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

			beq  $t0, 1, option1
			beq  $t0, 2, option2
			beq  $t0, 7, option7
			
			# asking the first number
			li $v0, 4
			la $a0, prompt1
			syscall
			li $v0, 6
			syscall
			mov.s $f14, $f0
			
			# asking the second number
			li $v0, 4
			la $a0, prompt2
			syscall
			li $v0, 6
			syscall
			mov.s $f16, $f0

			# chosen option:
			beq  $t0, 3, option3
			beq  $t0, 4, option4
			beq  $t0, 5, option5
			beq  $t0, 6, option6
			
			option1:		# show acumullator
				li $v0, 2
				mov.s $f12, $f12
				syscall
				j  loop
			option2:		# reset acumullator
				lwc1 $f12, number_zero
				j  loop 
			option3:		# add operation
				add.s $f12, $f14, $f16
				j  loop
			option4:		# sub operation
				sub.s $f6, $f14, $f16
				add.s $f12, $f12, $f6
				j  loop			
			option5:		# div operation
				div.s $f6, $f14, $f16
				add.s $f12, $f12, $f6
				j  loop
			option6:		# mul operation
				mul.s $f6, $f14, $f16
				add.s $f12, $f12, $f6
				j  loop
			option7:		# exit
				li $v0, 10
				syscall			
