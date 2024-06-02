.data   
    LUNG    =,          6;
anni:   .word   1945, 2008, 1800, 2006, 1748, 1600
res:    .space  LUNG                                # vettore di LUNG byte (contenente 0 o 1)
.text   
        .globl  main

        .ent    main
main:   
    subu    $sp,        $sp,    4
    sw      $ra,        ($sp)
    la      $a0,        anni
    la      $a1,        res
    li      $a2,        LUNG
    jal     bisestile

    li      $t1,        LUNG
    la      $t2,        res
ciclo_stampa:
    li      $v0,        1
    lbu     $a0,        ($t2)
    syscall 
    addiu   $t2,        $t2,    1
    subu    $t1,        $t1,    1
    bne     $t1,        $0,     ciclo_stampa

    lw      $ra,        ($sp)
    addu    $sp,        $sp,    4
    jr      $ra
        .end    main

        .ent    bisestile
bisestile:
    li      $t1,        0

loop:   
    lw      $t0,        ($a0)                       # curr
    li      $t4,        100
    div     $t0,        $t4
    mfhi    $t2
    bne     $t2,        $0,     notdiv100
    li      $t4,        400
    div     $t0,        $t4
    mfhi    $t2
    bne     $t2,        $0,     notBis
    j       isBis

notdiv100:
    li      $t4,        4
    div     $t0,        $t4
    mfhi    $t2
    bne     $t2,        $0,     notBis
    j       isBis

isBis:  
    li      $t3,        1
    sb      $t3,        ($a1)
    j       endloop

notBis: 
    li      $t3,        0
    sb      $t3,        ($a1)

endloop:
    addi    $a0,        $a0,    4
    addi    $t1,        $t1,    1
    addi    $a1,        $a1,    1

    bne     $t1,        LUNG,   loop

    jr      $ra

        .end    bisestile