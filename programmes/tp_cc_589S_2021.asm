	.data 
T:	.word 3,5,-6,12,21
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
	li $a1,5
	li $a2,-6
	jal position
	move $a0,$v0
	li $v0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra

position:
	
	la $t0,T
	li $t1,0
while:	bge $t1,$a1,endwhile
	lb $t2,($t0)
	beq $t2,$a2,endwhile
do:
	add $t1,$t1,1
	add $t0,$t0,1
	b while
endwhile:
if:	bne $t1,$a1,else
then:	li $v0,-1
	b endif
else:
	li $v0,1
endif:
	jr $ra