
.data
//p434 + 1
p434p1:
.quad 0xFDC1767AE3000000
.quad 0x7BC65C783158AEA3
.quad 0x6CFC5FD681C52056
.quad 0x0002341F27177344

//2 * p434
p434x2:
.quad 0xFFFFFFFFFFFFFFFE
.quad 0xFFFFFFFFFFFFFFFF
.quad 0xFFFFFFFFFFFFFFFF
.quad 0xFB82ECF5C5FFFFFF
.quad 0xF78CB8F062B15D47
.quad 0xD9F8BFAD038A40AC
.quad 0x0004683E4E2EE688

.text

.globl add434_func
.globl _add434_func

.globl sub434_func
.globl _sub434_func

.globl mul448_func
.globl _mul448_func

.globl rdc434_func
.globl _rdc434_func


.globl modmul434_func
.globl _modmul434_func


modmul434_func:
_modmul434_func:
	sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    stp x25, x26, [sp,#48]
    stp x27, x28, [sp,#64]
    stp x29, x30, [sp,#80]
	//////////////////////

    //start
	ldp x6, x7, 	[x0]
	ldp x8, x9, 	[x0,#16]
	ldp x10, x11, 	[x0,#32]
	ldr x12,		[x0,#48]

	ldr x13,		[x1]
	//
	mov 	x0, x2
	
	ldr     x2, p434p1 + 0
	ldr     x3, p434p1 + 8
	ldr     x4, p434p1 + 16
	ldr     x5, p434p1 + 24
	
	//M: 2~5
	//A: 6~12
	//B: 13
	//C: 14~
	
	//0
	mul x14, x13, x6
    umulh x24, x13, x6

	mul x15, x13, x7
	umulh x25, x13, x7
    adds x15, x15, x24

	mul x16, x13, x8
	umulh x26, x13, x8
	adcs x16, x16, x25

	mul x17, x13, x9
	umulh x27, x13, x9
	adcs x17, x17, x26

	mul x18, x13, x10
	umulh x28, x13, x10
	adcs x18, x18, x27

	mul x19, x13, x11
	umulh x29, x13, x11
	adcs x19, x19, x28

	mul x20, x13, x12
	
	//Q: 14
	umulh x30, x13, x12
	adcs x20, x20, x29
	adcs x21, x30, xzr
	
	mul x23, x14, x2
	umulh x27, x14, x2

	mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27

	mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	
	adcs x26, x26, x29
	adcs x27, x30, xzr
	
	ldr x13,		[x1,#8]

	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25

	// 15 ~ 22
	
	//1
	mul x24, x13, x6

	adcs x20, x20, x26
	adcs x21, x21, x27

	mul x25, x13, x7

	adcs x22, xzr, xzr	//carry
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	
	umulh x24, x13, x6
    adcs x20, x21, x30
	adcs x21, x22, xzr

	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2

	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr

	ldr x13,		[x1,#16]
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
	
	//2
	mul x24, x13, x6
	adcs x20, x20, x26
	adcs x21, x21, x27

	mul x25, x13, x7
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	umulh x24, x13, x6

	adcs x20, x21, x30
	adcs x21, x22, xzr

	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2
	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr

ldr x13,		[x1,#24]
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
    //3

	
	mul x24, x13, x6
	adcs x20, x20, x26
	adcs x21, x21, x27
	mul x25, x13, x7
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	umulh x24, x13, x6
	adcs x20, x21, x30
	adcs x21, x22, xzr
	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2
	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr

ldr x13,		[x1,#32]
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
    //4

	
	mul x24, x13, x6
	adcs x20, x20, x26
	adcs x21, x21, x27
	mul x25, x13, x7
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	umulh x24, x13, x6
	adcs x20, x21, x30
	adcs x21, x22, xzr
	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2
	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr

ldr x13,		[x1,#40]
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
    //5

	
	mul x24, x13, x6
	adcs x20, x20, x26
	adcs x21, x21, x27
	mul x25, x13, x7
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	umulh x24, x13, x6
	adcs x20, x21, x30
	adcs x21, x22, xzr
	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2
	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr

ldr x13,		[x1,#48]
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
    //6

	
	mul x24, x13, x6
	adcs x20, x20, x26
	adcs x21, x21, x27
	mul x25, x13, x7
    adds x14, x15, x24

    mul x26, x13, x8
	adcs x15, x16, x25

	mul x27, x13, x9
	adcs x16, x17, x26

	mul x28, x13, x10
	adcs x17, x18, x27

	mul x29, x13, x11
	adcs x18, x19, x28

	mul x30, x13, x12
	adcs x19, x20, x29
	
	umulh x24, x13, x6
	adcs x20, x21, x30
	adcs x21, x22, xzr
	umulh x25, x13, x7
	adds x15, x15, x24
	umulh x26, x13, x8
	adcs x16, x16, x25
	umulh x27, x13, x9
	adcs x17, x17, x26
	umulh x28, x13, x10
	adcs x18, x18, x27
	umulh x29, x13, x11
	adcs x19, x19, x28
	umulh x30, x13, x12
	
	adcs x20, x20, x29
	//adcs x22, x30, xzr
	
	//red
	mul x23, x14, x2
	adcs x21, x21, x30
    umulh x27, x14, x2
		
    mul x24, x14, x3
	umulh x28, x14, x3
	adds x24, x24, x27
	
    mul x25, x14, x4
	umulh x29, x14, x4
	adcs x25, x25, x28

	mul x26, x14, x5
	umulh x30, x14, x5
	adcs x26, x26, x29
	adcs x27, x30, xzr
	
	adds x17, x17, x23
	adcs x18, x18, x24
	adcs x19, x19, x25
	adcs x20, x20, x26
	adcs x21, x21, x27
	
	stp x15, x16, [x0,#8*0]
	stp x17, x18, [x0,#8*2]
	stp x19, x20, [x0,#8*4]
	str x21, [x0,#8*6]
	/**/
	
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

add434_func:
_add434_func:
	ldp x3,x4, [x0,#0]
	ldp x5,x6, [x0,#16]
	ldp x7,x8, [x0,#32]
	ldr x9,	   [x0,#48]
	//eor v3.16b,v3.16b,v9.16b
	//umull v0.2d, v0.2s, v1.2s	
	ldp x11,x12, [x1,#0]
	ldp x13,x14, [x1,#16]
	ldp x15,x16, [x1,#32]
	ldr x17,	 [x1,#48]
	
	adds x3,x3,x11
	//eor v3.16b, v3.16b, v9.16b
	adcs x4,x4,x12
	adcs x5,x5,x13
	//umull v0.2d, v0.2s, v1.2s
	adcs x6,x6,x14
	adcs x7,x7,x15
	adcs x8,x8,x16
	adc  x9,x9,x17

	ldr x11, p434x2
	ldr x12, p434x2 + 8
	//ldr x13, p434x2 + 16
	ldr x14, p434x2 + 24
	ldr x15, p434x2 + 32
	ldr x16, p434x2 + 40
	ldr x17, p434x2 + 48
	
	subs x3,x3,x11
	sbcs x4,x4,x12
	sbcs x5,x5,x12
	sbcs x6,x6,x14
	sbcs x7,x7,x15
	sbcs x8,x8,x16
	sbcs x9,x9,x17
	sbc  x18,xzr,xzr
	
	and x11,x11,x18
	and x12,x12,x18
	//and x13,x13,x18
	and x14,x14,x18
	and x15,x15,x18
	and x16,x16,x18
	and x17,x17,x18
	
	adds x3,x3,x11
	adcs x4,x4,x12
	adcs x5,x5,x12
	adcs x6,x6,x14
	adcs x7,x7,x15
	adcs x8,x8,x16
	adc  x9,x9,x17

	stp x3,x4, [x2,#0]
	stp x5,x6, [x2,#16]
	stp x7,x8, [x2,#32]
	str x9,    [x2,#48]
ret


sub434_func:
_sub434_func:
	ldp x3,x4, [x0,#0]
	ldp x5,x6, [x0,#16]
	ldp x7,x8, [x0,#32]
	ldr x9,	   [x0,#48]
	
	ldp x11,x12, [x1,#0]
	ldp x13,x14, [x1,#16]
	ldp x15,x16, [x1,#32]
	ldr x17,	 [x1,#48]
	
	subs x3,x3,x11
	sbcs x4,x4,x12
	sbcs x5,x5,x13
	sbcs x6,x6,x14
	sbcs x7,x7,x15
	sbcs x8,x8,x16
	sbcs x9,x9,x17
	sbc  x18,xzr,xzr
	
	ldr x11, p434x2
	ldr x12, p434x2 + 8
	//ldr x13, p434x2 + 16
	ldr x14, p434x2 + 24
	ldr x15, p434x2 + 32
	ldr x16, p434x2 + 40
	ldr x17, p434x2 + 48
	
	and x11,x11,x18
	and x12,x12,x18
	//and x13,x13,x18
	and x14,x14,x18
	and x15,x15,x18
	and x16,x16,x18
	and x17,x17,x18
	
	adds x3,x3,x11
	adcs x4,x4,x12
	adcs x5,x5,x12
	adcs x6,x6,x14
	adcs x7,x7,x15
	adcs x8,x8,x16
	adc  x9,x9,x17

	stp x3,x4, [x2,#0]
	stp x5,x6, [x2,#16]
	stp x7,x8, [x2,#32]
	str x9,    [x2,#48]
ret


rdc434_func:
_rdc434_func:
	//x0 input
	//x1 output
	//x2,x3,x4,x5 M
	//x6		  Q
	//x7,x8,x9,x10 C
	//x11,x12,x13,x14 TMP
	//x15,x16,x17,x18,


    sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    str x25, [sp,#48]
	
	ldr     x2, p434p1 + 0
	ldr     x3, p434p1 + 8
	ldr     x4, p434p1 + 16
	ldr     x5, p434p1 + 24
	
	
	
	//result load
	ldr		x15, [x0, #8*3]
	ldr		x16, [x0, #8*4]
	ldr		x17, [x0, #8*5]
	ldr		x18, [x0, #8*6]
	
	//0
	ldr		x6, [x0,  #8*0]
	
	mul x7, x6, x2
	mul x8, x6, x3
	mul x9, x6, x4
	mul x10, x6, x5
	
	umulh x11, x6, x2
    adds x15, x15, x7
	adcs x16, x16, x8

		
    umulh x12, x6, x3
	adcs x17, x17, x9
	adcs x18, x18, x10


	umulh x13, x6, x4
	adcs x19, xzr, xzr
	adds x16, x16, x11


	umulh x14, x6, x5
	
	adcs x17, x17, x12
	
	//1
	ldr		x6, [x0,  #8*1]
	mul x7, x6, x2
	adcs x18, x18, x13


	mul x8, x6, x3
	//last
	adcs x19, x19, x14


	mul x9, x6, x4
	adds x16, x16, x7


	mul x10, x6, x5
	adcs x17, x17, x8

	
	umulh x11, x6, x2
	adcs x18, x18, x9

	umulh x12, x6, x3
	adcs x19, x19, x10


	umulh x13, x6, x4
	adcs x20, xzr, xzr


	umulh x14, x6, x5
	
	
	adds x17, x17, x11
	
	//2
	ldr		x6, [x0,  #8*2]
	mul x7, x6, x2
	adcs x18, x18, x12

	mul x8, x6, x3
	adcs x19, x19, x13


	mul x9, x6, x4
	//last
	adcs x20, x20, x14


	mul x10, x6, x5
	adds x17, x17, x7
	
	umulh x11, x6, x2
	adcs x18, x18, x8


	umulh x12, x6, x3
	adcs x19, x19, x9


	umulh x13, x6, x4
	adcs x20, x20, x10
	adcs x21, xzr, xzr


	umulh x14, x6, x5
	
	
	adds x18, x18, x11
	adcs x19, x19, x12
	
	//3
	
	mul x7, x15, x2
	adcs x20, x20, x13


	mul x8, x15, x3
	//last
	adcs x21, x21, x14


	mul x9, x15, x4
	adds x18, x18, x7


	mul x10, x15, x5
	adcs x19, x19, x8

	
	umulh x11, x15, x2
	adcs x20, x20, x9


	umulh x12, x15, x3
	adcs x21, x21, x10


	umulh x13, x15, x4
	adcs x22, xzr, xzr


	umulh x14, x15, x5
	
	
	adds x19, x19, x11
	
	//4
	mul x7, x16, x2
	adcs x20, x20, x12


	mul x8, x16, x3
	adcs x21, x21, x13


	mul x9, x16, x4
	//last
	adcs x22, x22, x14


	mul x10, x16, x5
	adds x19, x19, x7
	
	umulh x11, x16, x2
	adcs x20, x20, x8


	umulh x12, x16, x3
	adcs x21, x21, x9


	umulh x13, x16, x4
	adcs x22, x22, x10


	umulh x14, x16, x5
	adcs x23, xzr, xzr
	
	
	//5
	mul x7, x17, x2
	adds x20, x20, x11


	mul x8, x17, x3
	adcs x21, x21, x12


	mul x9, x17, x4
	adcs x22, x22, x13


	mul x10, x17, x5
	//last
	adcs x23, x23, x14


	
	umulh x11, x17, x2
	adds x20, x20, x7


	umulh x12, x17, x3
	adcs x21, x21, x8


	umulh x13, x17, x4
	adcs x22, x22, x9


	umulh x14, x17, x5
	
	adcs x23, x23, x10
	
	
	//6
	mul x7, x18, x2
	adcs x24, xzr, xzr
	


	mul x8, x18, x3
	adds x21, x21, x11


	mul x9, x18, x4
	adcs x22, x22, x12


	mul x10, x18, x5
	adcs x23, x23, x13


	
	umulh x11, x18, x2
	//last
	adcs x24, x24, x14


	umulh x12, x18, x3
	adds x21, x21, x7


	umulh x13, x18, x4
	adcs x22, x22, x8


	umulh x14, x18, x5
	
	adcs x23, x23, x9
	adcs x24, x24, x10
	adcs x25, xzr, xzr
	
	adds x22, x22, x11
	adcs x23, x23, x12
	adcs x24, x24, x13
	//last
	adcs x25, x25, x14
	
	//loading
	ldr		x2, [x0, #8*7]
	ldr		x3, [x0, #8*8]
	ldr		x4, [x0, #8*9]
	ldr		x5, [x0, #8*10]
	ldr		x6, [x0, #8*11]
	ldr		x7, [x0, #8*12]
	ldr		x8, [x0, #8*13]
	
	///
	adds x19, x19, x2
	adcs x20, x20, x3
	adcs x21, x21, x4
	adcs x22, x22, x5
	adcs x23, x23, x6
	adcs x24, x24, x7
	adcs x25, x25, x8
	
	stp x19, x20, [x1,#8*0]
	stp x21, x22, [x1,#8*2]
	stp x23, x24, [x1,#8*4]
	str x25, [x1,#8*6]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldr x25,  [sp,#48]

    add sp, sp, #96

/*
    sub sp, sp, #96

    stp x19, x20, [sp,#0]
    stp x21, x22, [sp,#16]
    stp x23, x24, [sp,#32]
    stp x25, x26, [sp,#48]
    stp x27, x28, [sp,#64]
    stp x29, x30, [sp,#80]
	
	ldr     x2, p434p1 + 0
	ldr     x3, p434p1 + 8
	ldr     x4, p434p1 + 16
	ldr     x5, p434p1 + 24
	
	
	
	//result load
	ldr		x15, [x0, #8*3]
	ldr		x16, [x0, #8*4]
	ldr		x17, [x0, #8*5]
	ldr		x18, [x0, #8*6]
	
	//0
	ldr		x6, [x0,  #8*0]
	
	mul x7, x6, x2
	mul x8, x6, x3
	mul x9, x6, x4
	mul x10, x6, x5
	
	umulh x11, x6, x2
	umulh x12, x6, x3
	umulh x13, x6, x4
	umulh x14, x6, x5
	
	adds x15, x15, x7
	adcs x16, x16, x8
	adcs x17, x17, x9
	adcs x18, x18, x10
	adcs x19, xzr, xzr
	
	adds x16, x16, x11
	adcs x17, x17, x12
	adcs x18, x18, x13
	//last
	adcs x19, x19, x14
	
	//1
	ldr		x6, [x0,  #8*1]
	mul x7, x6, x2
	mul x8, x6, x3
	mul x9, x6, x4
	mul x10, x6, x5
	
	umulh x11, x6, x2
	umulh x12, x6, x3
	umulh x13, x6, x4
	umulh x14, x6, x5
	
	adds x16, x16, x7
	adcs x17, x17, x8
	adcs x18, x18, x9
	adcs x19, x19, x10
	adcs x20, xzr, xzr
	
	adds x17, x17, x11
	adcs x18, x18, x12
	adcs x19, x19, x13
	//last
	adcs x20, x20, x14
	
	//2
	ldr		x6, [x0,  #8*2]
	mul x7, x6, x2
	mul x8, x6, x3
	mul x9, x6, x4
	mul x10, x6, x5
	
	umulh x11, x6, x2
	umulh x12, x6, x3
	umulh x13, x6, x4
	umulh x14, x6, x5
	
	adds x17, x17, x7
	adcs x18, x18, x8
	adcs x19, x19, x9
	adcs x20, x20, x10
	adcs x21, xzr, xzr
	
	adds x18, x18, x11
	adcs x19, x19, x12
	adcs x20, x20, x13
	//last
	adcs x21, x21, x14
	
	//3
	
	mul x7, x15, x2
	mul x8, x15, x3
	mul x9, x15, x4
	mul x10, x15, x5
	
	umulh x11, x15, x2
	umulh x12, x15, x3
	umulh x13, x15, x4
	umulh x14, x15, x5
	
	adds x18, x18, x7
	adcs x19, x19, x8
	adcs x20, x20, x9
	adcs x21, x21, x10
	adcs x22, xzr, xzr
	
	adds x19, x19, x11
	adcs x20, x20, x12
	adcs x21, x21, x13
	//last
	adcs x22, x22, x14
	
	//4
	mul x7, x16, x2
	mul x8, x16, x3
	mul x9, x16, x4
	mul x10, x16, x5
	
	umulh x11, x16, x2
	umulh x12, x16, x3
	umulh x13, x16, x4
	umulh x14, x16, x5
	
	adds x19, x19, x7
	adcs x20, x20, x8
	adcs x21, x21, x9
	adcs x22, x22, x10
	adcs x23, xzr, xzr
	
	adds x20, x20, x11
	adcs x21, x21, x12
	adcs x22, x22, x13
	//last
	adcs x23, x23, x14
	
	//5
	mul x7, x17, x2
	mul x8, x17, x3
	mul x9, x17, x4
	mul x10, x17, x5
	
	umulh x11, x17, x2
	umulh x12, x17, x3
	umulh x13, x17, x4
	umulh x14, x17, x5
	
	adds x20, x20, x7
	adcs x21, x21, x8
	adcs x22, x22, x9
	adcs x23, x23, x10
	adcs x24, xzr, xzr
	
	adds x21, x21, x11
	adcs x22, x22, x12
	adcs x23, x23, x13
	//last
	adcs x24, x24, x14
	
	
	//6
	mul x7, x18, x2
	mul x8, x18, x3
	mul x9, x18, x4
	mul x10, x18, x5
	
	umulh x11, x18, x2
	umulh x12, x18, x3
	umulh x13, x18, x4
	umulh x14, x18, x5
	
	adds x21, x21, x7
	adcs x22, x22, x8
	adcs x23, x23, x9
	adcs x24, x24, x10
	adcs x25, xzr, xzr
	
	adds x22, x22, x11
	adcs x23, x23, x12
	adcs x24, x24, x13
	//last
	adcs x25, x25, x14
	
	//loading
	ldr		x2, [x0, #8*7]
	ldr		x3, [x0, #8*8]
	ldr		x4, [x0, #8*9]
	ldr		x5, [x0, #8*10]
	ldr		x6, [x0, #8*11]
	ldr		x7, [x0, #8*12]
	ldr		x8, [x0, #8*13]
	
	///
	adds x19, x19, x2
	adcs x20, x20, x3
	adcs x21, x21, x4
	adcs x22, x22, x5
	adcs x23, x23, x6
	adcs x24, x24, x7
	adcs x25, x25, x8
	
	stp x19, x20, [x1,#8*0]
	stp x21, x22, [x1,#8*2]
	stp x23, x24, [x1,#8*4]
	str x25, [x1,#8*6]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96
    */
ret


mul448_func:
_mul448_func:
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
	//////////////////////

    //start
	ldp x3, x4, [x0]
	ldp x5, x6, [x0,#16]
	ldp x7, x8, [x0,#32]
	ldr x9,		[X0,#48]

	ldp x10, x11, [x1]
	ldp x12, x13, [x1,#16]
	ldp x14, x15, [x1,#32]
	ldr x16,		[X1,#48]

	//0
	mul x17, x3, x10
	mul x18, x3, x11
	mul x19, x3, x12
	mul x20, x3, x13
	mul x21, x3, x14
	mul x22, x3, x15
	mul x23, x3, x16
	
	str x17, [x2]
	
	umulh x24, x3, x10
	umulh x25, x3, x11
	adds x17, x18, x24

	umulh x26, x3, x12
	adcs x18, x19, x25

	umulh x27, x3, x13
	adcs x19, x20, x26

	umulh x28, x3, x14
	adcs x20, x21, x27

	umulh x29, x3, x15
	adcs x21, x22, x28

	umulh x30, x3, x16
	

	adcs x22, x23, x29
	
	//1
	mul x24, x4, x10
	adcs x23, xzr, x30


	mul x25, x4, x11
	adds x17, x17, x24

	mul x26, x4, x12
	adcs x18, x18, x25

	mul x27, x4, x13
	adcs x19, x19, x26

	mul x28, x4, x14
	adcs x20, x20, x27

	mul x29, x4, x15
	adcs x21, x21, x28

	mul x30, x4, x16
	adcs x22, x22, x29

	
	
	str x17, [x2,8]
	
	umulh x24, x4, x10
	adcs x23, x23, x30


	umulh x25, x4, x11
	adcs x0,  xzr, xzr


	umulh x26, x4, x12
	adds x17, x18, x24

	umulh x27, x4, x13
	adcs x18, x19, x25

	umulh x28, x4, x14
	adcs x19, x20, x26

	umulh x29, x4, x15
	adcs x20, x21, x27

	umulh x30, x4, x16
	adcs x21, x22, x28
	

	
	//2
	mul x24, x5, x10
	adcs x22, x23, x29

	mul x25, x5, x11
	adcs x23, x0, x30

	mul x26, x5, x12
	adds x17, x17, x24

	mul x27, x5, x13
	adcs x18, x18, x25

	mul x28, x5, x14
	adcs x19, x19, x26

	mul x29, x5, x15
	adcs x20, x20, x27

	mul x30, x5, x16
	
	adcs x21, x21, x28
	
	str x17, [x2,16]
	
	umulh x24, x5, x10
	adcs x22, x22, x29


	umulh x25, x5, x11
	adcs x23, x23, x30


	umulh x26, x5, x12
	adcs x0, xzr, xzr


	umulh x27, x5, x13
	adds x17, x18, x24

	umulh x28, x5, x14
	adcs x18, x19, x25


	umulh x29, x5, x15
	adcs x19, x20, x26


	umulh x30, x5, x16
	
	adcs x20, x21, x27
	
	//3
	mul x24, x6, x10
	adcs x21, x22, x28


	mul x25, x6, x11
	adcs x22, x23, x29



	mul x26, x6, x12
	adcs x23, x0, x30


	mul x27, x6, x13
	adds x17, x17, x24


	mul x28, x6, x14
	adcs x18, x18, x25


	mul x29, x6, x15
	adcs x19, x19, x26


	mul x30, x6, x16
	
	adcs x20, x20, x27
	
	str x17, [x2,24]
	
	umulh x24, x6, x10
	adcs x21, x21, x28


	umulh x25, x6, x11
	adcs x22, x22, x29


	umulh x26, x6, x12
	adcs x23, x23, x30
	adcs x0, xzr, xzr


	umulh x27, x6, x13
	adds x17, x18, x24


	umulh x28, x6, x14
	adcs x18, x19, x25


	umulh x29, x6, x15
	adcs x19, x20, x26


	umulh x30, x6, x16
	
	adcs x20, x21, x27
	
	//4
	mul x24, x7, x10
	adcs x21, x22, x28


	mul x25, x7, x11
	adcs x22, x23, x29


	mul x26, x7, x12
	adcs x23, x0, x30


	mul x27, x7, x13
	adds x17, x17, x24


	mul x28, x7, x14
	adcs x18, x18, x25


	mul x29, x7, x15
	adcs x19, x19, x26


	mul x30, x7, x16
	
	adcs x20, x20, x27
	
	str x17, [x2,32]
	
	umulh x24, x7, x10
	adcs x21, x21, x28


	umulh x25, x7, x11
	adcs x22, x22, x29


	umulh x26, x7, x12
	adcs x23, x23, x30


	umulh x27, x7, x13
	adcs x0, xzr, xzr


	umulh x28, x7, x14
	adds x17, x18, x24
	umulh x29, x7, x15
	adcs x18, x19, x25

	umulh x30, x7, x16
	adcs x19, x20, x26
	

	
	//5
	mul x24, x8, x10
	adcs x20, x21, x27


	mul x25, x8, x11
	adcs x21, x22, x28


	mul x26, x8, x12
	adcs x22, x23, x29


	mul x27, x8, x13
	adcs x23, x0, x30


	mul x28, x8, x14
	adds x17, x17, x24


	mul x29, x8, x15
	adcs x18, x18, x25


	mul x30, x8, x16
	
	adcs x19, x19, x26
	
	str x17, [x2,40]
	
	umulh x24, x8, x10
	adcs x20, x20, x27


	umulh x25, x8, x11
	adcs x21, x21, x28


	umulh x26, x8, x12
	adcs x22, x22, x29


	umulh x27, x8, x13
	adcs x23, x23, x30


	umulh x28, x8, x14
	adcs x0, xzr, xzr


	umulh x29, x8, x15
	adds x17, x18, x24


	umulh x30, x8, x16
	
	adcs x18, x19, x25
	
	//6
	mul x24, x9, x10
	adcs x19, x20, x26


	mul x25, x9, x11
	adcs x20, x21, x27


	mul x26, x9, x12
	adcs x21, x22, x28


	mul x27, x9, x13
	adcs x22, x23, x29


	mul x28, x9, x14
	adcs x23, x0, x30


	mul x29, x9, x15
	adds x17, x17, x24


	mul x30, x9, x16
	
	adcs x18, x18, x25
	adcs x19, x19, x26
	
	str x17, [x2,48]
	
	umulh x24, x9, x10

	adcs x20, x20, x27
	adcs x21, x21, x28

	umulh x25, x9, x11
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr


	umulh x26, x9, x12
	adds x17, x18, x24
	adcs x18, x19, x25


	umulh x27, x9, x13
	adcs x19, x20, x26
	adcs x20, x21, x27


	umulh x28, x9, x14
	adcs x21, x22, x28


	umulh x29, x9, x15
	adcs x22, x23, x29


	umulh x30, x9, x16
	adcs x23, x0, x30
	
	
	str x17, [x2,#56]
	stp x18, x19, [x2,#64]
	stp x20, x21, [x2,#80]
	stp x22, x23, [x2,#96]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96
/*
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
	//////////////////////

    //start
	ldp x3, x4, [x0]
	ldp x5, x6, [x0,#16]
	ldp x7, x8, [x0,#32]
	ldr x9,		[X0,#48]

	ldp x10, x11, [x1]
	ldp x12, x13, [x1,#16]
	ldp x14, x15, [x1,#32]
	ldr x16,		[X1,#48]

	//0
	mul x17, x3, x10
	mul x18, x3, x11
	mul x19, x3, x12
	mul x20, x3, x13
	mul x21, x3, x14
	mul x22, x3, x15
	mul x23, x3, x16
	
	str x17, [x2]
	
	umulh x24, x3, x10
	umulh x25, x3, x11
	umulh x26, x3, x12
	umulh x27, x3, x13
	umulh x28, x3, x14
	umulh x29, x3, x15
	umulh x30, x3, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, xzr, x30
	
	//1
	mul x24, x4, x10
	mul x25, x4, x11
	mul x26, x4, x12
	mul x27, x4, x13
	mul x28, x4, x14
	mul x29, x4, x15
	mul x30, x4, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0,  xzr, xzr
	
	str x17, [x2,8]
	
	umulh x24, x4, x10
	umulh x25, x4, x11
	umulh x26, x4, x12
	umulh x27, x4, x13
	umulh x28, x4, x14
	umulh x29, x4, x15
	umulh x30, x4, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	//2
	mul x24, x5, x10
	mul x25, x5, x11
	mul x26, x5, x12
	mul x27, x5, x13
	mul x28, x5, x14
	mul x29, x5, x15
	mul x30, x5, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr
	
	str x17, [x2,16]
	
	umulh x24, x5, x10
	umulh x25, x5, x11
	umulh x26, x5, x12
	umulh x27, x5, x13
	umulh x28, x5, x14
	umulh x29, x5, x15
	umulh x30, x5, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	//3
	mul x24, x6, x10
	mul x25, x6, x11
	mul x26, x6, x12
	mul x27, x6, x13
	mul x28, x6, x14
	mul x29, x6, x15
	mul x30, x6, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr
	
	str x17, [x2,24]
	
	umulh x24, x6, x10
	umulh x25, x6, x11
	umulh x26, x6, x12
	umulh x27, x6, x13
	umulh x28, x6, x14
	umulh x29, x6, x15
	umulh x30, x6, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	//4
	mul x24, x7, x10
	mul x25, x7, x11
	mul x26, x7, x12
	mul x27, x7, x13
	mul x28, x7, x14
	mul x29, x7, x15
	mul x30, x7, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr
	
	str x17, [x2,32]
	
	umulh x24, x7, x10
	umulh x25, x7, x11
	umulh x26, x7, x12
	umulh x27, x7, x13
	umulh x28, x7, x14
	umulh x29, x7, x15
	umulh x30, x7, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	//5
	mul x24, x8, x10
	mul x25, x8, x11
	mul x26, x8, x12
	mul x27, x8, x13
	mul x28, x8, x14
	mul x29, x8, x15
	mul x30, x8, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr
	
	str x17, [x2,40]
	
	umulh x24, x8, x10
	umulh x25, x8, x11
	umulh x26, x8, x12
	umulh x27, x8, x13
	umulh x28, x8, x14
	umulh x29, x8, x15
	umulh x30, x8, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	//6
	mul x24, x9, x10
	mul x25, x9, x11
	mul x26, x9, x12
	mul x27, x9, x13
	mul x28, x9, x14
	mul x29, x9, x15
	mul x30, x9, x16
	
	adds x17, x17, x24
	adcs x18, x18, x25
	adcs x19, x19, x26
	adcs x20, x20, x27
	adcs x21, x21, x28
	adcs x22, x22, x29
	adcs x23, x23, x30
	adcs x0, xzr, xzr
	
	str x17, [x2,48]
	
	umulh x24, x9, x10
	umulh x25, x9, x11
	umulh x26, x9, x12
	umulh x27, x9, x13
	umulh x28, x9, x14
	umulh x29, x9, x15
	umulh x30, x9, x16
	
	adds x17, x18, x24
	adcs x18, x19, x25
	adcs x19, x20, x26
	adcs x20, x21, x27
	adcs x21, x22, x28
	adcs x22, x23, x29
	adcs x23, x0, x30
	
	str x17, [x2,#56]
	stp x18, x19, [x2,#64]
	stp x20, x21, [x2,#80]
	stp x22, x23, [x2,#96]
	
	//////////////////////
    //stack
    ldp x19, x20, [sp,#0]
    ldp x21, x22, [sp,#16]
    ldp x23, x24, [sp,#32]
    ldp x25, x26, [sp,#48]
    ldp x27, x28, [sp,#64]
    ldp x29, x30, [sp,#80]

    add sp, sp, #96*/

ret


