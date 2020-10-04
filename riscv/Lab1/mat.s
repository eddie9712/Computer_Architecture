	.file	"mat.c"
	.option nopic
	.text
	.section	.rodata
	.align	2
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.align	2
.LC1:
	.word	5
	.word	6
	.word	7
	.word	8
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80
	sw	s0,76(sp)
	addi	s0,sp,80
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a2,-44(s0)
	sw	a3,-40(s0)
	sw	a4,-36(s0)
	sw	a5,-32(s0)
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a2,-60(s0)
	sw	a3,-56(s0)
	sw	a4,-52(s0)
	sw	a5,-48(s0)
	sw	zero,-76(s0)
	sw	zero,-72(s0)
	sw	zero,-68(s0)
	sw	zero,-64(s0)
	sw	zero,-20(s0)
	j	.L2
.L7:
	sw	zero,-24(s0)
	j	.L3
.L6:
	sw	zero,-28(s0)
	j	.L4
.L5:
	lw	a5,-20(s0)
	slli	a4,a5,1
	lw	a5,-24(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a4,-60(a5)
	lw	a5,-20(s0)
	slli	a3,a5,1
	lw	a5,-28(s0)
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	lw	a3,-28(a5)
	lw	a5,-28(s0)
	slli	a2,a5,1
	lw	a5,-24(s0)
	add	a5,a2,a5
	slli	a5,a5,2
	addi	a2,s0,-16
	add	a5,a2,a5
	lw	a5,-44(a5)
	mul	a5,a3,a5
	add	a4,a4,a5
	lw	a5,-20(s0)
	slli	a3,a5,1
	lw	a5,-24(s0)
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a3,s0,-16
	add	a5,a3,a5
	sw	a4,-60(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L4:
	lw	a4,-28(s0)
	li	a5,1
	ble	a4,a5,.L5
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a4,-24(s0)
	li	a5,1
	ble	a4,a5,.L6
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	li	a5,1
	ble	a4,a5,.L7
	nop
	nop
	lw	s0,76(sp)
	addi	sp,sp,80
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
