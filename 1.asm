# c = (a < b) ||  ((a+b)==10)
# a: t0, b: t1, c: t2

add $t3, $t0, $t1 # temporary memory (a + b)
li $t4 10 # store the number 10 in the register $t4
seq $t3, $t3, $t4 # if the number in $t3 (second $t3) is equal to $t4 then set to 1 the register $t3 (first $t3)
slt $t2, $t0, $t1 # if the number in $t0 is less than the number in $t1 then set $t2 to 1
or $t2, $t2, $t3
