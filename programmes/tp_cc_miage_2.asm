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
	li $a0,7
	li $a1,4
	jal mulParN
	move $a0,$v0
	li $v0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	li $v0,0
	syscall 
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
	
mulParN:
	sub $sp,$sp,24
	lw $ra,16,($sp)
	sw $a0,24($sp)
	sw $a1,28($sp)
if:	bgt $a1,1,else
then:	
	move $v0,$a0
	b endif
else:
	lw $a0,24($sp)
	lw $a1,28($sp)
	sub $a1,$a1,1
	jal mulParN
	add $v0,$v0,$a0
endif:
	sw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra