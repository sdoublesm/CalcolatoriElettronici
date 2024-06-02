.data   
sInput:     .asciiz "Inserisci la dimensione del lato: "
char:       .asciiz "* "
newline:    .asciiz "\n"
.text   
            .globl  main
            .ent    main
main:       
    la      $a0,                sInput
    li      $v0,                4
    syscall 
    li      $v0,                5
    syscall 

    move    $s0,                $v0                         # salvo valore in s0
    move    $a0,                $s0                         # utile per ripristino poiche $a0 verra modificato da proc

    jal     stampaTriangolo
    la      $a0,                newline
    li      $v0,                4
    syscall 

    move    $a0,                $s0
    jal     stampaQuadrato
    j       end

stampaTriangolo:
    move    $t2,                $a0
    addi    $t2,                $t2,        1
    li      $t0,                1                           # counter righe

loop2t:     
    li      $t1,                0                           # counter colonne
loop1t:     
    la      $a0,                char
    li      $v0,                4
    syscall 
    addi    $t1,                $t1,        1
    bne     $t1,                $t0,        loop1t
    la      $a0,                newline
    li      $v0,                4
    syscall 
    addi    $t0,                $t0,        1
    bne     $t0,                $t2,        loop2t
    jr      $ra
            .end    stampaTriangolo

stampaQuadrato:
    move    $t2,                $a0
    li      $t0,                0                           # counter righe

loop2q:     
    li      $t1,                0                           # counter colonne
loop1q:     
    la      $a0,                char
    li      $v0,                4
    syscall 
    addi    $t1,                $t1,        1
    bne     $t1,                $t2,        loop1q
    la      $a0,                newline
    li      $v0,                4
    syscall 
    addi    $t0,                $t0,        1
    bne     $t0,                $t2,        loop2q
    jr      $ra
            .end    stampaQuadrato

end:        
    li      $v0,                10
    syscall 

            .end    main