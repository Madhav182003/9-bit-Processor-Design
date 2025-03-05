moi r0, 0
mov r0, r7
moi r1, #1
lsl r1, #3
lsl r1, #3
lsl r1, #1
moi r0, #0
add r0, r7
str 00000
mov r0, r1
ldr 00000
mov r0, r5
ldr 00001
mov r0, r6
ldr 00011
moi r2, #0
moi r3, #0
mov r2, r7
moi r1, #0
mov r1, r4
cmp r0, r7
beq 01001
lsr r0, #1
adf r3, r6
adf r2, r5
adf r1, r4
lsl r6, #1
lsl r5, #1
lsl r4, #1
cmp r0, r0
beq 01010
moi r0, #1
lsl r0, #3
lsl r0, #3
lsl r0, #1
mov r1, r4
mov r0, r1
ldr 00000
mov r0, r1
mov r0, r5 
moi r0, #1
lsl r0, #3
lsl r0, #3
add r1, r0
mov r3, r0
str 00011 
mov r2, r3
moi r2, #0
add r2, r4
moi r1, #0
add r1, r5
ldr 00000
mov r0, r5
ldr 00001
mov r0, r6
ldr 00010
moi r1, #0
mov r1, r4
cmp r0, r7
beq 01011 
lsr r0, #1
adf r3, r6
adf r2, r5
adf r1, r4
lsl r6, #1
lsl r5, #1
lsl r4, #1
cmp r0, r0
beq 01100 
mov r1, r4
mov r2, r5
mov r3, r6
moi r1, #1
lsl r1, #3
lsl r1, #3
lsl r1, #1
ldr 00000 
mov r0, r7
mov r0, r1
moi r0, #1
lsl r0, #3
lsl r0, #3
add r1, r0
moi r0, #0
add r0, r4
str 00000
moi r0, #0
add r0, r5
str 00001
moi r0, #0
add r0, r6
str 00010
moi r1, #4
add r1, r7
mov r1, r7
moi r1, #1
lsl r1, #3
lsl r1, #3
cmp r1, r7
beq 01101
cmp r0, r0
beq 01110
beq 00000