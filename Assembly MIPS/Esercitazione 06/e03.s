.data   
    DIM=4   
parola: .asciiz "ciao"
.text   

        .globl  main
        .ent    main
main:   
    la      $t0,    parola
    li      $t2,    0
    move    $a0,    $t0
    li      $a1,    DIM
    jal     conv
    li      $v0,    4
    move    $a0,    $t0
    syscall
    j       end
    
    # conv($t0, DIM)
conv:   
    lb      $t1,    ($a0)
    sub    $t1,    $t1,    32
    addi    $t2,    $t2,    1
    sb      $t1,    ($a0)
    addi    $a0,    $a0,    1
    bne     $t2,    $a1,    conv
    jr      $ra
        .end    conv

end:    
    li      $v0,    10
    syscall 
        .end    main