#############################
#	    Ayudantia 5         #
#############################

# Arreglos 3x3

# Dado un arerglo 3x3 en orden por fila, escriba un script
# que copie los contenidos de la matriz a otra matriz de 3x3
# pero ordenada por columnas

.globl start

.data

    F: .word -7, 2, 13, 7, -4, -10, 5, -11, 10
    C: .word

.text
	j start
	trans_addr: # traduce direccion
		addi sp sp -4
        sw ra 0(sp)
		# args: a1 inicio arreglo C, a3 = i, a4 = j
		# en a0 deja la direccion para copiar
		li t0, 3
		mul t1, a4, t0 # t1 = j*3
		add t1, t1, a3 # t1 = t1 + i
		li t0, 4
		mul t1, t1, t0 # t1 = t1 * 4
		add a0, a1, t1 # a0 = addr_C(a1) + offset(t1)
		lw ra 0(sp)
        add sp sp 4
		jalr zero, 0(ra)
		
    start:
    	li s0, -1 # contador i
    	li s2, 3
    	la s3, F
    	fori:
    		addi s0, s0, 1
    		li t5, 3
    		beq s0, t5, end
    		li s1, 0 # contador j
    		forj:
    			la a1, C
    			mv a3, s0
    			mv a4, s1
    			jal ra, trans_addr
    			lw t0, 0(s3) # cargamos i,j de F
    			sw t0, 0(a0) # guardamos i,j en C + offset
    			addi s3, s3, 4 # incrementamos la direccion de F
    			li t1, 2
    			beq s1, t1, fori
    			addi s1, s1, 1
    			j forj
    	end:
    			
    			
    			