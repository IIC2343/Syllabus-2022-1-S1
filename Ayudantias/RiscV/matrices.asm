#############################
#	    Ayudantia 5         #
#############################

# Arreglos 3x3

# Dado un arerglo 3x3 en orden por fila, escriba un script
# que copie los contenidos de la matriz a otra matriz de 3x3
# pero ordenada por columnas

# matriz en orden filas, para la coordenada i,j-> DIR + offset -> offset 4*(3*i + j)
# matriz en orden cplumnas, para la coordenada i,j-> DIR + offset -> offset 4*(i + 3*j)

.globl start

.data

    F: .word -7, 2, 13, 7, -4, -10, 5, -11, 10 # (i,j)
    C: .word

.text
