.data   
input:  .asciiz "Introduci un numero: "
.text   
        .globl  main

# -- main 
        .ent    main

main:   
    subu    $sp, $sp, 4
    sw      $ra, 0($sp)       # main no leaf, salvo nello stack indirizzo di ritorno
    la      $a0, input
    li      $v0, 4
    syscall 
    li      $v0, 5
    syscall 
    move    $a0, $v0
    jal     calcolaSuccessivo
    lw      $ra, ($sp)       # ripristino return address di uscita salvato inizialmente
    addiu   $sp, $sp, 4
    jr      $ra
    
        .end    main

# -- calcolaSuccessivo
        .ent    calcolaSuccessivo

calcolaSuccessivo:
    li      $t0, 2
    div     $a0, $t0
    mfhi    $t1
    beqz    $t1, pari

    li      $t1, 3
    mul     $v0, $a0, $t1
    addi    $v0, $v0, 1
    j       endcs

pari:   
    div     $a0, $t0
    mflo    $v0

endcs:  
    move    $a0, $v0
    li      $v0, 1
    syscall 

    li      $a0, '\n'
    li      $v0, 11
    syscall 

    jr      $ra

        .end    calcolaSuccessivo