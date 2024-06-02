.data   
matrice:    .word   10, 6, 7, 4
msg_output: .asciiz "Valore determinante: "
.text   
            .globl  main

            .ent    main
main:       
    subu    $sp,               $sp,        4
    sw      $ra,                ($sp)
    # return address salveto nello stack
    la      $t0,                matrice
    lw      $a0,                ($t0)
    lw      $a1,                4($t0)
    lw      $a2,                8($t0)
    lw      $a3,                12($t0)
    jal     determinante2x2
    move    $t0,                $v0
    la      $a0,                msg_output
    li      $v0,                4
    syscall 
    move    $a0,                $t0
    li      $v0,                1
    syscall 
    lw      $ra,                ($sp)
    addu    $sp,                $sp,        4
    jr      $ra
            .end    main

            .ent    determinante2x2
determinante2x2:
    mul     $t0,                $a0,        $a3
    mul     $t1,                $a1,        $a2
    sub     $v0,                $t0,        $t1
    jr      $ra
            .end    determinante2x2