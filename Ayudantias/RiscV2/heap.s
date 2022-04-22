.data
	A: .word 11111
    B: .word 22222
    lenA: .word 3
    lenB: .word 4
    addrA: .word 0
    addrB: .word 7
	
	end: .space 1

.text	
	start:
		la s0, addrA
		la t0, end
		sw t0, 0(s0)
		
        la t0, A
        lw t1, 0(t0)
        la t0, lenA
        lw t2, 0(t0)
        li t3, 0
        la s0, addrA
        lw t4, 0(s0)
        
        loop1:
            beq t2, t3, next
            sw t1, 0(t4)
            addi t4, t4, 4
            addi t3, t3, 1
            j loop1
        
        next:
        la s1, addrB
        la t0, lenA
        lw t0, 0(t0)
        li t1, 4
        mul t0, t0, t1
        la t2, addrA
        lw t2, 0(t2)
        add t2, t2, t0
		sw t2, 0(s1)
		
		la t2, lenB
		lw t2, 0(t2)
		li t3, 0
		la t4, addrB
		lw t4, 0(t4)
		la t1, B
		lw t1, 0(t1)
        
        loop2:
            beq t2, t3, end1
            sw t1, 0(t4)
            addi t4, t4, 4
            addi t3, t3, 1
            j loop2
       end1:
