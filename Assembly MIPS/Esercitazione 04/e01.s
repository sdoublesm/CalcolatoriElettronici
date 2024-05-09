.data   
    N       =      20
    DIM     =      N*4
vet:    .space  DIM
.text   
        .globl  main
        .ent    main
main:   
    li      $t0,    0        # counter
    # la $t0, vet
    # posso sfruttare vet -> indirizzo vet[0] richiamabile direttamente nella la

    # v[0] = 1
    li      $t1,    1
    sw      $t1,    vet($t0)
    addi    $t0,    $t0,        4
    # v[1] = 1
    li      $t2,    1
    sw      $t2,    vet($t0)
    addi    $t0,    $t0,        4

loop:   
    add     $t3,    $t1,        $t2
    sw      $t3,    vet($t0)
    move    $t1,    $t2
    move    $t2,    $t3
    addi    $t0,    $t0,        4
    blt     $t0,    DIM,        loop

    li      $v0,    10
    syscall 
        .end    main