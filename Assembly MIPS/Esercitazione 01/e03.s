.data   
op1:    .byte   150
op2:    .byte   100
.text   
        .globl  main
        .ent    main
main:   
    lb      $t1,    op1
    lb      $t2,    op2
    add     $a0,    $t1,    $t2
    li      $v0,    1
    syscall 
    li      $v0,    10
    syscall 
        .end    main

# risultato stampato a video: -6
# su un byte (8bit) posso rappresentare in CA2
# numeri positivi fino a 127 ! (2^(n-1)-1)