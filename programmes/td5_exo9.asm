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
	li $a0,8
	li $a1,4
	jal multrusse
	move $a0,$v0
	li $v0,1
	syscall 
	lw $ra,16($sp)
	addu $sp,$sp,24
	jr $ra
multrusse:
	move $t0, $a0	# a
	move $t1, $a1	# b
	li $t2, 0	# p
while:	ble $t1, 0, endwhile
	li $t4,2	# 2
	rem $t5, $t1, $t4
if:	bne $t5,1 endif
	add $t2,$t2,$t0
endif:
	sll $t0,$t0,1
	srl $t1,$t1,1
	b while
endwhile:
	move $v0,$t2
	jr $ra