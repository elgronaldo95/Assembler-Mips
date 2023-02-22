	.data 
resultat:	.asciiz "le résultat \n"
T:	.word -5 ,6 ,-2 ,9 ,4 

        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
main:
	li $t0,0	#la somme de départ qui est égale à 0
	la $t1,T	# l'adresse de T
	li $t2,0	#le i
	
for:	bge $t2,10, endfor
do:	
	
	sll $t3,$t2,2	# i*4
	add $t3,$t3,$t1,	# T+i*4
	
	lw $t4,($t3),	# T[i]
	
	add $t0,$t0,$t4
	add $t2,$t2,1,
	
	
	b for
	
endfor:
	la $a0,resultat
	li $v0,4
	syscall 
	move $a0,$t0
	li $v0,1
	syscall 
	jr $ra
	
