.data   
res:    .space  4
gg:     .byte   231
hh:     .byte   16
mm:     .byte   47
.text   
        .globl  main
        .ent    main
main:   
    lbu      $t0,    gg
    lbu      $t1,    hh
    lbu      $t2,    mm
    mul      $t3,    $t0,    24
    mul      $t3,    $t3,    60
    add      $t4,    $t2,    $t3
    mul      $t3,    $t1,    60
    add      $t4,    $t4,    $t3
    sw       $t4,    res		 
    li       $v0,    10
    syscall 
        .end    main