.data   
    DIM = 5
vett:   .word   103, 42, 5, 22, 56
.text   
        .globl  main
        .ent    main
main:   

    la      $a0,        vett
    li      $a1,        DIM
    jal     massimo
    move    $a0,        $v0
    li      $v0,        1
    syscall 
    j end

# - massimo(ind ($a0), lunghezza ($a1)) -> ris $v0
massimo:
    li      $t0,        0               # massimo attuale
    li      $t2,        0               # counter

loop:   
    lw      $t1,        ($a0)
    bgt     $t0,        $t1,    next
    move    $t0,        $t1
next:   
    addi    $a0,        $a0,    4
    addi    $t2,        $t2,    1
    bne     $t2,        $a1,    loop

    move    $v0,        $t0
    jr      $ra
        .end    massimo
        
end:    
    li      $v0,        10
    syscall 

        .end    main