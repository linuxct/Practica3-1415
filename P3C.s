	.data
numpi:	.float	3.1415926
str_1:	.asciiz	"Introduce el valor de la altura: "
str_2:	.asciiz "Introduce un valor para el radio: "
str_3:	.asciiz "El volumen del cilindro es: "

	.globl	__start
	.text
__start:
	la	$a0,str_1				# Mostramos str_1 por pantalla
	li	$v0,4					# Preparamos salida por pantalla de cadena
	syscall						# llamada al sistema
	la	$v0,6					# preparamos entrada de numero en flotante a f0
	syscall						# llamada al sistema
	mov.s	$f5,$f0 				# movemos f0 a f5
	la	$a0,str_2				# Mostramos str_2 por pantalla
	li	$v0,4					# Preparamos salida por pantalla de cadena
	syscall						# llamada al sistema
	la	$v0,6					# preparamos entrada de numero en flotante a f0
	syscall						# llamada al sistema
	mov.s	$f6,$f0 				# movemos f0 a f6
	mul.s	$f6,$f6,$f6				# multiplicamos f6 por si mismo, y guardamos el valor en f6 (f6 al cuadrado)
	mul.s	$f6,$f6,$f5				# multiplicamos f6 por f5 y guardamos el valor en f6
	l.s		$f9,numpi			# cargamos Pi en f9
	mul.s	$f7,$f6,$f9				# multiplicamos f6 por f9
	la	$a0,str_3				# Mostramos str_3 por pantalla
	li	$v0,4					# Preparamos salida por pantalla de cadena
	syscall						# llamada al sistema
	mov.s	$f12,$f7				# movemos el resultado f7 a f12 para mostrarlo por pantalla
	la		$v0,2				# preparamos salida por pantalla de un flotante
	syscall						# llamada al sistema 
	li $v0,10					# Carga 10 en V0 para acabar el programa
	syscall						# Fin del programa
