moi r0, #0
moi r1, #0
moi r2, #0
moi r3, #0
mov r0, r4
mov r0, r5
mov r0, r6
mov r0, r7
mov r0, r6
moi r1, #2
add r1, r6
mov r1, r7
moi r1, #0
add r1, r6
ldr 00000
mov r0, r5
moi r1, #0
add r1, r7
ldr 00000
mov r0, r3
xor r3, r5
rad r2, r3
ldr 00001
mov r0, r3
moi r1, #0
add r1, r6
ldr 00001
mov r0, r5
xor r3, r5
mov r2, r1
rad r2, r3
add r2, r1 
moi r1, #1
lsl r1, #3
lsl r1, #3
mov r2, r0
str 00000
str 00001
moi r3, #2
add r3, r7
mov r3, r7
cmp r0, r0
beq 00001
moi r3, #2
add r3, r6
mov r3, r7
moi r1, #0
add r1, r6
ldr 00000
mov r0, r5
moi r1, #0
add r1, r7
ldr 00000
mov r0, r3
xor r3, r5
rad r2, r3
ldr 00001
mov r0, r3
moi r1, #0
add r1, r6
ldr 00001
mov r0, r5
xor r3, r5
mov r2, r1
rad r2, r3
add r2, r1 
moi r1, #1
lsl r1, #3
lsl r1, #3
ldr 00000 
cmp r2, r0
blt 00010
cmp r0, r0
beq 00011
mov r2, r0
str 00000
ldr 00001
cmp r0, r2
blt 00100 
cmp r0, r0
beq 00101
mov r2, r0
str 00001
moi r3, #2
add r3, r7
mov r3, r7
moi r1, #4
lsl r1, #3
lsl r1, #1
cmp r1, r7
beq 00110
cmp r0, r0
beq 00001
moi r3, #2
add r3, r6
mov r3, r6
moi r1, #4 @r1=4
lsl r1, #3 @r1=32
moi r0, #4 @r0=4
lsl r0, #2 @r0=16
add r1, r0 @r1=48
lsr r0, #1 @r0=8
add r1, r0
lsr r0, #1
add r1, r0
lsr r0, #1
add r1, r0
cmp r1, r6
beq 00000 @here instead of endprog i've made this statement deliver done flag saving 1 space in LUT
cmp r0, r0
beq 00111