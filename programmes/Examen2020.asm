	.data 
T:	.word 2,4,6,-7,9
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
        
main:
	subu $sp,$sp,40
	sw $ra,16($sp)
	la $a0,T
	li $a1,1
	jal reverse
	lw $ra,16($sp)
	addu $sp,$sp,40
	jr $ra
	
reverse:
	subu $sp,$sp,24
	sw $ra,16($sp)
	sub $a1,$a1,1
	add $a1,$a1,$a0
while:
	bge $a0,$a1,endwhile
	jal echanger
	add $a0,$a0,1
	sub $a1,$a1,1
	b while
endwhile:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra

echanger:
	move $t0,$a0
	move $a0,$a1
	move $a1,$t0
	jr $ra
	
	
	
	
	
