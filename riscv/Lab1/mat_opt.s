.data
str1: .string "The result is:"

.LC0:
        .word 1
        .word 2
        .word 3
        .word 4
.LC1:
	    .word 5
	    .word 6
        .word 7
        .word 8
.text

main:
	addi sp,sp,-80                   # set the stack pointer 
    sw s0,76(sp)
    addi s0,sp,80
    la a5,.LC0                       #load the memory from address .LC0
    lw a2,0(a5)
	lw a3,4(a5)
	lw a4,8(a5)
	lw a5,12(a5)
	sw a2,-44(s0)                    #store the value 1,2,3,4 from LC0 to new space (matrix1 2*2)
	sw a3,-40(s0)
	sw a4,-36(s0)
    sw a5,-32(s0)
	la a5,.LC1                       #load the memory from address .LC1
	lw a2,0(a5) 
	lw a3,4(a5)
	lw a4,8(a5)
	lw a5,12(a5)
	sw a2,-60(s0)                    #store the value 5,6,7,8 from LC0 to new space (matrix2 2*2)
	sw a3,-56(s0)
	sw a4,-52(s0)
	sw a5,-48(s0)
    sw zero,-76(s0)                  #initialize the space of the new matrix(result 2*2)
	sw zero,-72(s0)
	sw zero,-68(s0)
	sw zero,-64(s0)
	sw zero,-20(s0)                  #set variable i to zero
	j .L2

.L7:
	sw zero,-24(s0)                  #set variable j to zero
	j .L3

.L6:
	sw zero,-28(s0)                  #set variable k to zero
	j .L4

.L5:
	lw a5,-20(s0)                    #calculate the address of the subscripts in new matrix  
	slli a4,a5,1 
	lw a5,-24(s0) 
	add a5,a4,a5 
	slli a5,a5,2 
	addi a4,s0,-16 
	add a5,a4,a5  
	lw a4,-60(a5)                    #a4 = value of the selected subscripts in new matrix
    mv t1 a5                                
	lw a5,-20(s0)                    #calculate the address of the element in matrix1 
	slli a3,a5,1               
	lw a5,-28(s0)  
	add a5,a3,a5   
	slli a5,a5,2   
	addi a3,s0,-16  
	add a5,a3,a5     
	lw a3,-28(a5)                    #a3 = value of the selected subscripts in matrix1
	lw a5,-28(s0)                    #calculate the address of the subscripts in new matrix2 
	slli a2,a5,1
	lw a5,-24(s0)
	add a5,a2,a5
	slli a5,a5,2
	addi a2,s0,-16
	add a5,a2,a5
	lw a5,-44(a5)                    #a5 = value of the selected subscripts in matrix2
	mul a5,a3,a5     
	add a4,a4,a5     
	sw a4,-60(t1)
    lw a5,-28(s0)
	addi a5,a5,1     
	sw a5,-28(s0)

.L4:
	lw a4,-28(s0)                    #The second loop (variable k)
	li a5,1
	ble a4,a5,.L5 
	lw a5,-24(s0)
	addi a5,a5,1   
	sw a5,-24(s0)

.L3:
	lw a4,-24(s0)                    #The second loop (variable j)
	li a5,1
	ble a4,a5,.L6
	lw a5,-20(s0)
	addi a5,a5,1
	sw a5,-20(s0)

.L2:                                     #the outermost loop (variable i) 
	lw a4,-20(s0) 
	li a5,1
	ble a4,a5,.L7 
	nop
	nop
	jal ra,printResult
	lw s0,76(sp)
	addi sp,sp,80
    li a7 10
    ecall

printResult:                             #print the 2*2 matrix
        la a0,str1
        li a7,4
        ecall
     
     	li a0 10                         #go to next line
     	li a7 11
     	ecall

     	lw t1,-76(s0)                    #first element
     	mv a0,t1
     	li a7,1
     	ecall
     
     	li a0 32                         #space character
     	li a7 11
     	ecall
  
     	lw t1,-72(s0)                    #first element
     	mv a0,t1
     	li a7,1
     	ecall
     
     	li a0 10                         #go to next line
     	li a7 11
     	ecall
 
     	lw t1,-68(s0)                    #first element
     	mv a0,t1
     	li a7,1
     	ecall

     	li a0 32                         #space character
     	li a7 11
     	ecall
  
     	lw t1,-64(s0)                    #first element
     	mv a0,t1
     	li a7,1
     	ecall
 
     	li a0 10                         #go to next line
     	li a7 11
     	ecall
        ret
