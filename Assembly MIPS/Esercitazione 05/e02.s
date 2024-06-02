.data   
sInput:     .asciiz "Introduci una stringa: "
sBlank:     .asciiz "Non hai inserito nessun carattere"
sNotPal:    .asciiz "La stringa non e' palindroma"
sPal:       .asciiz "La stringa e' palindroma"
.text   
            .globl  main
            .ent    main
main:       
    li      $t0,    0                        # contatore caratteri

    la      $a0,    sInput
    li      $v0,    4
    syscall 

    # valore iniziale stack pointer
    move    $t1,    $sp

input:      
    li      $v0,    12
    syscall 
    beq     $v0,    '\n',       checkInp
    addi    $t0,    $t0,        1
    subu    $sp,    $sp,        4
    sw      $v0,    ($sp)
    j       input

checkInp:
    beq     $t0,    $0,         blank

checkPal:   
    subu    $t1,    $t1,        4
    lw      $t2,    ($t1)
    lw      $t3,    ($sp)                    # valore attuale stack pointer
    addu    $sp,    $sp,        4
    bne     $t2,    $t3,        notPal
    subu    $t0,    $t0,        2
    bgt     $t0,    0,          checkPal
    la      $a0,    sPal
    j       end

notPal:     
    la      $a0,    sNotPal
    j       end
Pal:
    la      $a0,    sPal
    j       end
blank:      
    la      $a0,    sBlank

end:        
    li      $v0,    4
    syscall 
    li      $v0,    10
    syscall 
            .end    main