
#########################################################
# Laboratório 02 - MCP22105
# Alocação de dados em memória e Chamada de Sistemas
#
# Aluno: Fernando Rodrigues de Santana
#########################################################

#########################################################
# Faça um programa no MARS, utilizando as chamadas de 
# sistema que implementa um papagaio :)
#
# O programa simplesmente imprime no terminal a mesma 
# frase que foi digitada.
#
#  # Diga alguma coisa que eu irei dizer também!
#  # Entre com o seu texto: ...
#  # O seu texto é: ...
#
#########################################################

.data 
storage: .space 100
text: .ascii "Enter a text\n"
display: .ascii "This is your text\n"
.text
li $v0, 4
la $a0, text
syscall

li $v0, 8
la $a0, storage
li $a1, 100
syscall

li $v0, 4
la $a0, display
syscall
li $v0, 4
la $a0, storage
syscall
li $v0, 10
syscall
