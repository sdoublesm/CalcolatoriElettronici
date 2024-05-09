.data   
var:    .word   0x3FFFFFF0
.text   
        .globl  main
        .ent    main
main:   
    lw      $t1,    var
    add     $t1,    $t1,    $t1
    addi    $a0,    $t2,    0
    li      $v0,    1
    syscall
    li      $t2,    0
    add     $t3,    $t1, $t2
#   ponendo 40 nel registro $t2 e poi sommando $t1 e $t2
# ! non si verifica OVERFLOW
    li      $v0,    10
    syscall 
        .end    main

# Quando il risultato dell’operazione genera overflow,
# ADD e ADDI scatenano un’eccezione, interrompendo l’esecuzione del programma corrente.
# ADDU e ADDIU non scatenano alcuna eccezione: in questo, caso per verificare l’overflow in Ca2, 
# è possibile confrontare il segno del risultato con quello
# degli operandi (se la somma di due operandi con lo
# stesso segno produce un risultato di segno opposto,
# c'è overflow). 