# Soluciones tests

## T1

El estado final de la memoria debiese ser `-2, 3, -1, 4` en lugar de `-2, 5, -1, 5`. No se mantiene coherencia en la línea `NOP; MOV B, (0x0000); NOP; MOV B, (0x0002);`

## T2

El resultado final de la memoria debiese ser `6, 9, 1, -2` en lugar de `6, 5, 1, -2`. No se mantiene la coherencia en la línea `NOP; MOV B, (0x0000); MOV B, (0x0003); NOP;;;;`