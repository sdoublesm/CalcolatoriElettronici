.data   
varA:   .word   15
varB:   .word   32
varC:   .word   3
string: .asciiz "I numeri in ordine crescente sono: "
space:  .asciiz ", "
.text   
        .globl  main
        .ent    main
main:   
    lw      $t1,    varA
    lw      $t2,    varB
    lw      $t3,    varC
    # $t0 temp
    blt     $t2,    $t1,    swapab                      # a > b
c2:     
    blt     $t3,    $t1,    swapac                      # a > c
c3:     
    blt     $t3,    $t2,    swapbc                      # b > c
    j       print
swapab: 
    move    $t0,    $t1
    move    $t1,    $t2
    move    $t2,    $t0
    j       c2
swapac: 
    move    $t0,    $t1
    move    $t1,    $t3
    move    $t3,    $t0
    j       c3
swapbc: 
    move    $t0,    $t2
    move    $t2,    $t3
    move    $t3,    $t0
print:  
    la      $a0,    string
    li      $v0,    4
    syscall 
    move    $a0,    $t1
    li      $v0,    1
    syscall 
    la      $a0,    space
    li      $v0,    4
    syscall 
    move    $a0,    $t2
    li      $v0,    1
    syscall 
    la      $a0,    space
    li      $v0,    4
    syscall 
    move    $a0,    $t3
    li      $v0,    1
    syscall 

    li      $v0,    10
    syscall 
        .end    main