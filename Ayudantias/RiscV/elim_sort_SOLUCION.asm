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

    start:
        la t0, n
        lw a1, 0(t0) # cargar n en a1, a1 = N
        mv a2, a1
        addi a2, a2, -1 # tope = N
        j sort
        
        elim:
            addi sp sp -4
            sw ra 0(sp)
            # recibe N en a1 y tope en a2
            la t1, A
            li t2, 4
            mul t2, t2, a1
            add t1, t1, t2 # dir actual en el arreglo (contador)
            li t2, 4
            sub t3, a2, a1
            mul t2, t2, t3
            mv t4, t1
            add t4, t4, t2 # dir final del arreglo
            for:
                lw t2, 4(t1) # t2 <- A[i + 1]
                sw t2, 0(t1) # A[i] <- t2
                addi t1, t1, 4
                blt t1, t4, for
            li t0, 0
            sw t0, 0(t4)
            addi a2, a2, -1
            lw ra 0(sp)
            add sp sp 4
            jalr zero, 4(ra)

        sort:
            la t0, A
            li t1, 4
            addi a1, a1, -1
            mul t5, a1, t1
            add t0, t0, t5
            lw a3, 0(t0) # referencia
            while: # N >= 0
                addi a1, a1, -1 # reducimos N
                la t0, A
                li t1, 4
                mul t2, t1, a1
                add t0, t0, t2
                lw t1, 0(t0) # cargamos A[N]
                ble t1, a3, next # si es menor que ref, seguimos
                jal ra, elim # si es mayor, lo tenemos que eliminar
                next:
	                mv a3, t1 # actualizamos la referencia
                    bltz a1, end # revisamos si se termino la lista
                    j while
    end:
