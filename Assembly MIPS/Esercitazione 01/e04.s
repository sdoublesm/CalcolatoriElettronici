.data   
var:    .word   0x3FFFFFF0
.text   
        .globl  main
        .ent    main
main:   
    lw      $t1,    var
    add     $t1,    $t1,    $t1
    addi    $a0,    $t2,    0
    li      $v0,    1
    syscall
    addi    $t2,    $t1,    40  
    # ! con questa operazione si verifica OVERFLOW
    li      $v0,    10
    syscall 
        .end    main