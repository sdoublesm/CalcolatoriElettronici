# Lettura da tastiera e visualizzazione a video di un vettore di 5 caratteri
# Tipo asciiz - NULL (\00) terminated ASCII string

.data   
DIM = 5
vett:   .space  20
msg:    .asciiz "Inserire numeri:\n"
space:  .asciiz "; "
.text   
.globl  main
.ent    main

main:   
    li      $v0,    4                   # code for syscall: print_string contenuta in $a0
    la      $a0,    msg                 # pointer to string
    syscall 

    la      $t0,    vett                # t0 contiene l'indirizzo della prima cella del vettore
    li      $t1,    0                   # inizializzo contatore
input:  
    li      $v0,    5                   # code for syscall: get_integer
    syscall 
    sw      $v0,    ($t0)               # scrivo nella cella i-esima il valore inserito
    addi    $t0,    $t0,    4           # incremento il puntatore
    addi    $t1,    $t1,    1
    bne     $t1,    5,      input       # se dato in $t0 non e' uguale a 5, ritorna in input

    la      $t0,    vett                # reset puntatore e contatore per output
    li      $t1,    0
output: 
    li      $v0,    1                   # code for syscall: print_integer
    lw      $a0,    ($t0)               # scrivo in $a0 il contenuto della cella i-esima del vettore
    syscall 
    li      $v0,    4                   # code for syscall: print_integer
    la      $a0,    space
    syscall 
    addi    $t0,    $t0,    4
    addi    $t1,    $t1,    1
    bne     $t1,    5,      output      # fino a che l'indice non e' uguale a 5 ritorna in output

    li      $v0,    10                  # sycall: exit
    syscall 
.end main