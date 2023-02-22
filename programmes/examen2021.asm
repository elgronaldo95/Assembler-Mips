	.data 
mot:	.asciiz "radar"
fin_mot:	.asciiz " "
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
        
main:
	subu $sp,$sp,24
	sw $ra,16($sp)
	la $a0,mot
	la $a1,fin_mot
	sub $a1,$a1,1
	jal palindrome
	move $a0,$v0
	li $v0,1
	syscall
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
	
palindrome:
	subu $sp,$sp,24
	sw $ra,16($sp)
	sw $a0,24($sp)
	sw $a1,28($sp)
if:	bgt,$a1,$a0,else
then:
	li $v0,1
	b endif
else:
if2:	lb $t0,($a0)
	lb $t1,($a1)
	bne $t0,$t1,else2
then2:
	lw $a0,24($sp)
	lw $a1,28($sp)
	add $a0,$a0,1
	sub $a1,$a1,1
	jal palindrome
	b endif2
else2:
	li $v0,0
endif2:
endif:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra