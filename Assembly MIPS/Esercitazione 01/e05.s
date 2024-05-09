.data
msg: .asciiz "Inserisci un numero: "
.text
.globl main
.ent main
main:
la $a0, msg
li $v0, 4
syscall
li $v0, 5
syscall
add $t1, $v0, $0
li $v0, 4
syscall
li $v0, 5
syscall
add $t2, $v0, $0

# scambio il contenuto di t1 e t2
# senza l'utilizzo di altri registri
add $t1, $t1, $t2
sub $t2, $t1, $t2
sub $t1, $t1, $t2

# 5 11 11 6
# 6  6  5 5


li $v0, 10
syscall
.end main