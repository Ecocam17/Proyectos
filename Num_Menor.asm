.data
    num1: .asciiz "Digita el primer número: "
    num2: .asciiz "Digita el segundo número: "
    num3: .asciiz "Digita el tercer número: "
    menor: .asciiz "El número menor es: "

.text
.globl main

main:
    # Pedir al usuario los tres números
    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, num1     # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    li $v0, 5           # Cargar el código del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $s0, $v0       # Guardar el primer número en $s0

    li $v0, 4           
    la $a0, num2     
    syscall             
    li $v0, 5           
    syscall             
    move $s1, $v0       

    li $v0, 4
    la $a0, num3
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    # Encontrar el número menor
    move $t0, $s0      # Cargar el primer número en $t0
    blt $t0, $s1, check_num1  # Si el primer número es menor que el segundo, saltar a check_num1
    move $t0, $s1      # De lo contrario, el segundo número es menor
    check_num1:
    blt $t0, $s2, print_menor # Si el número mínimo actual es menor que el tercero, saltar a print_menor

    # El tercer número es menor
    move $t0, $s2

    print_menor:
    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, menor   # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena
    move $a0, $t0       # Cargar el número menor para imprimir
    li $v0, 1           # Cargar el código del servicio de impresión de entero
    syscall             # Llamar al servicio de impresión de entero
    li $v0, 10          # Cargar el código del servicio de salida
    syscall             # Llamar al servicio de salida