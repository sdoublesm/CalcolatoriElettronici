    # Ricerca del carattere minimo, vengono inseriti
    # da tastiera DIM valori, si calcola il minimo e si
    # visualizza

.data   
DIM = 5
min:    .space  4
msg1:   .asciiz "-- Ricerca del valore minimo --\n"
msg2:   .asciiz "Inserisci un numero: "
msg3:   .asciiz "Valore minimo: "
.text   
        .globl  main
        .ent    main
main:   
    la      $a0,    msg1
    li      $v0,    4
    syscall 
    li      $t1,    0                               # counter
    li      $t3,    254                             # currmin

input:  
    la      $a0,    msg2
    li      $v0,    4
    syscall 
    li      $v0,    5
    syscall 
    add     $t0,    $v0,    $0                      # currval
    addi    $t1,    $t1,    1
    blt     $t0,    $t3,    updatemin
l:
    bne     $t1,    DIM,    input
    j       output
updatemin:
    addi    $t3,    $t0,     0                      # (move) dest, source
    j       l
output: 
    la      $a0,    msg3
    li      $v0,    4
    syscall
    sw      $t3,    min

    li      $v0,    1
    move    $a0,    $t3       
    syscall

    li      $v0,    10
    syscall 
        .end    main


