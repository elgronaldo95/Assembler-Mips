	.data 
text:	.asciiz "la valeur du pgcd est \n "
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
main:
	subu $sp,$sp,24
	sw $ra,16($sp)
	li $a0,4
	jal fibo
	move $a0,$v0
	li $v0,1
	syscall 
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra

fibo:
	subu $sp,$sp,24
	sw $ra,16($sp)
	sw $a0,24($sp)
if:	bne $a0,0, if2
then1:
	li $v0,0
	b endif
if2:	bne $a0,1,else
then2:	
	li $v0,1
	b endif
else:
	lw $a0,24($sp)
	sub $a0,$a0,1
	jal fibo
	sw $v0,20($sp)
	lw $a0,24($sp)
	sub $a0,$a0,2
	jal fibo
	lw $t0,20($sp)
	add $v0,$v0,$t0
endif:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra

	