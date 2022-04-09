.globl __start
.data
    A: .word 12354, 231423, 14562354, 23523452, 146524356
    B: .byte 0xFF, 0xC4,
    
.text
    sum_squares: # suma el cuadrado de todos los numeros de 1 a n
        # prologo:
            addi sp sp -16
            sw s0 0(sp)
            sw s1 4(sp)
            sw s2 8(sp)
            sw ra 12(sp)

            li s0 1
            mv s1 a0
            mv s2 zero

        loop:
            bge s0 s1 loop_end
            mv a0 s0
            jal square
            add s2 s2 a0
            addi s0 s0 1
            j loop
        loop_end:
            mv a0 s2

        # epilogo:
            lw ra 12(sp)
            lw s0 0(sp)
            lw s1 4(sp)
            lw s2 8(sp)
            addi sp sp 16
            jr ra

    square:  # devuelve el cuadrado de un numero en a0
        prologo:
            addi sp sp -4
            sw ra 0(sp)
        
        body:
            mul a0 a0 a0
        
        epilogo:
            lw ra 0(sp)
            addi sp sp 4
            jr ra

    __start:
        la t0 A
        lw a0 0(t0)
        j sum_squares
	
