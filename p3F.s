	.data
comas: .asciiz ", "
	.text
	.globl __start
	
__start:
	li $t3,31 # a = 31
	li $t1,1  # Cargamos el numero 1 en t1
bucle: 
	slt $t0,$t3,3 			# establece $t0, si $t3 < 3
	beq $t0,$t1,numfinal 	# salta si $t0=$t1, es decir, si 1=1
	sub $t3,$t3,1 			# a = a-1
	move $a0,$t3			# copia a en a0 para salida por pantalla
	jal print_int			# JAL, salta a print_str para escribir por pantalla.
	la	$a0,comas			# cargamos la coma en a0 para mostrarla
	jal print_str			# JAL, salta a print_str para escribir por pantalla.
	j bucle 				# salta a bucle

numfinal:					# pintamos el ultimo numero sin coma final
	sub $t3,$t3,1			# a = a-1
	move $a0,$t3			# copia a en $a0 para salida por pantalla
	jal print_int			# JAL, salta a print_str para escribir por pantalla.
	j salir					# J, salta a salir
	
salir: 
	li $v0,10				# Carga 10 en V0 para acabar el programa
	syscall 				# llamada al sistema
	
print_int:
	li	$v0,1	 			# Carga 1 en V0 para escribir enteros por pantalla
	syscall					# llamada al sistema
	jr	$31					# vuelta a la ejecucion del programa
	
print_str:
	li	$v0,4	 			# Carga 4 en V0 para escribir una cadena por pantalla
	syscall					# llamada al sistema
	jr	$31					# vuelta a la ejecucion del programa