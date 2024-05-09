.data   
wVar:   .word   5
.text   
.globl  main
.ent    main
main:   
    la      $t0,    wVar    # carica l'indirizzo in cui è contenuta wVar in t0
    li      $t1,    10      # carica il valore 10 nel registro t1
    sw      $t1,    ($t0)   # memorizza il valore di t1 nell'indirizzo contenuto in t0
    li      $v0,    10      # Carica il codice della system call per terminare il programma
    syscall                 # Esegue la system call per terminare il programm
.end    main