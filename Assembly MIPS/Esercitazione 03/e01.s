.data   
messageInput:   .asciiz "Inserisci numeri senza spazi: "
messageError:   .asciiz "\n[!] L'input non e' un numero valido."
messageTerm:    .asciiz "\nLettura terminata. Numeri inseriti: "
.text   
                .globl  main
                .ent    main
main:  
    li $t0, 0 # counter        
    la      $a0,    messageInput
    li      $v0,    4
    syscall 
loop:
    li $v0, 12
    syscall
    beq $v0, '\n', exit
    # verifica cifre: input contenuto tra 0 e 9
    blt $v0, '0', error
    bgt $v0, '9', error
    addi $t0, $t0, 1
    j loop
error:
    la      $a0,    messageError
    li      $v0,    4
    syscall  
exit: 
    la      $a0,    messageTerm
    li      $v0,    4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    li      $v0,    10
    syscall 
                .end    main

# utilizzando la syscall 5, se l'utente introduce da tastiera 
# un carattere non numerico, il registro di destinazione contiene il valore 0