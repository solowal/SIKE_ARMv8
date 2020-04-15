

.data
//p610 + 1
p610p1:
.quad 0x6E02000000000000
.quad 0xB1784DE8AA5AB02E
.quad 0x9AE7BF45048FF9AB
.quad 0xB255B2FA10C4252A
.quad 0x819010C251E7D88C
.quad 0x000000027BF6A768

//2 * p610
p610x2:
.quad 0xFFFFFFFFFFFFFFFE
.quad 0xFFFFFFFFFFFFFFFF
.quad 0xFFFFFFFFFFFFFFFF
.quad 0xFFFFFFFFFFFFFFFF
.quad 0xDC03FFFFFFFFFFFF
.quad 0x62F09BD154B5605C
.quad 0x35CF7E8A091FF357
.quad 0x64AB65F421884A55
.quad 0x03202184A3CFB119
.quad 0x00000004F7ED4ED1

//p610 << 16
p610s16:
.quad 0x4DE8AA5AB02E6E02
.quad 0xBF45048FF9ABB178
.quad 0xB2FA10C4252A9AE7
.quad 0x10C251E7D88CB255
.quad 0x27BF6A7688190



.text



.globl add610_func
.globl _add610_func

.globl sub610_func
.globl _sub610_func




.globl mul640_func
.globl _mul640_func

.globl rdc610_func
.globl _rdc610_func


.globl old_rdc610_func
.globl _old_rdc610_func


rdc610_func:
_rdc610_func:

    sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    stp x25, x26, [sp,#48]
    stp x27, x28, [sp,#64]
    stp x29, x30, [sp,#80]
	
	ldr     x2, p610s16 + 0
	ldr     x3, p610s16 + 8
	ldr     x4, p610s16 + 16
	ldr     x5, p610s16 + 24
	ldr     x6, p610s16 + 32
	
	//operand load 01
	ldp 	x7, x8, [x0,#8*0]
	
	//0
	mul x19, x7, x2
    umulh x14, x7, x2
		
    mul x10, x7, x3
	umulh x15, x7, x3
	adds x20, x10, x14

	mul x11, x7, x4
	umulh x16, x7, x4
	adcs x21, x11, x15

	mul x12, x7, x5
	umulh x17, x7, x5
	adcs x22, x12, x16

	mul x13, x7, x6
	umulh x18, x7, x6
	
	adcs x23, x13, x17
	adcs x24, xzr, x18
	
	//1
	mul x9 , x8, x2
	mul x10, x8, x3
    adds x20, x20, x9
	mul x11, x8, x4
	adcs x21, x21, x10
	mul x12, x8, x5
	adcs x22, x22, x11
	mul x13, x8, x6
	
	
	adcs x23, x23, x12
	adcs x24, x24, x13
	adcs x25, xzr, xzr
	
	umulh x14, x8, x2
	umulh x15, x8, x3
	adds x21, x21, x14
	umulh x16, x8, x4
	adcs x22, x22, x15
	umulh x17, x8, x5
	adcs x23, x23, x16
	umulh x18, x8, x6
	
	adcs x24, x24, x17
	adcs x25, x25, x18
	
	
	//operand load 23
	ldp 	x7, x8, [x0,#8*2]
	//2
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x21, x21, x9
	mul x11, x7, x4
	adcs x22, x22, x10
	mul x12, x7, x5
	adcs x23, x23, x11
	mul x13, x7, x6
	
	adcs x24, x24, x12
	adcs x25, x25, x13
	adcs x26, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x22, x22, x14
	umulh x16, x7, x4
	adcs x23, x23, x15
	umulh x17, x7, x5
	adcs x24, x24, x16
	umulh x18, x7, x6
	
	adcs x25, x25, x17
	adcs x26, x26, x18
	
	//3
	mul x9 , x8, x2
	mul x10, x8, x3
	adds x22, x22, x9
	mul x11, x8, x4
	adcs x23, x23, x10
	mul x12, x8, x5
	adcs x24, x24, x11
	mul x13, x8, x6
	
	adcs x25, x25, x12
	adcs x26, x26, x13
	adcs x27, xzr, xzr
	
	umulh x14, x8, x2
	umulh x15, x8, x3
	adds x23, x23, x14
	umulh x16, x8, x4
	adcs x24, x24, x15
	umulh x17, x8, x5
	adcs x25, x25, x16
	umulh x18, x8, x6
	
	adcs x26, x26, x17
	adcs x27, x27, x18
	
	//4
	ldr		x7, [x0, #8*4]
	lsl     x8, x19, #48
	adds	x7, x7, x8
	adcs	x8, xzr, xzr



	mul x9 , x7, x2
	mul x10, x7, x3
	adds x23, x23, x9
	mul x11, x7, x4
	adcs x24, x24, x10
	mul x12, x7, x5
	adcs x25, x25, x11
	mul x13, x7, x6
	
	adcs x26, x26, x12
	adcs x27, x27, x13
	adcs x28, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x24, x24, x14
	umulh x16, x7, x4
	adcs x25, x25, x15
	umulh x17, x7, x5
	adcs x26, x26, x16
	umulh x18, x7, x6
	
	adcs x27, x27, x17
	adcs x28, x28, x18
	
	
	//5
	lsl     x7, x20, #48
	orr     x7, x7, x19, lsr #16
	adds	x8, x8, x7
	adcs	x9, xzr, xzr
	ldr		x7, [x0, #8*5]
	adds	x7, x7, x8
	adcs	x8, x9, xzr



	
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x24, x24, x9
	mul x11, x7, x4
	adcs x25, x25, x10
	mul x12, x7, x5
	adcs x26, x26, x11
	mul x13, x7, x6
	
	adcs x27, x27, x12
	adcs x28, x28, x13
	adcs x29, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x25, x25, x14
	umulh x16, x7, x4
	adcs x26, x26, x15
	umulh x17, x7, x5
	adcs x27, x27, x16
	umulh x18, x7, x6
	
	adcs x28, x28, x17
	adcs x29, x29, x18
	
	//6
	lsl     x7, x21, #48
	orr     x7, x7, x20, lsr #16
	adds	x8, x8, x7
	adcs	x9, xzr, xzr
	ldr		x7, [x0, #8*6]
	adds	x7, x7, x8
	adcs	x8, x9, xzr


	
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x25, x25, x9
	mul x11, x7, x4
	adcs x26, x26, x10
	mul x12, x7, x5
	adcs x27, x27, x11
	mul x13, x7, x6
	
	adcs x28, x28, x12
	adcs x29, x29, x13
	adcs x19, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x26, x26, x14
	umulh x16, x7, x4
	adcs x27, x27, x15
	umulh x17, x7, x5
	adcs x28, x28, x16
	umulh x18, x7, x6
	
	adcs x29, x29, x17
	adcs x19, x19, x18
	
	//7
	lsl     x7, x22, #48
	orr     x7, x7, x21, lsr #16
	adds	x8, x8, x7
	adcs	x9, xzr, xzr
	ldr		x7, [x0, #8*7]
	adds	x7, x7, x8
	adcs	x8, x9, xzr



	
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x26, x26, x9
	mul x11, x7, x4
	adcs x27, x27, x10
	mul x12, x7, x5
	adcs x28, x28, x11
	mul x13, x7, x6
	
	adcs x29, x29, x12
	adcs x19, x19, x13
	adcs x20, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x27, x27, x14
	umulh x16, x7, x4
	adcs x28, x28, x15
	umulh x17, x7, x5
	adcs x29, x29, x16
	umulh x18, x7, x6
	
	adcs x19, x19, x17
	adcs x20, x20, x18
	
	
	
	//8
	lsl     x7, x23, #48
	orr     x7, x7, x22, lsr #16
	adds	x8, x8, x7
	adcs	x9, xzr, xzr
	ldr		x7, [x0, #8*8]
	adds	x7, x7, x8
	adcs	x8, x9, xzr


	
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x27, x27, x9
	mul x11, x7, x4
	adcs x28, x28, x10
	mul x12, x7, x5
	adcs x29, x29, x11
	mul x13, x7, x6
	
	adcs x19, x19, x12
	adcs x20, x20, x13
	adcs x21, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
	adds x28, x28, x14
	umulh x16, x7, x4
	adcs x29, x29, x15
	umulh x17, x7, x5
	adcs x19, x19, x16
	umulh x18, x7, x6
	
	adcs x20, x20, x17
	adcs x21, x21, x18
	
	//9
	lsl     x7, x24, #48
	orr     x7, x7, x23, lsr #16
	adds	x8, x8, x7
	adcs	x9, xzr, xzr
	ldr		x7, [x0, #8*9]
	adds	x7, x7, x8
	adcs	x30, x9, xzr


	
	mul x9 , x7, x2
	mul x10, x7, x3
	adds x28, x28, x9
	mul x11, x7, x4
	adcs x29, x29, x10
	mul x12, x7, x5
	adcs x19, x19, x11
	mul x13, x7, x6
	
	adcs x20, x20, x12
	adcs x21, x21, x13
	adcs x22, xzr, xzr
	
	umulh x14, x7, x2
	umulh x15, x7, x3
adds x29, x29, x14
	umulh x16, x7, x4
	adcs x19, x19, x15
	umulh x17, x7, x5
	adcs x20, x20, x16
	umulh x18, x7, x6
	
	


	adcs x21, x21, x17
	adcs x22, x22, x18
	
	//result
	lsl     x2, x25, #48
	orr     x2, x2, x24, lsr #16
	lsl     x3, x26, #48
	orr     x3, x3, x25, lsr #16
	lsl     x4, x27, #48
	orr     x4, x4, x26, lsr #16
	lsl     x5, x28, #48
	orr     x5, x5, x27, lsr #16
	lsl     x6, x29, #48
	orr     x6, x6, x28, lsr #16
	lsl     x7, x19, #48
	orr     x7, x7, x29, lsr #16
	lsl     x8, x20, #48
	orr     x8, x8, x19, lsr #16
	lsl     x9, x21, #48
	orr     x9, x9, x20, lsr #16
	lsl     x10, x22, #48
	orr     x10, x10, x21, lsr #16
	
	orr     x11, xzr, x22, lsr #16

    ldp 	x12, x13, [x0,#8*10]
    ldp 	x14, x15, [x0,#8*12]
    ldp 	x16, x17, [x0,#8*14]
    ldp 	x18, x19, [x0,#8*16]
    ldp 	x20, x21, [x0,#8*18]

    sub  x29, xzr, x30
    adds x29,x29,x30

    adcs    x2,x2,x12
    adcs    x3,x3,x13
    adcs    x4,x4,x14
    adcs    x5,x5,x15
    adcs    x6,x6,x16
    adcs    x7,x7,x17
    adcs    x8,x8,x18
    adcs    x9,x9,x19
    adcs    x10,x10,x20
	
    adcs    x11,x11,x21
	//
	stp x2,x3, [x1,#8*0]
	stp x4,x5, [x1,#8*2]
	stp x6,x7, [x1,#8*4]
	stp x8,x9, [x1,#8*6]
	stp x10,x11, [x1,#8*8]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96

ret



add610_func:
_add610_func:
	//
	sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
	//

	ldp x3,x4, 		[x0,#0]
	ldp x5,x6, 		[x0,#16]
	ldp x7,x8, 		[x0,#32]
	ldp x9,x10,	   	[x0,#48]
	ldp x11,x12,	[x0,#64]
	
	ldp x13,x14, [x1,#0]
	ldp x15,x16, [x1,#16]
	ldp x17,x18, [x1,#32]
	ldp x19,x20, [x1,#48]
	ldp x21,x22, [x1,#64]
	
	adds x3,x3,x13
	adcs x4,x4,x14
	adcs x5,x5,x15
	adcs x6,x6,x16
	adcs x7,x7,x17
	adcs x8,x8,x18
	adcs x9,x9,x19
	adcs x10,x10,x20
	adcs x11,x11,x21
	adc  x12,x12,x22

	ldr x13, p610x2
	ldr x14, p610x2 + 8
	ldr x15, p610x2 + 16
	ldr x16, p610x2 + 24
	ldr x17, p610x2 + 32
	ldr x18, p610x2 + 40
	ldr x19, p610x2 + 48
	ldr x20, p610x2 + 56
	ldr x21, p610x2 + 64
	ldr x22, p610x2 + 72
	
	subs x3,x3,x13
	sbcs x4,x4,x14
	sbcs x5,x5,x15
	sbcs x6,x6,x16
	sbcs x7,x7,x17
	sbcs x8,x8,x18
	sbcs x9,x9,x19
	sbcs x10,x10,x20
	sbcs x11,x11,x21
	sbcs x12,x12,x22
	sbc  x0,xzr,xzr
	
	and x13,x13,x0
	and x14,x14,x0
	and x15,x15,x0
	and x16,x16,x0
	and x17,x17,x0
	and x18,x18,x0
	and x19,x19,x0
	and x20,x20,x0
	and x21,x21,x0
	and x22,x22,x0
	
	adds x3,x3,x13
	adcs x4,x4,x14
	adcs x5,x5,x15
	adcs x6,x6,x16
	adcs x7,x7,x17
	adcs x8,x8,x18
	adcs x9,x9,x19
	adcs x10,x10,x20
	adcs x11,x11,x21
	adc  x12,x12,x22

	stp x3,x4, [x2,#0]
	stp x5,x6, [x2,#16]
	stp x7,x8, [x2,#32]
	stp x9,x10, [x2,#48]
	stp x11,x12, [x2,#64]
	
	//stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    
    add sp, sp, #96
ret


sub610_func:
_sub610_func:
	//
	sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
	//

	ldp x3,x4, [x0,#0]
	ldp x5,x6, [x0,#16]
	ldp x7,x8, [x0,#32]
	ldp x9,x10,	   [x0,#48]
	ldp x11,x12,	   [x0,#64]
	
	ldp x13,x14, [x1,#0]
	ldp x15,x16, [x1,#16]
	ldp x17,x18, [x1,#32]
	ldp x19,x20, [x1,#48]
	ldp x21,x22, [x1,#64]

	subs x3,x3,x13
	sbcs x4,x4,x14
	sbcs x5,x5,x15
	sbcs x6,x6,x16
	sbcs x7,x7,x17
	sbcs x8,x8,x18
	sbcs x9,x9,x19
	sbcs x10,x10,x20
	sbcs x11,x11,x21
	sbcs x12,x12,x22
	sbc  x0,xzr,xzr
	
		
	
	ldr x13, p610x2
	ldr x14, p610x2 + 8
	ldr x15, p610x2 + 16
	ldr x16, p610x2 + 24
	ldr x17, p610x2 + 32
	ldr x18, p610x2 + 40
	ldr x19, p610x2 + 48
	ldr x20, p610x2 + 56
	ldr x21, p610x2 + 64
	ldr x22, p610x2 + 72
	
	
	and x13,x13,x0
	and x14,x14,x0
	and x15,x15,x0
	and x16,x16,x0
	and x17,x17,x0
	and x18,x18,x0
	and x19,x19,x0
	and x20,x20,x0
	and x21,x21,x0
	and x22,x22,x0
	
	adds x3,x3,x13
	adcs x4,x4,x14
	adcs x5,x5,x15
	adcs x6,x6,x16
	adcs x7,x7,x17
	adcs x8,x8,x18
	adcs x9,x9,x19
	adcs x10,x10,x20
	adcs x11,x11,x21
	adc  x12,x12,x22

	stp x3,x4, [x2,#0]
	stp x5,x6, [x2,#16]
	stp x7,x8, [x2,#32]
	stp x9,x10, [x2,#48]
	stp x11,x12, [x2,#64]
	
	//stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    
    add sp, sp, #96
ret













.macro mul320_macro x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x30
    //start
	//0
	mul \x23, \x3, \x8
	mul \x14, \x3, \x9
	mul \x15, \x3, \x10
	mul \x16, \x3, \x11
	mul \x17, \x3, \x12
	
	umulh \x18, \x3, \x8
	umulh \x19, \x3, \x9
	umulh \x20, \x3, \x10
	umulh \x21, \x3, \x11
	umulh \x22, \x3, \x12
	
	adds \x13, \x14, \x18
	adcs \x14, \x15, \x19
	adcs \x15, \x16, \x20
	adcs \x16, \x17, \x21
	adcs \x17, xzr, \x22
	
	//1
	mul \x18, \x4, \x8
	mul \x19, \x4, \x9
	adds \x24, \x13, \x18
	mul \x20, \x4, \x10
	adcs \x14, \x14, \x19
	mul \x21, \x4, \x11
	adcs \x15, \x15, \x20
	mul \x22, \x4, \x12
	adcs \x16, \x16, \x21
	
	
	
	
	
	
	
	umulh \x18, \x4, \x8
	adcs \x17, \x17, \x22
	umulh \x19, \x4, \x9
	adcs \x30,  xzr, xzr
	umulh \x20, \x4, \x10
	adds \x13, \x14, \x18
	umulh \x21, \x4, \x11
	adcs \x14, \x15, \x19
	umulh \x22, \x4, \x12
	adcs \x15, \x16, \x20
	
	
	
	
	
	//2
	mul \x18, \x5, \x8
	adcs \x16, \x17, \x21
	
	
	mul \x19, \x5, \x9
	adcs \x17, \x30, \x22
	
	mul \x20, \x5, \x10
	adds \x25, \x13, \x18
	
	mul \x21, \x5, \x11
	adcs \x14, \x14, \x19
	adcs \x15, \x15, \x20
	
	mul \x22, \x5, \x12
	
	adcs \x16, \x16, \x21
	adcs \x17, \x17, \x22
	adcs \x30,  xzr, xzr
	
	
	umulh \x18, \x5, \x8
	umulh \x19, \x5, \x9
	adds \x13, \x14, \x18
	
	umulh \x20, \x5, \x10
	adcs \x14, \x15, \x19
	
	umulh \x21, \x5, \x11
	adcs \x15, \x16, \x20
	
	
	umulh \x22, \x5, \x12
	
	adcs \x16, \x17, \x21
	adcs \x17, \x30, \x22
	
	//3
	mul \x18, \x6, \x8
	mul \x19, \x6, \x9
	adds \x26, \x13, \x18
	
	mul \x20, \x6, \x10
	adcs \x14, \x14, \x19
	
	mul \x21, \x6, \x11
	adcs \x15, \x15, \x20
	
	mul \x22, \x6, \x12
	
	adcs \x16, \x16, \x21
	adcs \x17, \x17, \x22
	adcs \x30,  xzr, xzr
	
	
	
	
	
	umulh \x18, \x6, \x8
	umulh \x19, \x6, \x9
	adds \x13, \x14, \x18
	
	umulh \x20, \x6, \x10
	adcs \x14, \x15, \x19
	umulh \x21, \x6, \x11
	adcs \x15, \x16, \x20
	umulh \x22, \x6, \x12
	
	
	
	
	adcs \x16, \x17, \x21
	adcs \x17, \x30, \x22
	
	//4
	mul \x18, \x7, \x8
	mul \x19, \x7, \x9
	adds \x27, \x13, \x18
	mul \x20, \x7, \x10
	adcs \x14, \x14, \x19
	mul \x21, \x7, \x11
	adcs \x15, \x15, \x20
	mul \x22, \x7, \x12
	
	
	
	
	adcs \x16, \x16, \x21
	adcs \x17, \x17, \x22
	adcs \x30,  xzr, xzr
	
	
	umulh \x18, \x7, \x8
	umulh \x19, \x7, \x9
	adds \x13, \x14, \x18
	umulh \x20, \x7, \x10
	adcs \x14, \x15, \x19
	umulh \x21, \x7, \x11
	adcs \x15, \x16, \x20
	umulh \x22, \x7, \x12
	
	
	
	
	adcs \x16, \x17, \x21
	adcs \x17, \x30, \x22
	
	
.endm




old_rdc610_func:
_old_rdc610_func:

    sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    stp x25, x26, [sp,#48]
    stp x27, x28, [sp,#64]
    stp x29, x30, [sp,#80]
	
	ldr     x2, p610p1 + 0
	ldr     x3, p610p1 + 8
	ldr     x4, p610p1 + 16
	ldr     x5, p610p1 + 24
	ldr     x6, p610p1 + 32
	ldr     x7, p610p1 + 40
	
	//result load
	ldr		x21, [x0, #8*4]
	ldr		x22, [x0, #8*5]
	ldr		x23, [x0, #8*6]
	ldr		x24, [x0, #8*7]
	ldr		x25, [x0, #8*8]
	ldr		x26, [x0, #8*9]
	
	//0
	ldr		x8, [x0,  #8*0]
	
	mul x9, x8, x2
	mul x10, x8, x3
	adds x15, x21, x9
	mul x11, x8, x4
	adcs x16, x22, x10
	mul x12, x8, x5
	adcs x17, x23, x11
	mul x13, x8, x6
	adcs x18, x24, x12
	mul x14, x8, x7

	
	
	
	
	adcs x19, x25, x13
	adcs x20, x26, x14
	adcs x21, xzr, xzr

	umulh x9, x8, x2
	umulh x10, x8, x3
	adds x16, x16, x9
	umulh x11, x8, x4
	adcs x17, x17, x10
	umulh x12, x8, x5
	adcs x18, x18, x11
	umulh x13, x8, x6
	adcs x19, x19, x12
	umulh x14, x8, x7
	
	
	
	 
	
	adcs x20, x20, x13
	//last
	adcs x21, x21, x14
	
	//1
	ldr		x8, [x0,  #8*1]
	
	mul x9, x8, x2
	mul x10, x8, x3
	adds x16, x16, x9
	mul x11, x8, x4
	adcs x17, x17, x10
	mul x12, x8, x5
	adcs x18, x18, x11
	mul x13, x8, x6
	adcs x19, x19, x12
	mul x14, x8, x7

	
	
	
	
	adcs x20, x20, x13
	adcs x21, x21, x14
	adcs x22, xzr, xzr

	umulh x9, x8, x2
	umulh x10, x8, x3
	adds x17, x17, x9
	umulh x11, x8, x4
	adcs x18, x18, x10
	umulh x12, x8, x5
	adcs x19, x19, x11
	umulh x13, x8, x6
	adcs x20, x20, x12
	umulh x14, x8, x7
	
	
	
	 
	
	adcs x21, x21, x13
	//last
	adcs x22, x22, x14
	
	//2
	ldr		x8, [x0,  #8*2]
	
	mul x9, x8, x2
	mul x10, x8, x3
	adds x17, x17, x9
	mul x11, x8, x4
	adcs x18, x18, x10
	mul x12, x8, x5
	adcs x19, x19, x11
	mul x13, x8, x6
	adcs x20, x20, x12
	mul x14, x8, x7

	
	
	
	
	adcs x21, x21, x13
	adcs x22, x22, x14
	adcs x23, xzr, xzr

	umulh x9, x8, x2
	umulh x10, x8, x3
	adds x18, x18, x9
	umulh x11, x8, x4
	adcs x19, x19, x10
	umulh x12, x8, x5
	adcs x20, x20, x11
	umulh x13, x8, x6
	adcs x21, x21, x12
	umulh x14, x8, x7
	
	
	
	 
	
	adcs x22, x22, x13
	//last
	adcs x23, x23, x14
	
	//3
	ldr		x8, [x0,  #8*3]
	
	mul x9, x8, x2
	mul x10, x8, x3
	adds x18, x18, x9
	mul x11, x8, x4
	adcs x19, x19, x10
	mul x12, x8, x5
	adcs x20, x20, x11
	mul x13, x8, x6
	adcs x21, x21, x12
	mul x14, x8, x7

	
	
	
	
	adcs x22, x22, x13
	adcs x23, x23, x14
	adcs x24, xzr, xzr

	umulh x9, x8, x2
	umulh x10, x8, x3
	adds x19, x19, x9
	umulh x11, x8, x4
	adcs x20, x20, x10
	umulh x12, x8, x5
	adcs x21, x21, x11
	umulh x13, x8, x6
	adcs x22, x22, x12
	umulh x14, x8, x7
	
	
	
	 
	
	adcs x23, x23, x13
	//last
	adcs x24, x24, x14
	
	//4
	mul x9, x15, x2
	mul x10, x15, x3
	adds x19, x19, x9
	mul x11, x15, x4
	adcs x20, x20, x10
	mul x12, x15, x5
	adcs x21, x21, x11
	mul x13, x15, x6
	adcs x22, x22, x12
	mul x14, x15, x7

	
	
	
	
	adcs x23, x23, x13
	adcs x24, x24, x14
	adcs x25, xzr, xzr

	umulh x9, x15, x2
	umulh x10, x15, x3
	adds x20, x20, x9
	umulh x11, x15, x4
	adcs x21, x21, x10
	umulh x12, x15, x5
	adcs x22, x22, x11
	umulh x13, x15, x6
	adcs x23, x23, x12
	umulh x14, x15, x7
	
	
	
	 
	
	adcs x24, x24, x13
	//last
	adcs x25, x25, x14
	
	//5
	mul x9, x16, x2
	mul x10, x16, x3
	adds x20, x20, x9
	mul x11, x16, x4
	adcs x21, x21, x10
	mul x12, x16, x5
	adcs x22, x22, x11
	mul x13, x16, x6
	adcs x23, x23, x12
	mul x14, x16, x7

	
	
	
	
	adcs x24, x24, x13
	adcs x25, x25, x14
	adcs x26, xzr, xzr

	umulh x9, x16, x2
	umulh x10, x16, x3
	adds x21, x21, x9
	umulh x11, x16, x4
	adcs x22, x22, x10
	umulh x12, x16, x5
	adcs x23, x23, x11
	umulh x13, x16, x6
	adcs x24, x24, x12
	umulh x14, x16, x7
	
	
	
	 
	
	adcs x25, x25, x13
	//last
	adcs x26, x26, x14
	
	//6
	mul x9, x17, x2
	mul x10, x17, x3
	adds x21, x21, x9
	mul x11, x17, x4
	adcs x22, x22, x10
	mul x12, x17, x5
	adcs x23, x23, x11
	mul x13, x17, x6
	adcs x24, x24, x12
	mul x14, x17, x7

	
	
	
	
	adcs x25, x25, x13
	adcs x26, x26, x14
	adcs x27, xzr, xzr

	umulh x9, x17, x2
	umulh x10, x17, x3
	adds x22, x22, x9
	umulh x11, x17, x4
	adcs x23, x23, x10
	umulh x12, x17, x5
	adcs x24, x24, x11
	umulh x13, x17, x6
	adcs x25, x25, x12
	umulh x14, x17, x7
	
	
	
	 
	
	adcs x26, x26, x13
	//last
	adcs x27, x27, x14
	
	//7
	mul x9, x18, x2
	mul x10, x18, x3
	adds x22, x22, x9
	mul x11, x18, x4
	adcs x23, x23, x10
	mul x12, x18, x5
	adcs x24, x24, x11
	mul x13, x18, x6
	adcs x25, x25, x12
	mul x14, x18, x7

	
	
	
	
	adcs x26, x26, x13
	adcs x27, x27, x14
	adcs x28, xzr, xzr

	umulh x9, x18, x2
	umulh x10, x18, x3
	adds x23, x23, x9
	umulh x11, x18, x4
	adcs x24, x24, x10
	umulh x12, x18, x5
	adcs x25, x25, x11
	umulh x13, x18, x6
	adcs x26, x26, x12
	umulh x14, x18, x7
	
	
	
	 
	
	adcs x27, x27, x13
	//last
	adcs x28, x28, x14
	
	//8
	mul x9, x19, x2
	mul x10, x19, x3
	adds x23, x23, x9
	mul x11, x19, x4
	adcs x24, x24, x10
	mul x12, x19, x5
	adcs x25, x25, x11
	mul x13, x19, x6
	adcs x26, x26, x12
	mul x14, x19, x7

	
	
	
	
	adcs x27, x27, x13
	adcs x28, x28, x14
	adcs x29, xzr, xzr

	umulh x9, x19, x2
	umulh x10, x19, x3
	adds x24, x24, x9
	umulh x11, x19, x4
	adcs x25, x25, x10
	umulh x12, x19, x5
	adcs x26, x26, x11
	umulh x13, x19, x6
	adcs x27, x27, x12
	umulh x14, x19, x7
	
	
	
	 
	
	adcs x28, x28, x13
	//last
	adcs x29, x29, x14	
	
	//9
	mul x9, x20, x2
	mul x10, x20, x3
	adds x24, x24, x9
	mul x11, x20, x4
	adcs x25, x25, x10
	mul x12, x20, x5
	adcs x26, x26, x11
	mul x13, x20, x6
	adcs x27, x27, x12
	mul x14, x20, x7

	
	
	
	
	adcs x28, x28, x13
	adcs x29, x29, x14
	adcs x30, xzr, xzr

	umulh x9, x20, x2
	umulh x10, x20, x3
	adds x25, x25, x9
	umulh x11, x20, x4
	adcs x26, x26, x10
	umulh x12, x20, x5
	adcs x27, x27, x11
	umulh x13, x20, x6
	adcs x28, x28, x12
	umulh x14, x20, x7
	
	
	
	 
	
	adcs x29, x29, x13
	//last
	adcs x30, x30, x14		
	
	//567890
	
	
	//loading
	ldr		x2, [x0, #8*10]
	ldr		x3, [x0, #8*11]
	ldr		x4, [x0, #8*12]
	ldr		x5, [x0, #8*13]
	ldr		x6, [x0, #8*14]
	ldr		x7, [x0, #8*15]
	ldr		x8, [x0, #8*16]
	ldr		x9, [x0, #8*17]
	ldr		x10, [x0, #8*18]
	ldr		x11, [x0, #8*19]
	
	
	///
	adds x21, x21, x2
	adcs x22, x22, x3
	adcs x23, x23, x4
	adcs x24, x24, x5
	adcs x25, x25, x6
	adcs x26, x26, x7
	adcs x27, x27, x8
	
	adcs x28, x28, x9
	adcs x29, x29, x10
	adcs x30, x30, x11
	
	stp x21, x22, [x1,#8*0]
	stp x23, x24, [x1,#8*2]
	stp x25, x26, [x1,#8*4]
	stp x27, x28, [x1,#8*6]
	stp x29, x30, [x1,#8*8]
	
	
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96

ret

mul640_func:
_mul640_func:
    //result : x0
    //operand: x1, x2
    //x19-x28 callee-saved
    sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    stp x25, x26, [sp,#48]
    stp x27, x28, [sp,#64]
    stp x29, x30, [sp,#80]
	
	
	//	L * L
	ldp x3, x4, [x0]
	ldp x5, x6, [x0,#16]
	ldr x7,		[X0,#32]

	ldp x8,  x9, 	[x1]
	ldp x10, x11, 	[x1,#16]
	ldr x12,		[X1,#32]
	
	mul320_macro x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x30
	
	stp x23, x24, [x2,#0]
	stp x25, x26, [x2,#16]
	stp x27, x13, [x2,#32]
	stp x14, x15, [x2,#48]
	stp x16, x17, [x2,#64]
	
	//	H * H
	ldr x3, [x0,#40]
	ldp x4, x5, [x0,#48]
	ldp x6, x7, [X0,#64]

	ldr x8,  		[x1,#40]
	ldp x9, x10, 	[x1,#48]
	ldp x11,x12,	[X1,#64]
	
	mul320_macro x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x30
	
	stp x23, x24, [x2,#80]
	stp x25, x26, [x2,#96]
	stp x27, x13, [x2,#112]
	stp x14, x15, [x2,#128]
	stp x16, x17, [x2,#144]
	
	// M * M
	ldp x13, x14, [x0]
	ldp x15, x16, [x0,#16]
	ldr x17,		[X0,#32]

	ldp x18,  x19, 	[x1]
	ldp x20, x21, 	[x1,#16]
	ldr x22,		[X1,#32]
	
	subs x3, x3, x13
	sbcs x4, x4, x14
	sbcs x5, x5, x15
	sbcs x6, x6, x16
	sbcs x7, x7, x17
	sbcs x13, x13, x13
	
	eor x3, x3, x13
	eor x4, x4, x13
	eor x5, x5, x13
	eor x6, x6, x13
	eor x7, x7, x13
	
	and x13, x13, #1
	adds x3, x3, x13
	adcs x4, x4, xzr
	adcs x5, x5, xzr
	adcs x6, x6, xzr
	adcs x7, x7, xzr
	
	subs x8, x8, x18
	sbcs x9, x9, x19
	sbcs x10, x10, x20
	sbcs x11, x11, x21
	sbcs x12, x12, x22
	sbcs x14, x14, x14
	
	eor x8, x8, x14
	eor x9, x9, x14
	eor x10, x10, x14
	eor x11, x11, x14
	eor x12, x12, x14
	
	and x14, x14, #1
	adds x8, x8, x14
	adcs x9, x9, xzr
	adcs x10, x10, xzr
	adcs x11, x11, xzr
	adcs x12, x12, xzr
	
	eor x28, x13, x14
	sub x28, x28, #1
	
	mul320_macro x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x30
	
	eor x23, x23, x28
	eor x24, x24, x28
	eor x25, x25, x28
	eor x26, x26, x28
	eor x27, x27, x28
	
	eor x13, x13, x28
	eor x14, x14, x28
	eor x15, x15, x28
	eor x16, x16, x28
	eor x17, x17, x28
	
	adds x29, x28, x28
	adcs x3, x23, xzr
	adcs x4, x24, xzr
	adcs x5, x25, xzr
	adcs x6, x26, xzr
	adcs x7, x27, xzr
	
	adcs x8, x13, xzr
	adcs x9, x14, xzr
	adcs x10, x15, xzr
	adcs x11, x16, xzr
	adcs x12, x17, xzr
	
	adcs x28, x28, xzr
	
	//
	ldp x13, x14, [x2,#0]
	ldp x15, x16, [x2,#16]
	ldp x17, x18, [x2,#32]
	ldp x19, x20, [x2,#48]
	ldp x21, x22, [x2,#64]
	
	adds x3, x3, x13
	adcs x4, x4, x14
	adcs x5, x5, x15
	adcs x6, x6, x16
	adcs x7, x7, x17
	
	adcs x8, x8, x18
	adcs x9, x9, x19
	adcs x10, x10, x20
	adcs x11, x11, x21
	adcs x12, x12, x22
	adcs x28, x28, xzr
	
	ldp x13, x14, [x2,#80]
	ldp x15, x16, [x2,#96]
	ldp x23, x24, [x2,#112]
	ldp x25, x26, [x2,#128]
	ldp x29, x30, [x2,#144]
	
	adds x3, x3, x13
	adcs x4, x4, x14
	adcs x5, x5, x15
	adcs x6, x6, x16
	adcs x7, x7, x23
	
	adcs x8, x8, x24
	adcs x9, x9, x25
	adcs x10, x10, x26
	adcs x11, x11, x29
	adcs x12, x12, x30
	adcs x28, x28, xzr
	
	adds x3, x3, x18
	adcs x4, x4, x19
	adcs x5, x5, x20
	adcs x6, x6, x21
	adcs x7, x7, x22
	
	adcs x8, x8, x13
	adcs x9, x9, x14
	adcs x10, x10, x15
	adcs x11, x11, x16
	adcs x12, x12, x23
	adcs x28, x28, xzr

	asr x27, x28, #5
	
	adds x24, x24, x28
	adcs x25, x25, x27
	adcs x26, x26, x27
	adcs x29, x29, x27
	adcs x30, x30, x27
	
	str x3, [x2, #40]
	stp x4, x5, [x2,#48]
	stp x6, x7, [x2,#64]
	stp x8, x9, [x2,#80]
	stp x10, x11, [x2,#96]
	stp x12, x24, [x2,#112]
	stp x25, x26, [x2,#128]
	stp x29, x30, [x2,#144]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96

ret


