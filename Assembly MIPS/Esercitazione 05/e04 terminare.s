.data   

    DIM = 5
    NEXT_DIAG = 4*(DIM+1)
    NEXT_ROW = 4*DIM

    # 2 se la matrice e' diagonale
    # 1 se la matrice e' simmetrica
    # 0 se la matrice non e' simmetrica

matrix: .word   1, 0, 0, 0, 0
        .word   0, 2, 0, 1, 0
        .word   0, 0, 3, 0, 0
        .word   0, 1, 0, 4, 0
        .word   0, 0, 0, 0, 5
.text   
        .globl  main
        .ent    main
main:   
    la      $t0,    matrix                  # start
    li      $t7,    1                       # flag isDiagonale
    li      $t6,    1                       # counter diag
    li      $t5,    5                       # counter int

loop2:  
    sub     $t5,    $t5,        $t6         # SISTEMARE
loop1:  
    addi    $t1,    $t0,        4
    addi    $t2,    $t0,        NEXT_ROW
    lw      $t3,    ($t1)
    lw      $t4,    ($t2)
    bne     $t3,    $t4,        noSimm
    bne     $t3,    $0,         noDiag
c:      
    sub     $t5,    $t5,        1
    bne     $t5,    0,          loop1
    addi    $t6,    $t6,        1
    addi    $t0,    $t0,        NEXT_DIAG
    bne     $t6,    DIM,        loop2
    # --- la matrice è simmetrica
    li      $a0,    1
    bne     $t7,    $0,         isDiag
    j       end
isDiag: 
    li      $a0,    2
    j       end
noDiag: 
    li      $t7,    0
    j       c

noSimm: 
    li      $a0,    0
end:    
    li      $v0,    1
    syscall 

    li      $v0,    10
    syscall 

        .end    main