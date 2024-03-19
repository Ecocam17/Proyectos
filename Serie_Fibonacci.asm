# Laboratorio 1: Simulaci�n y optimizaci�n de un programa en un procesador escalar segmentado
# Realizado por: ENRIQUE OLMEDO PADILLA
# 19-03-2024

.data
    # Pedir al usuario que digite un numero
    numero_max: .asciiz "Ingrese el n�mero m�ximo para generar la serie Fibonacci: "
    mensaje: .asciiz "La serie Fibonacci hasta el n�mero m�ximo ingresado es: "
    coma_espacio: .asciiz ", " # Asigna una coma y un espacio entre cada numero

.text
.globl main

# Programa principal
main:
    # Pedir al usuario el n�mero m�ximo para generar la serie Fibonacci
    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, numero_max  # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena

    li $v0, 5           # Cargar el c�digo del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $t0, $v0       # Guardar el n�mero m�ximo ingresado en $t0

    # Mostrar la serie Fibonacci hasta el n�mero m�ximo ingresado
    li $t1, 0           # Inicializar el primer t�rmino de la serie (F(0))
    li $t2, 1           # Inicializar el segundo t�rmino de la serie (F(1))

    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, mensaje     # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena

    li $t3, 0           # Inicializar una variable para almacenar el siguiente t�rmino de la serie

    loop:
    li $v0, 1           # Cargar el c�digo del servicio de impresi�n de entero
    move $a0, $t1       # Cargar el primer t�rmino para imprimir
    syscall             # Llamar al servicio de impresi�n de entero

    # Si el siguiente t�rmino supera el n�mero m�ximo, salir del bucle
    bge $t1, $t0, exit  

    li $v0, 4            # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, coma_espacio # Cargar la direcci�n de la cadena a imprimir una coma y un espacio
    syscall              # Llamar al servicio de impresi�n de cadena

    add $t3, $t1, $t2   # Calcular el siguiente t�rmino de la serie (F(n) = F(n-1) + F(n-2))
    move $t1, $t2       # Mover el valor de F(n-1) a F(n-2) para la siguiente iteraci�n
    move $t2, $t3       # Mover el valor calculado (F(n)) a F(n-1) para la siguiente iteraci�n
    j loop              # Saltar al inicio del bucle

    exit:
    li $v0, 10          # Cargar el c�digo del servicio de salida
    syscall             # Llamar al servicio de salida
