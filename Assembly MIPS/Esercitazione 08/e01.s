.data   
X:      .byte   1;
Y:      .byte   40;
u:      .byte   60;
entry:  .byte   12, 47
exit:   .byte   18, 14

    # stack
    # -4 | $ra

.text   
        .globl  main

        .ent    main
main:   
    subu    $sp,                $sp,    4
    sw      $ra,                ($sp)
    la      $a0,                entry
    la      $a1,                exit
    lb      $a2,                X
    lb      $a3,                Y
    jal     costoParcheggio
    # restituisce in v0 il costo del parcheggio
    move    $a0,                $v0
    li      $v0,                1
    syscall 
    lw      $ra,                ($sp)
    addu    $sp,                $sp,    4
    jr      $ra
        .end    main

    # -- costoParcheggio
        .ent    costoParcheggio
costoParcheggio:
    lbu     $t0,                ($a0)           #hEntry
    lbu     $t1,                1($a0)          #mEntry
    lbu     $t2,                ($a1)           #hExit
    lbu     $t3,                1($a1)          #mExit

    lb      $t4,                u
    mul     $t0,                $t0,    $t4
    addu    $t0,                $t0,    $t1     # orario arrivo in minuti
    mul     $t2,                $t2,    $t4
    addu    $t2,                $t2,    $t3     # orario arrivo in minuti

    subu    $t1,                $t2,    $t0     # minuti passati nel parcheggio
    divu    $t1,                $a3
    mflo    $t3
    mfhi    $t2
    beq     $t2,                $0,     endcP
    addi    $t3,                $t3,    1
endcP:  
    mul     $v0,                $t3,    $a2

    jr      $ra

        .end    costoParcheggio

