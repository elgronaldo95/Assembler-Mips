# Feuille de TP 4 -- X5I0030, Facult� des sciences et des Techniques de Nantes
# Auteur: Fr�d�ric Goualard <Frederic.Goualard@univ-nantes.fr>

	.data
invite_str:	.asciiz	"Ann�e ? "
bissextile:	.asciiz "Bissextile"
pas_bissextile:	.asciiz "Pas bissextile"

	.text
	.globl __start
	
__start:
	jal main
	li $v0, 10
	syscall

main:
	li $v0, 4
	la $a0, invite_str
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
if1:	rem $t1, $t0, 400
	bnez $t1, else1
then1:
	la $a0, pas_bissextile
	li $v0, 4
	syscall
	b endif1
else1:
if2:
	rem $t1, $t0, 4
	bnez $t1, else2
then2:
	la $a0, bissextile
	li $v0, 4
	syscall
	b endif2
else2:
	la $a0, pas_bissextile
	li $v0, 4
	syscall
endif2:
endif1:
	jr $ra