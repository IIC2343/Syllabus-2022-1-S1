.globl start

.data
	turno: .word 2
    	.space 10
    	fin: .word 0
    	.space 5
    	p1: .word 2
    	hits1: .word 0
    	.space 5
    	p2: .word 3
    	hits2: .word 0
    	.space 5
    	h1: .word 100
    	h2: .word 100
    
    
    
.text
    start:
    	turno1:
    		la t0, turno
    		lb s0, 0(t0)
    		addi s0, s0, -1
    		sw s0, (t0)
    		
    		la t1, h2
    		la t2, p1
    		la t3, hits2
    		
    		lb a1, 0(t1)
    		lb a2, 0(t2)
    		sub a1, a1, a2
    		
    		sw a1, (t1)
    		lb a3, 0(t3)
    		addi a3, a3, 1
    		sw a3, (t3)
    		
    		mv a4, zero
    		ble a1, a4, end
    		
    		
    		
    		j turno2
    		
    	turno2:
    		la t0, turno
    		lb s0, 0(t0)
    		addi s0, s0, 1
    		sw s0, (t0)
    		
    		la t1, h1
    		la t2, p2
    		la t3, hits1
    		
    		lb a1, 0(t1)
    		lb a2, 0(t2)
    		sub a1, a1, a2
    		
    		sw a1, (t1)
    		lb a3, 0(t3)
    		addi a3, a3, 1
    		sw a3, (t3)
    		
    		mv a4, zero
    		ble a1, a4, end
    		
    		j turno1
    
    	
        
    end:
       	la t0, fin
    	lb s0, 0(t0)
    	la t1, turno
    	lb s1, 0(t1)
    	add s0, s0, s1
    	sw s0, (t0)
