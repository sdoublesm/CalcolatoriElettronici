.data   
    N   = 4
    DIM = N*4
vetrig: .word   3, 2, 1, 0
vetcol: .word   4, 3, 2, 4
mat:    .word   N*DIM
msgof:  .asciiz "[!] Overflow"
.text   
        .globl  main
        .ent    main
main:   
    la      $t6,    mat
    li      $t0,    N
    li      $t1,    0                           # counter riga

loopr:  
    lw      $t3,    vetrig($t1)
    li      $t2,    0                           # counter colonne
loopc:  
    lw      $t4,    vetcol($t2)
    mult    $t3,    $t4

    mfhi    $t5
    # overflow se parte alta diversa da 0 o da tutti 1
    beq     $t5,    0xFFFFFFFF,     noOverflow
    bne     $t5,    0,              overflow
noOverflow:
    mflo    $t5
    sw      $t5,    ($t6)
    move    $a0,    $t5
    li      $v0,    1
    syscall 
    addi    $t6,    $t6,            4
    addi    $t2,    $t2,            4
    blt     $t2,    DIM,            loopc
    addi    $t1,    $t1,            4
    blt     $t1,    DIM,            loopr
    j       end
overflow:
    la      $a0,    msgof
    li      $v0,    4
    syscall 
end:    
    li      $v0,    10
    syscall 
        .end    main