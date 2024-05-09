.data   
sinput: .asciiz "Inserisci un intero positivo: "
spari:  .asciiz "Il numero e' pari."
sdisp:  .asciiz "Il numero e' dispari."
.text   
        .globl  main
        .ent    main
main:   
    la      $a0,    sinput
    li      $v0,    4
    syscall 
    li      $v0,    5
    syscall 
    andi    $t0,    $v0,        1
    la      $a0,    spari
    beq     $t0,    $0,          ending
    la      $a0,    sdisp
ending: 
    li      $v0,    4
    syscall 
    li      $v0,    10
    syscall 
        .end main