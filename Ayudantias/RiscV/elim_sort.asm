#############################
#	    Ayudantia 5         #
#############################

# Elimintaion sort

# El algoritmo elimination sort consiste en recorrer un arreglo desde
# el final hasta el inicio, eliminando todos los numeros que son mayores
# al ultimo numero visto, si se ve un numero menor, este pasa a ser la 
# referencia. Cuando se elimina un numero, el arreglo debe correse a la
# izquierda


.globl start

.data

    n: .word 10
    A: .word -9, -13, -3, 12, 9, 0, 1, 7, 10, 11

.text
