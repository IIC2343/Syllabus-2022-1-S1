.globl start

.data
	nano: .float 1E-12
	mini: .float 13.0000453, 10.0045
	mid: .float 230.1203888, 500000000.0
	big: .float 34567900568.879
	
	to_add: .float 500

.text	
	start:
        la t0, nano
        flw f0, 0(t0)
        la t0, mini
        lw t1, 0(t0)
        lw t2, 4(t0)
        fmv.s.x f1, t1
        fmv.s.x f2, t2
        fadd.s f3, f1, f2
        fsub.s f3, f3, f2
        la t0, mid
        flw f3, 4(t0)
        fmul.s f4, f3, f2
        fdiv.s f4, f4, f2
        fsqrt.s f2, f2
        feq.s t1, f2, f2
        flw f4, 0(t0)
        flt.s t2, f4, f3
        fmin.s f5, f4, f3
        fmax.s f5, f4, f3
