	.data 
fleche:	.asciiz " -> "
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
        
main:
	subu,$sp,$sp,24
	sw $ra,16($sp)
	li $a0,45
	jal isqrt
	li $a0,45
	li $v0,1
	syscall
	la $a0,fleche
	li $v0,4
	syscall
	move $a0,$v0
	li $v0,1
	syscall
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
isqrt:
	subu $sp,$sp,24
	sw $ra,16($sp)
if1:	bne $a0,0,else1
then1:
	li $v0,0
	b endif1
else1:	move $a1,$a0
	jal isqrt_aux
endif1:
	lw $ra,16($sp)
	addu,$sp,$sp,24
	jr $ra

isqrt_aux:
	subu $sp,$sp,24
	sw $ra,16($sp)
	add $t0,$a1,$a0
	div $t0,$t0,$a1
	srl $t0,$t0,1
if2:	blt $t0,$a1,else2
then2:
	move $v0,$a0
	b endif2
else2:
	move $a1,$t0
	jal isqrt_aux
endif2:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
	
	
	
	