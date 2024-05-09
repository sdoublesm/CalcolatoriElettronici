.data   
messageInput:   .asciiz "Inserisci numeri senza spazi: "
messageError:   .asciiz "\n[!] L'input non e' un numero valido."
messageTerm:    .asciiz "\nLettura terminata. Numero intero letto: "
messageOverF:   .asciiz "\n[!] Overflow. Numero troppo grande."
.text   
                .globl  main
                .ent    main
main:           
    li      $t0,    '0'
    li      $t3,    10
    li      $t1,    0               # accumulatore
    la      $a0,    messageInput
    li      $v0,    4
    syscall 
loop:           
    li      $v0,    12
    syscall 
    beq     $v0,    '\n',           exit
    # verifica cifre: input contenuto tra 0 e 9
    # controllo se il numero sia rappresentabile su 4 byte
    # deve effettivamente essere un intero
    blt     $v0,    '0',            error
    bgt     $v0,    '9',            error
    sub     $t2,    $v0,            $t0
    # controllo overflow possibile utilizzando multu -> mult su 64bit in registri hi/lo
    # noi vogliamo l'intero su 4 byte (32-bit) quindi deve essere memorizzato solo in lo
    # il valore di hi deve essere 0 dopo la moltiplic.
    multu   $t1,    $t3
    mfhi    $t4
    bne     $t4,    0,              overflow
    mflo    $t4
    add     $t1,    $t4,            $t2
    j       loop
error:          
    la      $a0,    messageError
    li      $v0,    4
    syscall 
    j       exit
overflow:       
    la      $a0,    messageOverF
    li      $v0,    4
    syscall 
exit:           
    la      $a0,    messageTerm
    li      $v0,    4
    syscall 
    move    $a0,    $t1
    li      $v0,    1
    syscall 
    li      $v0,    10
    syscall 
                .end    main