.data   
v1: .word   10
v2: .word   0xDC
.text   
.globl  main
.ent    main
main:
    lw      $t0,    v1
    lw      $s0,    v2

    li      $v0,    10
    syscall 
.end    main