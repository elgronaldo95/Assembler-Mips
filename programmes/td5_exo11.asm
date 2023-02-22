	.data 
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
main:
	subu $sp,$sp,24
	sw $ra,16($sp)
	li $a0,5
	li $a1,8
	jal combi
	move $a0,$v0
	li $v0,1
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	lw $ra,16($sp)
	addu $sp,$sp,24
combi:
	subu $sp,$sp,24
	sw $ra,16($sp)
	sw $a0,24($sp)
	sw $a1,28($sp)
	
	lw $a0,24($sp)	# n
	lw $a1,28($sp)	# p
	
if:	bne $a1,0,then
	bne $a1,$a0,then
	bne $a0,0,then
	b else
then:
	li $v0,1
	b endif
else:
	lw $a0,24($sp)	# n
	lw $a1,28($sp)	# p
	sub $a0,$a0,1
	jal combi
	sw $v0,20($sp)
	
	lw $a0,24($sp)	# n
	lw $a1,28($sp)	# p
	sub $a0,$a0,1
	sub $a0,$a0,1
	jal combi
	
	lw $t0,20($sp)
	add $v0,$t0,$v0
	
endif:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
	
	
	
	