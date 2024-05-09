.data   
wVett:      .word   5, 7, 3, 4
wResult:    .space  4
.text   
.globl  main
.ent    main
main:       
    la      $t0,    wVett
    lw      $t2,    ($t0)           # curr
    li      $t1,    0               # accumulatore
    add     $t1,    $t1,        $t2
    addi    $t0,    $t0,        4
    lw      $t2,    ($t0)
    add     $t1,    $t1,        $t2
    addi    $t0,    $t0,        4
    lw      $t2,    ($t0)
    add     $t1,    $t1,        $t2
    addi    $t0,    $t0,        4
    lw      $t2,    ($t0)
    add     $t1,    $t1,        $t2
    addi    $t0,    $t0,        4
    la      $t2,    wResult
    sw      $t1,    ($t2)

    li      $v0,    10
    syscall 
.end    main