	.data
coma:	.asciiz ", "
        .text
		.globl __start
__start:
li $t0,'[' 				#Empezamos por el caracter posterior a la Z segun la tabla de codigos ASCII. Tambien se podria haber puesto 91.
bucle:
	sub $t0,1 			#Decrementamos $t0
	move $a0,$t0		#Copiamos el caracter de t0 para mostrarlo en a0
	li $v0,11			#Usamos 11 para imprimir un caracter
	syscall				#Llamada al sistema

	beq $t0,'A',fin 	#Si t0 = caracter 'A', fin del bucle. Tambien se podria haber puesto 65.
	la	$a0,coma		#Si no se finaliza, preparamos la salida de una coma ','
	li $v0,4			#Escribe cadena de texto
	syscall				#Llamada al sistema
	jal bucle			#Volvemos a ejecutar el bucle
fin:
	li $v0,10			#Carga 10 en V0 para acabar el programa
	syscall				#Fin del programa
