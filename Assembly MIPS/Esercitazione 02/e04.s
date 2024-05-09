.data   
v:      .half   0x1234                  # halfword: 2 byte = 16 bit
str:    .asciiz "Numero di bit a 1: "
.text   
        .globl  main
        .ent    main
main:   
    # uso di logical shift instructions
    lh      $t1,    v
    li      $t0,    0
loop:   
    beq     $t1,    $0,     ending
    andi    $t2,    $t1,    1
    beq     $t2,    1,      incr
s:      
    srl     $t1,    $t1,    1
    j       loop

incr:   
    addi    $t0,    $t0,    1
    j       s

ending: 
    la      $a0,    str
    li      $v0,    4
    syscall 
    addi    $a0,    $t0,    0
    li      $v0,    1
    syscall 
    li      $v0,    10
    syscall 
        .end    main