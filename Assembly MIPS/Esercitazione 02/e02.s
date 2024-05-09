.data   
sinput: .asciiz "Inserire un intero positivo (compreso tra 0 e 255): "
serror: .asciiz "ERR: Intero non rappresentabile su byte (8 bit)"
sres: .asciiz "Il risultato dell'operazione logica e': "
.text
        .globl  main
        .ent    main
main:   
    li      $t0,    255
    # il confronto poteva anche avvenire con un AND con 0xFFFFFF00
    # che azzera tutte le cifre degli ultimi 8 bit mentre tiene a 1 i precedenti 24
    # se risultato diverso da zero (ci sono altre cifre oltre gli 8 bit, allora rest. errore)

    # A in $t1
    la      $a0,    sinput
    li $v0, 4
    syscall 
    li      $v0,    5
    syscall 
    blt     $t0,    $v0,    error
    addi    $t1,    $v0,    0                                           # move

    # B in $t2
    la      $a0,    sinput
    li $v0, 4
    syscall 
    li      $v0,    5
    syscall 
    blt     $t0,    $v0,    error
    addi    $t2,    $v0,    0                                           # move
    
    la $a0, sres
    li $v0, 4
    syscall 

    # C = NOT(A AND (NOT(B))) OR (A XOR B)
    not $t3, $t2        # NOT(B)
    xor $t4, $t1, $t2   # A XOR B
    and $t5, $t1, $t3   # A AND NOT B
    not $t5, $t5        # NOT(A AND (NOT(B))
    or $a0, $t5, $t4    # res
    # viene sempre 1111 1111 1111 1111 1111 1111 1111 1111
    # va mascherato (?)
    li $v0, 1
    syscall
    j ending

error:
    li $v0, 4
    la      $a0,    serror
    syscall 
ending: 
    li      $v0,    10
    syscall 
        .end    main