	.data
str_1:	.asciiz	"Introduce entero (A) por consola: "
str_2:	.asciiz "Introduce entero (B) por consola: "
str_3:	.asciiz "El valor de C es: "
novale: .asciiz "La operacion es mayor que 50! Reiniciando. \n \n"
newlin: .asciiz "\n \n"

	.globl	__start
	.text
__start:
	la	$a0,str_1			# Mostramos str_1 por pantalla
	li	$v0,4				# Preparamos salida por pantalla de cadena
	syscall					# llamada al sistema
	la	$v0,5				# prepara entrada de un entero
	syscall					# llamada al sistema
	move $a1,$v0			# mueve el contenido de $v0 a $a1
	la	$a0,str_2			# Mostramos str_2 por pantalla
	li	$v0,4				# Preparamos salida por pantalla de cadena
	syscall					# llamada al sistema
	la	$v0,5				# prepara entrada de un entero
	syscall					# llamada al sistema
	move $a2,$v0			# mueve el contenido de $2 a $a2
	li $t7,50				# carga el valor 50 en $15
	
	bne 	$a1,$a2,multi	# si a1 y a2 no coinciden salta a multi
	add		$a3,$a1,$a2		# suma a1 y a2 en a3
	j		compara			# salta a compare
multi:						
	mul		$a3,$a1,$a2		# multiplica a1 y a2 y guarda en a3
	
compara:					# comparamos si el resultado de la operacion es mayor que 50
	bgt	$a3,$t7,reiniciar	# branch if greater than, salta si a3 es menor que 50
	la	$a0,str_3			# Mostramos str_3 por pantalla
	li	$v0,4				# Preparamos salida por pantalla de cadena
	syscall					# llamada al sistema
	move $a0,$a3			# movemos $a3 a $a0 para mostrarlo
	li	$v0,1				# Preparamos salida por pantalla de un entero
	syscall					# llamada al sistema
	la	$a0,newlin			# Mostramos una linea en blanco por pantalla
	li	$v0,4				# Preparamos salida por pantalla de cadena
	syscall					# llamada al sistema
	j __start				# reiniciamos el programa
	
reiniciar:					# mostramos mensaje de error y reiniciamos el programa
	la	$a0,novale			# Mostramos novale por pantalla
	li	$v0,4				# Preparamos salida por pantalla de cadena
	syscall					# llamada al sistema
	j __start				# reiniciamos el programa