	.data 
T:	.word 34,-5,12,-6,-8,29,13,-8	#int T[] = { 34, -5, 12, -6, -8, 29, 13, -8 };
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
        
main:
	subu $sp,$sp,24
	sw $ra,16($sp)
	la $a0,T
	li $a1,8
	jal bubblesort
	move $t0,$a0
	add $t1,$a0,$a1
for1:	bge $t0,$t1,endfor1
do1:
	lb $t2,($t0)
	move $a0,$t2
	li $v0,1
	syscall 
	li $a0,' '
	li $v0,11
	syscall
	addu,$t2,$t2,1
	b for1
endfor1:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
	
	
	
bubblesort:
	subu $sp,$sp,24
	sw $ra,16($sp)
if1:	beq $a1,0,endif1
then1:
	li $t0,0
	move $t1,$a1
	sub $t1,$t1,1
	la $t2,T
for2:	bge $t0,$t1,endfor2
do2:
	sll $t3,$t0,2
	add $t3,$t3,$t2
	lw $t4,($t3)
	lw $t5,4($t3)
if2:	bge $t5,$t4,endif2
then2:
	move $t6,$t4
	move $t4,$t5
	sw $t4,($t3)
	move $t5,$t6
	sw $t5,4($t3)
endif2:
	add $t0,$t0,1
	b for2
endfor2:
	move $a0,$t2
	sub $a1,$a1,1
	jal bubblesort
endif1:
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra


	
	
	
	
	
	
	
	
	
	
	
