.globl __start

.data:
    # set data
.text
    __start:
        # do stuff
        j jumpTest

        secondJump:
            la ra, zapallo
            j thirdJump
        zapallo:
	        j thirdJump

        jumpTest:
            li a0, 0
            addi a0, a0, 20
            j secondJump
        
        thirdJump:
            li a1, 10
            li a2, 20
            mul a0, a0, a1
            add a0, a0, a2
            jr ra
            

        fourthJump:
            j end
        
    end:
        # end here, exit or run out of bottom
