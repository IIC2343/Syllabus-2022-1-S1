.globl __start

.data:
    # set data
    A: .word 10
    B: .word 37
    testData: 
        .byte 0xF0, 0xF1, 0xF2, 0xF3
        .byte 0, 1, 0, 2
    small: .byte 128
.text
    .eqv numTres, 3
    __start:
        li a0, 192
        li a1, 0xFFEEDDCC
        li a2, 'A'
        li a3, numTres

        la a0, A
        lw a1, 0(a0)
        lw a2, B

        la a4, testData
        lw a5, 0(a4)

        lhu a6, 0(a4)
        lhu a7, 4(a4)

        sw a1, 0(a0)
        sw a2, 4(a0)

        la a0, small
        lb a1, 0(a0)
        lbu a2, 0(a0)

        addi a1, a1, 3
        sb a1, 1(a0)


        j end

    end:
        # end here, exit or run out of bottom
