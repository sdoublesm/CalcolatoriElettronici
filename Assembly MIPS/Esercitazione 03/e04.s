.data   
msgInput:   .asciiz "Inserire numeri: "
msgOutput:  .asciiz "Media: "
    DIM = 5
.text   
            .globl  main
            .ent    main
main:       
    li      $t0,    0                   # contatore
    li      $t1,    0                   # accumulatore
    la      $a0,    msgInput
    li      $v0,    4
    syscall 

loop:       
    li      $v0,    5
    syscall 
    add     $t1,    $t1,        $v0
    addi    $t0,    $t0,        1
    bne     $t0,    DIM,        loop

    la      $a0,    msgOutput
    li      $v0,    4
    syscall 

    div     $t1,    $t1,        DIM
    move    $a0,    $t1
    li      $v0,    1
    syscall 

    li      $v0,    10
    syscall 
            .end    main
            
# risultato arrotondato all'intero inferiore