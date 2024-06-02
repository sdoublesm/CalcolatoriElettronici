.data   
    L=8    
char:       .asciiz "* "
newline:    .asciiz "\n"
.text   
            .globl  main
            .ent    main
main:       

    jal     stampaTriangolo
    la      $a0,                newline
    li      $v0,                4
    syscall 
    jal     stampaQuadrato
    j end

stampaTriangolo:
    li      $t0,                1                   # counter righe

loop2t:      
    li      $t1,                0                   # counter colonne
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
    bne     $t0,                L+1,          loop2t
    jr      $ra
            .end    stampaTriangolo

stampaQuadrato:
    li      $t0,                0                   # counter righe

loop2q:      
    li      $t1,                0                   # counter colonne
loop1q:      
    la      $a0,                char
    li      $v0,                4
    syscall 
    addi    $t1,                $t1,        1
    bne     $t1,                L,        loop1q
    la      $a0,                newline
    li      $v0,                4
    syscall 
    addi    $t0,                $t0,        1
    bne     $t0,                L,          loop2q
    jr      $ra
            .end    stampaQuadrato

end:        
    li      $v0,                10
    syscall 

            .end    main