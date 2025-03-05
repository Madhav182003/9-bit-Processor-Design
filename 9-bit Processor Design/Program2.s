moi r0, #1
lsl r0, #3
lsl r0, #3
lsl r0, #1
mov r0, r1
lsr r1, #1
add r0, r1
lsr r1, #1
add r0,r1
lsr r1, #1
add r0,r1
lsr r1, #1
add r0,r1
lsr r1, #1
add r0,r1
lsr r1, #1
add r0,r1
lsr r1, #1
add r0,r1
moi r1, #1
lsl r1, #3
lsl r1, #3
moi r2, #2
add r1,r2
str 00000
str 00001
moi r0,#0
str 00010
str 00011
moi r0, #0
mov r0, r6
moi r1, #2
add r1, r6
mov r1, r7 
cmp r0, r0
beq 10000
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
scm r3, r5
beq 10011
blt 10010
moi r1, #0
add r1, r7
ldr 00000
mov r0, r2
ldr 00001
mov r0, r3
moi r1, #0
add r1, r6
ldr 00000
mov r0, r4
ldr 00001
mov r0, r5 
cmp r0, r0
beq 10101
moi r1, #0
add r1, r6
ldr 00000
mov r0, r2
ldr 00001
mov r0, r3
moi r1, #0
add r1, r7
ldr 00000
mov r0, r4
ldr 00001
mov r0, r5 
cmp r0, r0
beq 10101
moi r1, #0
add r1, r7
ldr 00001
mov r0, r3
moi r1, #0
add r1, r6
ldr 00001
mov r0, r5
cmp r3, r5
beq 10100
blt 10010
cmp r0, r0
beq 10001
moi r2, #0				
moi r3, #0
cmp r0, r0
beq 10110
not r1, r5
moi r0, #1
add r1, r0
mov r1, r5
not r1, r4
moi r0, #0
adc r1, r0 
mov r1, r4
add r3, r5
adc r2, r4
moi r1, #1
moi r0, #0
add r1, r0
lsl r1, #3
lsl r1, #3 
ldr 00010
mov r0, r4
ldr 00011
mov r0, r5
cmp r2, r4
beq 10111
blt 11000 
cmp r0, r0
beq 11001
cmp r3, r5 
blt 11000 
cmp r0, r0
beq 11001
mov r2, r0
str 00010
moi r0, #0
add r0, r3
str 00011
cmp r0, r0
beq 11100
ldr 00100
mov r0, r4
ldr 00101
mov r0, r5
moi r0, #0
add r0, r4
cmp r0, r2 
beq 11010
blt 11011 
cmp r0, r0
beq 11100 
moi r0, #0
add r0, r5
cmp r0, r3 
blt 11011
cmp r0, r0
beq 11100
moi r0, #0
add r0, r2
str 00100
moi r0, #0
add r0, r3
str 00101
moi r3, #2
add r3, r7
mov r3, r7
moi r0, #1
lsl r0, #3
lsl r0, #3
cmp r0, r7
beq 11101
cmp r0, r0
beq 10000
moi r3, #2
add r3, r6
mov r3, r6
moi r1, #4
lsl r1, #3
moi r0, #4
lsl r0, #2
add r1, r0
lsr r0, #1
add r1, r0
lsr r0, #1
add r1, r0
lsr r0, #1
add r1, r0
cmp r1, r6
beq 00000
cmp r0, r0
beq 01111