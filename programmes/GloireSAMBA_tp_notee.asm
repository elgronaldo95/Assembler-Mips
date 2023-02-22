		#Gloire SAMBA 585K
	.data 
chaine:	.asciiz " \n Number of replacements :  "
T:	.word -3, 9, 4, 6, -7, 9
        .text
        .globl __start
 __start:
        jal main
        li $v0 ,10
        syscall
        
main:
	subu,$sp,$sp,24
	sw $ra,16($sp)	#sauvegarder le registre
	la $a0,T	#T
	li $a1,6	#szT
	li $a2,9	#replaced
	li $a3,-4	#substitute
	jal replace	#appelle à la fonction replace
	move $t0,$v0	# $t0 =replace(T,6,9,-4)
	li $t1,0	#i
	la $t2,T	#pour garder la position du tableau
for:	bge $t1,$a1,endfor
doFor:
	sll $t3,$t1,2
	add $t3,$t2,$t3
	lw $t4,($t3)	#T[i]
	move $a0,$t4
	li $v0,1	#affichage des T[i]
	syscall	
	li $a0,' '
	li $v0,11	#affichage de ' '
	syscall
	add $t1,$t1,1
	b for
endfor:
	la $a0,chaine
	li $v0,4	#affichage de nNumber of replacements : 
	syscall
	move $a0,$t0
	li $v0,1	#affichage de nb_replaced
	syscall
	li $a0,'\n'
	li $v0,11	#affichage du endl
	syscall
	li $v0,0	#return exit_success
	lw $ra,16($sp)	#rendre le registre
	addu $sp,$sp,24
	jr $ra


replace:
	li $t0,0	#counter =0
	la $t1,T	#*pl
	sub $t2,$a1,1
	add $t2,$t1,$t2	#*end
while:	bgt $t1,$t2,endwhile
doWhile:
if:	lb $t3,($t1)	#$t3 = memoire($t1)
	bne $t3,$a2,endif
then:
	move $t3,$a3	#*pl = substitute
	add $t0,$t0,1	#counter ++
	b endif
endif:
	add $t1,$t1,1	# ++ pl 
	b while
endwhile:
	move $v0,$t0	#retourner counter
	jr $ra
	
	
	
	
	