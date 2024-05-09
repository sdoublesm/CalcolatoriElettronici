.data   
opa:    .word   2043
opb:    .word   5
res:    .space  4
# vettore ("tabella") di jump che contiene le opzioni possibili
tab:    .word   somma, sottrazione, moltiplicazione, divisione
msg:    .asciiz "Inserisci un intero per eseguire l'operazione correlata:\n0. somma\n1. sottrazione\n2. moltiplicazione\n3. divisione\nOpzione: "
msgerr: .asciiz "Intero non valido."
msgre:  .asciiz "Risultato dell'operazione: "
.text   
        .globl  main
        .ent    main
main:   
    lw      $t0,    opa
    lw      $t1,    opb

    la      $a0,    msg
    li      $v0,    4
    syscall 

    li      $v0,    5
    syscall 
    blt     $v0,    0,          err
    bgt     $v0,    3,          err
    sll     $t4,    $v0,        2                                                                                                                   # molt per 4 indice dato che ci muoviamo tra word

    lw      $t4,    tab($t4)                                                                                                                        # indirizzo label + valore mem in $v0
    jr      $t4                                                                                                                                     # jumpa all'istruzione all'indirizzo contenuto in $t4
somma:  
    add     $t2,    $t0,        $t1
    j       re
sottrazione:
    sub     $t2,    $t0,        $t1
    j       re
moltiplicazione:
    mul     $t2,    $t0,        $t1
    j       re
divisione:
    div     $t2,    $t0,        $t1
    j       re

err:    
    la      $a0,    msgerr
    li      $v0,    4
    syscall 
    j       end

re:     
    la      $a0,    msgre
    li      $v0,    4
    syscall 
    move    $a0,    $t2
    li      $v0,    1
    syscall 

end:    
    li      $v0,    10
    syscall 
        .end    main