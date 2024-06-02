.data
    N = 12
    K = 2
.text
    .globl main
    .ent main

main:
    li      $a0,        N
    li      $a1,        K
    jal     combina
    j       end

combina:
    beq     $a1,        1,      k_1
    beq     $a1,        0,      k_0

    move    $t1,        $a0
    # (n-k+1) in $t2
    sub     $t2,        $a0,    $a1
    addi    $t2,        $t2,    1

loopnum:
    sub     $t1,        $t1,    1
    mul     $a0,        $a0,    $t1
    bne     $t1,        $t2,    loopnum
    # numeratore in $a0
    
    move    $t1,        $a1

loopden:
    sub     $t1,        $t1,    1
    mul     $a1,        $a1,    $t1
    bne     $t1,        1,      loopden
    # numeratore in $a1

    # divisione
    div     $v0,        $a0,    $a1
    jr      $ra

k_1:
    move    $v0,        $a0
    jr      $ra    
k_0:
    li      $v0,        1
    jr      $ra
    .end combina

end:
    move    $a0,        $v0
    li      $v0,        1
    syscall 
    li      $v0,        10
    syscall 
    .end main