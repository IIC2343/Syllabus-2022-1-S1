.globl __start

.data:
    Words: .word 882, -900, 31213, -1
.text
    __start:
        equal:
            la a0, Words
            lw a1, 0(a0)
            li a2, 882
            li x0, 123123
            beq a1, a2, notEqual
            j end

        notEqual:
            lw a2, 4(a0)
            bne a1, a2, lessThan
            j end
        
        # todas estas instrucciones son para signed representations
        # los equivalentes bltu, bgtu, etc. sirven para interpretar
        # los registros como unsigned
        lessThan: 
            blt a2, a1, greaterThan
            j end
        
        greaterThan:
            lw a3, 12(a0)
            bgt a3, a2, lessEqual
            j end
        
        lessEqual:
            li a4, -1
            ble a4, a3, greaterEqual
            j end
        
        greaterEqual:
            lw a6, 8(a0)
            bge a6, zero, next
            j end

        next:
            
    end:
        # end here, exit or run out of bottom
