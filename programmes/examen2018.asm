	.data
	.text
	.globl __start
__start:
	jal main
	li $v0,10
	syscall
	
main:
	subu $sp,$sp,40
	sw $ra,16($sp)
	li $t0,5
	sw $t0,24($sp)
	li $t0,3
	sw $t0,28($sp)
	li $t0,2
	sw $t0,32($sp)
	li $t0,6
	sw $t0,28($sp)
	add $a0,$sp,24
	jal det
	move $a0,$v0
	li $v0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	lw $ra,16($sp)
	addu,$sp,$sp,24
	jr $ra
	
det:
	lw $t0,($a0)
	lw $t1,4($a0)
	lw $t2,8($a0)
	lw $t3,12($a0)
	mul $t0,$t0,$t3
	mul $t1,$t1,$t4
	sub $v0,$t0,$t1
	jr $ra
	