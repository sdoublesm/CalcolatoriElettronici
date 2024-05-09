# Somma degli elementi di un vettore (II)

.data   
DIM = 15
wVett:      .word   2, 5, 16, 12, 34, 7, 20, 11, 31, 44, 70, 69, 2, 4, 23
wResult:    .space  4
.text   
            .globl  main
            .ent    main

main:       
    li      $t1,    0                  # accumulatore
    li      $t3,    DIM
    la      $t0,    wVett

loop:       
    lw      $t2,    ($t0)
    add     $t1,    $t1,        $t2
    addi    $t0,    $t0,        4      # incremento l'indirizzo di 4 (passo all'indirizzo del valore successivo nel vettore)
    sub     $t3,    $t3,        1
    beq     $t3,    0,          end
    j       loop
end:        
    sw      $t1,    wResult

    li      $v0,    10
    syscall 
.end main