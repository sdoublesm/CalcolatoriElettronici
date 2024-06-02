.data   
input:  .asciiz "Introduci un numero: "
out:    .asciiz "Numero di elementi nella sequenza: "
.text   
        .globl  main

    # -- main
        .ent    main
main:   
    subu    $sp,                $sp,    4
    # main no leaf, salvo nello stack indirizzo di ritorno
    sw      $ra,                ($sp)         
    la      $a0,                input
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 
    move    $a0,                $v0
    jal     sequenzaDiCollatz
    move    $t0,                $v0
    la      $a0,                out
    li      $v0,                4
    syscall 
    move    $a0,                $t0
    li      $v0,                1
    syscall 
    # ripristino return address di uscita salvato inizialmente
    lw      $ra,                ($sp)
    addiu   $sp,                $sp,    4
    jr      $ra
        .end    main

    # -- sequenzaDiCollatz
        .ent    sequenzaDiCollatz
sequenzaDiCollatz:
    subu    $sp,                $sp,    8
    sw      $ra,                4($sp)
    li      $s0,                1
loop:   
    jal     calcolaSuccessivo
    move    $a0,                $v0
    addi    $s0,                $s0,    1
    bne     $a0,                1,      loop
    move    $v0,                $s0
    lw      $s0,                ($sp)
    lw      $ra,                4($sp)
    addi    $sp,                $sp,    8
    jr      $ra
        .end    sequenzaDiCollatz

    # -- calcolaSuccessivo
        .ent    calcolaSuccessivo
calcolaSuccessivo:
    li      $t0,                2
    div     $a0,                $t0
    mfhi    $t1
    beqz    $t1,                pari

    li      $t1,                3
    mul     $v0,                $a0,    $t1
    addi    $v0,                $v0,    1
    j       endcs

pari:   
    div     $a0,                $t0
    mflo    $v0
endcs:  
    jr      $ra

        .end    calcolaSuccessivo