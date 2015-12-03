.globl __start

__start:
		li $t0,44				#44=Coma
		sb $t0,0x10020001		#Coma->0x10020001, justo al lado de 0x10020000, que es el numero a mostrar
		li $t0,91				#91=[, el caracter despues de la Z
		sb $t0,0x10020000		#91->0x10020000
		
bucle:
		sub $t0,$t0,1			#Resta de una ud. a t0
		sb 	$t0,0x10020000		#t0->0x10020000
		la 	$a0,0x10020000		#Cargamos 0x10020000 en a0 para mostrarlo por pantalla #la $a0,0x10020000+0x10020001
		beq $t0,65,ultimopaso	#Si t0=65, saltamos a ultimopaso
		jal put_str				#JAL, saltamos a put_str (escribir_string)
		j	bucle				#Volvemos a empezar el bucle
		
put_str:
		li	$v0,4				#Cargamos 4 para mostrar una cadena
		syscall					#llamada al sistema
		jr $31					#volvemos a rutina principal
		
ultimopaso:						#ultimo paso: eliminamos la coma final y mostramos a por pantalla
		li 	$t1,0				#cargamos 0 en t1
		sb 	$t1,0x10020001		#al cargar 0 en 0x10020001, eliminamos la coma que teniamos anteriormente guardada (44)
		jal put_str				#JAL, saltamos a put_str (escribir_string)
		j fin					#Jump a fin
fin:
		li	$v0,10				#Cargamos 10 para finalizar el programa
		syscall 				#llamada al sistema