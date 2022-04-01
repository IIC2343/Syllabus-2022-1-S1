.globl __start

.text
    __start:
        addi a0, zero, 10
        li a1, 11
        li a2, 35

        mv a0, a1
        mv a1, a2

        j end

    end:
        # end here, exit or run out of bottom
