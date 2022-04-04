.globl __start

.text
    __start:
        li a0, 129
        li a1, 20

        add a2, a0, a1
        addi a1, a1, 77

        sub a2, a0, a1
        # subi no existe!
        addi a3, a1, -77
        
        li a0, 2
        li a1, 100
        mul a2, a0, a1
        rem a3, a2, a0
        div a4, a2, a0

    end:
        # end here, exit or run out of bottom
