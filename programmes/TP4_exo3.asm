		.data 
invite_str:	.asciiz "entrez la valeur \n"
trouver:	.asciiz "trouver \n"
tropHaut:	.asciiz "tropHaut \n"
tropBas:	.asciiz "tropBas \n"
nombreEssai:	.asciiz "nombreDéssai \n"

	.text
	.globl __start
	
__start:
	jal main
	li $v0, 10
	syscall

main:
	li $v0,4
	la $a0,invite_str
	syscall 
	
	li $v0,5
	syscall 
	
	li $t0, 64 #valeur attendu
	move $t1,$v0 #valeur utilisateur
	
	li $t3,0 #nombre de fois
	
	if1: bne $t1,$t0, else
	then1:
		la $a0,trouver
		li $v0, 4
		syscall
		b endif1
	else:
		while: beq $t1,$t0, endwhile
		do:
			if2: ble $t1,$t0, if3
			then2:
				add $t3,$t3,1
				la $a0,tropHaut
				li $v0, 4
				syscall
				li $v0,4
				la $a0,invite_str
				syscall 
				li $v0,5
				syscall 
				move $t1,$v0
				b endif2
			if3:bge $t1,$t0, endif3
			then3:
				add $t3,$t3,1
				la $a0,tropBas
				li $v0, 4
				syscall
				li $v0,4
				la $a0,invite_str
				syscall 
				li $v0,5
				syscall 
				move $t1,$v0
				b endif3
				
			endif2:
			endif3:
			
			b while
		endwhile:
				la $a0,trouver
				li $v0, 4
				syscall
				la $a0,nombreEssai
				li $v0, 4
				syscall	
				move $a0,$t3
				li $v0, 1
				syscall 
						
	endif1:

		jr $ra
 
