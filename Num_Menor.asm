# Laboratorio 1: Simulaci�n y optimizaci�n de un programa en un procesador escalar segmentado
# Realizado por: ENRIQUE OLMEDO PADILLA
# 19-03-2024

.data
    # Pedir al usuario los tres n�meros
    num1: .asciiz "Digita el primer n�mero: "
    num2: .asciiz "Digita el segundo n�mero: "
    num3: .asciiz "Digita el tercer n�mero: "
    menor: .asciiz "El n�mero menor es: "

.text
.globl main

main:
    # Programa principal
    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, num1        # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena
    li $v0, 5           # Cargar el c�digo del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s0, $v0       # Guardar el primer n�mero en $s0

    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, num2        # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena
    li $v0, 5           # Cargar el c�digo del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s1, $v0       # Guardar el segundo n�mero en $s1

    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, num3        # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena
    li $v0, 5           # Cargar el c�digo del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s2, $v0       # Guardar el tercer n�mero en $s2

    # Encontrar el n�mero menor
    move $t0, $s0             # Cargar el primer n�mero en $t0
    blt $t0, $s1, check_num1  # Si el primer n�mero es menor que el segundo, saltar a check_num1
    move $t0, $s1             # De lo contrario, el segundo n�mero es menor
    check_num1:
    blt $t0, $s2, print_menor # Si el n�mero m�nimo actual es menor que el tercero, saltar a print_menor

    # El tercer n�mero es menor
    move $t0, $s2

    print_menor:
    li $v0, 4           # Cargar el c�digo del servicio de impresi�n de cadena
    la $a0, menor       # Cargar la direcci�n de la cadena a imprimir
    syscall             # Llamar al servicio de impresi�n de cadena
    move $a0, $t0       # Cargar el n�mero menor para imprimir
    li $v0, 1           # Cargar el c�digo del servicio de impresi�n de entero
    syscall             # Llamar al servicio de impresi�n de entero
    li $v0, 10          # Cargar el c�digo del servicio de salida
    syscall             # Llamar al servicio de salida
