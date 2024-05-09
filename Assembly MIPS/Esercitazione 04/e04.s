.data   
    # lavoriamo in byte
    N=10    
matrix: .space  100
.text   
        .globl  main
        .ent    main
main:   
    li      $t2,    N
    li      $t0,    0                           # counter righe

lrighe: 
    li      $t1,    0                           # counter colonne
lcolonne:
    mul     $t4,    $t0,            $t1
    mul     $t3,    $t0,            $t2
    add     $t3,    $t3,            $t1
    # bastava anche semplicemente incrementare ad ogni iterazione l'indirizzo
    sb      $t4,    matrix($t3)

    addi    $t1,    $t1,            1
    ble     $t1,    10,             lcolonne
    addi    $t0,    $t0,            1
    ble     $t0,    10,             lrighe

    li      $v0,    10
    syscall 
        .end    main