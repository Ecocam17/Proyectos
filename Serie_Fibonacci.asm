.data
    numero_max: .asciiz "Ingrese el número máximo para generar la serie Fibonacci: "
    result_msg: .asciiz "La serie Fibonacci hasta el número máximo ingresado es: "
    comma_space: .asciiz ", "

.text
.globl main

main:
    # Pedir al usuario el número máximo para generar la serie Fibonacci
    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, numero_max      # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena

    li $v0, 5           # Cargar el código del servicio de lectura de entero
    syscall             # Llamar al servicio de lectura de entero
    move $t0, $v0       # Guardar el número máximo ingresado en $t0

    # Mostrar la serie Fibonacci hasta el número máximo ingresado
    li $t1, 0           # Inicializar el primer término de la serie (F(0))
    li $t2, 1           # Inicializar el segundo término de la serie (F(1))

    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, result_msg  # Cargar la dirección de la cadena a imprimir
    syscall             # Llamar al servicio de impresión de cadena

    li $t3, 0           # Inicializar una variable para almacenar el siguiente término de la serie

    loop:
    li $v0, 1           # Cargar el código del servicio de impresión de entero
    move $a0, $t1       # Cargar el primer término para imprimir
    syscall             # Llamar al servicio de impresión de entero

    # Si el siguiente término supera el número máximo, salir del bucle
    bge $t1, $t0, exit  

    li $v0, 4           # Cargar el código del servicio de impresión de cadena
    la $a0, comma_space # Cargar la dirección de la cadena a imprimir (coma y espacio)
    syscall             # Llamar al servicio de impresión de cadena

    add $t3, $t1, $t2   # Calcular el siguiente término de la serie (F(n) = F(n-1) + F(n-2))
    move $t1, $t2       # Mover el valor de F(n-1) a F(n-2) para la siguiente iteración
    move $t2, $t3       # Mover el valor calculado (F(n)) a F(n-1) para la siguiente iteración
    j loop              # Saltar al inicio del bucle

    exit:
    li $v0, 10          # Cargar el código del servicio de salida
    syscall             # Llamar al servicio de salida
