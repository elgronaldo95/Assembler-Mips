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
	li $a0,3
	li $a1,4
	jal pgcd
	move $t1,$v0
	la $a0, text
	li $v0,4
	syscall
	move $a0,$t1
	li $v0,1
	syscall 
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
pgcd:
	subu $sp,$sp,24
	sw $ra,16($sp)
	sw $a0,24($sp)
	sw $a1,28($sp)
	
if:	bne $a1,0,else
	move $v0,$a0
	b endif
else:
	lw $a1,28($sp)
	move $t0,$a1
	rem $a1,$a0,$a1
	move $a0,$t0
	jal pgcd
endif:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
