	.data
Am:	.word 3,2,5,4
Ad:	.space 4
	.text
        .global __start
start__:
	jal main
	li $v0,10
	syscall
main:
	la $t0,Am
	lw $t1,($t0)
	lw $t2,4($t0)
	lw $t3,8($t0)
	lw $t4,12($t0)
	
	mul $t1,$t1,$t4
	mul $t3,$t3,$t2
	
	sub $t0,$t1,$t3
	
	move $a0,$t0
	li $v0,1
	syscall 
	jr $ra