	.file	"bubble_sort.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	fnv1a64, @function
fnv1a64:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	lui	a1,%hi(.LC1)
	lw	a0,%lo(.LC1)(a1)
	lw	a1,%lo(.LC1+4)(a1)
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	li	a0,435
	li	a1,256
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	lw	a0,-40(s0)
	lw	a1,-36(s0)
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	lw	a1,-52(s0)
	sw	a1,-28(s0)
	j	.L2
.L3:
	lw	a1,-28(s0)
	lbu	a1,0(a1)
	mv	a2,a1
	li	a3,0
	lw	a1,-24(s0)
	xor	a6,a1,a2
	lw	a1,-20(s0)
	xor	a7,a1,a3
	sw	a6,-24(s0)
	sw	a7,-20(s0)
	lw	a0,-20(s0)
	lw	a1,-48(s0)
	mul	a0,a0,a1
	lw	t1,-44(s0)
	lw	a1,-24(s0)
	mul	a1,t1,a1
	add	t1,a0,a1
	lw	a0,-24(s0)
	lw	a1,-48(s0)
	mul	t3,a0,a1
	mulhu	a5,a0,a1
	mv	a4,t3
	add	a1,t1,a5
	mv	a5,a1
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	lw	a1,-28(s0)
	addi	a1,a1,1
	sw	a1,-28(s0)
.L2:
	lw	a1,-28(s0)
	lbu	a1,0(a1)
	bne	a1,zero,.L3
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	mv	a0,a4
	mv	a1,a5
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	fnv1a64, .-fnv1a64
	.section	.rodata
	.align	2
.LC2:
	.string	"unknown_time"
	.align	2
.LC3:
	.string	"unknown_machine"
	.align	2
.LC4:
	.string	"unknown_host"
	.align	2
.LC5:
	.string	"unknown_user"
	.align	2
.LC6:
	.string	"%s|%s|%s|%s|%ld|%s|%s"
	.align	2
.LC7:
	.string	"13.2.0"
	.align	2
.LC8:
	.string	"%s|run_epoch=%ld"
	.align	2
.LC9:
	.string	"=== RISC-V Proof Header ==="
	.align	2
.LC10:
	.string	"User: %s\n"
	.align	2
.LC11:
	.string	"Host: %s\n"
	.align	2
.LC12:
	.string	"MachineID : %s\n"
	.align	2
.LC13:
	.string	"BuildUTC : %s\n"
	.align	2
.LC14:
	.string	"BuildEpoch : %ld\n"
	.align	2
.LC15:
	.string	"GCC: %s\n"
	.align	2
.LC16:
	.string	"PointerBits: %d\n"
	.align	2
.LC17:
	.string	"Program: %s\n"
	.align	2
.LC18:
	.string	"ProofID: 0x%016llx\n"
	.align	2
.LC19:
	.string	"RunID: 0x%016llx\n"
	.align	2
.LC20:
	.string	"==========================="
	.text
	.align	1
	.type	uniq_print_header, @function
uniq_print_header:
	addi	sp,sp,-1200
	sw	ra,1196(sp)
	sw	s0,1192(sp)
	addi	s0,sp,1200
	sw	a0,-1172(s0)
	li	a0,0
	call	time
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	addi	a0,s0,-560
	lw	a5,-1172(s0)
	sw	a5,4(sp)
	lui	a5,%hi(.LC7)
	addi	a5,a5,%lo(.LC7)
	sw	a5,0(sp)
	li	a7,0
	lui	a5,%hi(.LC2)
	addi	a6,a5,%lo(.LC2)
	lui	a5,%hi(.LC3)
	addi	a5,a5,%lo(.LC3)
	lui	a4,%hi(.LC4)
	addi	a4,a4,%lo(.LC4)
	lui	a3,%hi(.LC5)
	addi	a3,a3,%lo(.LC5)
	lui	a2,%hi(.LC6)
	addi	a2,a2,%lo(.LC6)
	li	a1,512
	call	snprintf
	sw	a0,-28(s0)
	addi	a5,s0,-560
	mv	a0,a5
	call	fnv1a64
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	lw	a4,-24(s0)
	addi	a5,s0,-560
	addi	a0,s0,-1160
	mv	a3,a5
	lui	a5,%hi(.LC8)
	addi	a2,a5,%lo(.LC8)
	li	a1,600
	call	snprintf
	addi	a5,s0,-1160
	mv	a0,a5
	call	fnv1a64
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	puts
	lui	a5,%hi(.LC5)
	addi	a1,a5,%lo(.LC5)
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	printf
	lui	a5,%hi(.LC4)
	addi	a1,a5,%lo(.LC4)
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	printf
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	lui	a5,%hi(.LC2)
	addi	a1,a5,%lo(.LC2)
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	printf
	li	a1,0
	lui	a5,%hi(.LC14)
	addi	a0,a5,%lo(.LC14)
	call	printf
	lui	a5,%hi(.LC7)
	addi	a1,a5,%lo(.LC7)
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	printf
	li	a1,32
	lui	a5,%hi(.LC16)
	addi	a0,a5,%lo(.LC16)
	call	printf
	lw	a1,-1172(s0)
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	printf
	lw	a2,-40(s0)
	lw	a3,-36(s0)
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	printf
	lw	a2,-48(s0)
	lw	a3,-44(s0)
	lui	a5,%hi(.LC19)
	addi	a0,a5,%lo(.LC19)
	call	printf
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	puts
	nop
	lw	ra,1196(sp)
	lw	s0,1192(sp)
	addi	sp,sp,1200
	jr	ra
	.size	uniq_print_header, .-uniq_print_header
	.align	1
	.globl	bubble
	.type	bubble, @function
bubble:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L7
.L11:
	sw	zero,-24(s0)
	j	.L8
.L10:
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a5,0(a5)
	ble	a4,a5,.L9
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a4,a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	lw	a4,-28(s0)
	sw	a4,0(a5)
.L9:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L8:
	lw	a5,-40(s0)
	addi	a4,a5,-1
	lw	a5,-20(s0)
	sub	a5,a4,a5
	lw	a4,-24(s0)
	blt	a4,a5,.L10
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-20(s0)
	blt	a4,a5,.L11
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	bubble, .-bubble
	.section	.rodata
	.align	2
.LC21:
	.string	"bubble_sort"
	.align	2
.LC22:
	.string	"Sorted:"
	.align	2
.LC23:
	.string	" %d"
	.align	2
.LC24:
	.string	""
	.align	2
.LC0:
	.word	9
	.word	4
	.word	1
	.word	7
	.word	3
	.word	8
	.word	2
	.word	6
	.word	5
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	uniq_print_header
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	t1,0(a5)
	lw	a7,4(a5)
	lw	a6,8(a5)
	lw	a0,12(a5)
	lw	a1,16(a5)
	lw	a2,20(a5)
	lw	a3,24(a5)
	lw	a4,28(a5)
	lw	a5,32(a5)
	sw	t1,-60(s0)
	sw	a7,-56(s0)
	sw	a6,-52(s0)
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	sw	a2,-40(s0)
	sw	a3,-36(s0)
	sw	a4,-32(s0)
	sw	a5,-28(s0)
	li	a5,9
	sw	a5,-24(s0)
	addi	a5,s0,-60
	lw	a1,-24(s0)
	mv	a0,a5
	call	bubble
	lui	a5,%hi(.LC22)
	addi	a0,a5,%lo(.LC22)
	call	printf
	sw	zero,-20(s0)
	j	.L13
.L14:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-44(a5)
	mv	a1,a5
	lui	a5,%hi(.LC23)
	addi	a0,a5,%lo(.LC23)
	call	printf
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L13:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	blt	a4,a5,.L14
	lui	a5,%hi(.LC24)
	addi	a0,a5,%lo(.LC24)
	call	puts
	li	a5,0
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC1:
	.word	1939669891
	.word	342167472
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
