.data   
    CIFRE = 10
num:    .word   3141592653
.text   
        .globl  main
        .ent    main
main:   
    lw      $t1,    num
    li      $t2,    CIFRE
    #   move    $a0,    $t1
    # li      $v0,    1
    # syscall                         # stampa -1153374643
    # syscall e' in grado di stampare solo signed

    li      $t0,    0               # counter cifre
loop:   
    divu    $t1,    $t2
    mfhi    $t3                     # in hi il resto della divisione
    subu    $sp,    $sp,    4
    sw      $t3,    ($sp)
    addu    $t0,    $t0,    1
    mflo    $t1                     # risultato divisione nuovo dividendo
    bne     $t0,    CIFRE,     loop
    li      $t0,    0
print:  
    lw      $t4,    ($sp)
    addu    $t4,    $t4,    '0'
    move    $a0,    $t4
    li      $v0,    11              # utilizzo syscall 11 per stampare unsigned
    syscall 
    addu    $sp,    $sp,    4
    addu    $t0,    $t0,    1
    bne     $t0,    CIFRE,     print

end:    
    li      $v0,    10
    syscall 
        .end    main