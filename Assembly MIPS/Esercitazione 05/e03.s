.data   
sInputA:    .asciiz "Inserisci a: "
sInputB:    .asciiz "Inserisci b: "
sInputC:    .asciiz "Inserisci c: "
sYes:       .asciiz "L'equazione ammette due soluzioni reali"
sNo:        .asciiz "L'equazione non ammette soluzioni reali"
.text   
            .globl  main
            .ent    main
main:       
    la      $a0,    sInputA
    li      $v0,    4
    syscall 
    li      $v0,    5
    syscall 
    move    $t0,    $v0

    la      $a0,    sInputB
    li      $v0,    4
    syscall 
    li      $v0,    5
    syscall 
    move    $t1,    $v0

    la      $a0,    sInputC
    li      $v0,    4
    syscall 
    li      $v0,    5
    syscall 
    move    $t2,    $v0

    # equazione ammette soluzioni reali se b^2-4ac >= 0

    mul     $t3,    $t1,        $t1            # $t3 = b^2
    mul     $t4,    $t0,        $t2            # $t4 = AC
    sll     $t4,    $t4,        2              # $t4 = 4AC
    sub     $t3,    $t3,        $t4            # $t3 = b^2-4ac
    slt     $t4,    $t3,        $0             # 1 se t3<0
    bne     $t4,    $0,         noSol
    la      $a0,    sYes
    j       end
noSol:      
    la      $a0,    sNo
end:        
    li      $v0,    4
    syscall 
    li      $v0,    10
    syscall 
            .end    main