.data   
    NUMCOL  = 6
    NUMRIG  = 4
    DIMRIG  = 4 * NUMCOL
mat:    .word   154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
.text   
        .globl  main
        .ent    main
main:   
    la      $t0,    mat
    li      $t6,    DIMRIG
    li      $t1,    1                      # contatore righe (init)
rloop1: 
    li      $t2,    4                      # contatore colonne (init)
    li      $t3,    0                      # somma
cloop1: 
    lw      $t4,    ($t0)                  # currval
    add     $t3,    $t3,    $t4
    addi    $t0,    $t0,    4
    addi    $t2,    $t2,    4
    blt     $t2,    DIMRIG, cloop1
    sw      $t3,    ($t0)

    # move $a0, $t3
    # li $v0, 1
    # syscall

    addi    $t1,    $t1,    1
    addi    $t0,    $t0,    4
    blt     $t1,    NUMRIG, rloop1

    # ----------- somma colonne

    li      $t1,    0                      # contatore colonne (init)
cloop2: 
    la      $t0,    mat
    li      $t2,    1                      # contatore righe (init)
    sll     $t3,    $t1,    2              # moltiplica per 4 poiché ogni valore è un intero
    add     $t0,    $t0,    $t3            # indirizzo primo elemento della colonna corrente
    li      $t3,    0                      # somma
rloop2: 
    lw      $t4,    ($t0)                  # currval
    add     $t3,    $t3,    $t4
    addi    $t2,    $t2,    1
    # t5 = t0 + righe*DIM + n. colonna
    # mult $t2, $t6
    # mflo $t5
    # add $t5, $t5, $t1
    # add $t5, $t5, $t0
    addi    $t0,    $t0,    DIMRIG
    blt     $t2,    NUMRIG, rloop2
    sw      $t3,    ($t0)

    move    $a0,    $t3
    li      $v0,    1
    syscall 

    addi    $t1,    $t1,    1
    addi    $t0,    $t0,    4
    blt     $t1,    NUMCOL, cloop2

    li      $v0,    10
    syscall 
        .end    main