# Laboratorio 1: Simulación y optimización de un programa en un procesador escalar segmentado
# Realizado por: ENRIQUE OLMEDO PADILLA
# 19-03-2024

.data
    # Pedir al usuario los tres números
    num1: .asciiz "Digita el primer número: "
    num2: .asciiz "Digita el segundo número: "
    num3: .asciiz "Digita el tercer número: "
    mayor: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Programa principal
    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, num1        # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    li $v0, 5           # Cargar el código del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s0, $v0       # Guardar el primer número en $s0

    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, num2        # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    li $v0, 5           # Cargar el código del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s1, $v0       # Guardar el segundo número en $s1

    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, num3        # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    li $v0, 5           # Cargar el código del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s2, $v0       # Guardar el tercer número en $s2

    # Encontrar el número mayor
    move $t0, $s0             # Cargar el primer número en $t0
    bgt $t0, $s1, check_num1  # Si el primer número es mayor que el segundo, saltar a check_num1
    move $t0, $s1             # De lo contrario, el segundo número es mayor
    check_num1:
    bgt $t0, $s2, print_mayor # Si el número máximo actual es mayor que el tercero, saltar a print_mayor

    # El tercer número es mayor
    move $t0, $s2

    print_mayor:
    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, mayor       # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    move $a0, $t0       # Cargar el número mayor para imprimir
    li $v0, 1           # Cargar el código del servicio de impresión de entero
    syscall             # Llamar al servicio de impresión de entero
    li $v0, 10          # Cargar el código del servicio de salida
    syscall             # Llamar al servicio de salida 
