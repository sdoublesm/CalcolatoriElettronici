.data   
    DIM = 5;
vet1:   .word   56, 12, 98, 129, 58
vet2:   .word   1, 0, 245, 129, 12
res:    .space  DIM
.text   
        .globl  main

        .ent    main
main:   
    subu    $sp,                $sp,    4
    sw      $ra,                ($sp)
    la      $a0,                vet1
    la      $a1,                vet2
    la      $a2,                res
    li      $a3,                DIM
    jal     CalcolaDistanzaH

    lw      $ra,                ($sp)
    addiu   $sp,                $sp,    4
    jr      $ra
        .end    main


# -- CalcolaDistanzaH

        .ent    CalcolaDistanzaH
CalcolaDistanzaH:
    # idea: utilizzo XOR dei due valori
    # operatore XOR restituisce 1 se ESCLUSIVAMENTE UNO dei due operandi è 1, quindi solo se i bit sono diversi
    # quindi posso calcolare xor dei due operandi e contare il numero di bit a 1
    move    $t5,                $a0
    move    $t6,                $a1
    move    $t4,                $a2
    li      $t7,                0               #counter elementi vettore

loopv:  
    lw      $t0,                ($t5)
    lw      $t1,                ($t6)

    xor     $t2,                $t0,    $t1

    li      $t0,                0               # counter bit
    li      $t1,                0               # counter di 1 del numero in $t2
count:  
    andi    $t3,                $t2,    1
    bne     $t3,                1,      not1
    addi    $t1,                $t1,    1
not1:   
    srl     $t2,                $t2,    1
    addi    $t0,                $t0,    1
    bne     $t0,                32,     count   # ogni word contiente 32 bit da controllare
    sb      $t1,                ($t4)           # carico il risultato nel vettore res

    # stampa debug
    move    $a0,                $t1
    li      $v0,                1
    syscall 

    addi    $t5,                $t5,    4
    addi    $t6,                $t6,    4
    addi    $t7,                $t7,    1

    bne     $t7,                DIM,    loopv
    jr      $ra
        .end    CalcolaDistanzaH


