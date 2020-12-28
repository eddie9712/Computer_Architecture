### modify from the lab07 cache.s
.data
array:	.word	2048		# max array size specified in BYTES (DO NOT CHANGE)

.text
##################################################################################################
# You MAY change the code below this section
main:	
    li	a0, 4096		# array size in BYTES (power of 2 < array size)
	li	a1, 1		# step size  (power of 2 > 0)
	li	a2, 10000		# rep count  (int > 0)
    li  a3  0       # flag
# You MAY change the code above this section
##################################################################################################

	jal	accessWords	# lw/sw

	li	a7,10		# exit
	ecall

# SUMMARY OF REGISTER USE:
#  a0 = array size in bytes
#  a1 = step size
#  a2 = number of times to repeat
#  a3 = 0 (W) / 1 (RW)
#  s0 = moving array ptr
#  s1 = array limit (ptr)

accessWords:
	la	s0, array		   # ptr to array
	add	s1, s0, a0		   # hardcode array limit (ptr)
	slli	t1, a1, 2	   # multiply stepsize by 4 because WORDS
        andi t2 a3 1           # check whether the a3 is odd number
        beqz t2 increase

decrease:  
        lw	t3,  0(s1)		    # array[index/4] = 0
	sub	s1, s1, t1		    # decreament ptr
	blt	s1, s0, decrease	# inner loop done?
        addi a3 a3 0
        j endrep

increase:
	lw	t3,  0(s0)		    # array[index/4] = 0
	add	s0, s0, t1		    # increment ptr
	blt	s0, s1, increase	# inner loop done?
        addi a3 a3 1
    
endrep:   
	addi	a2, a2, -1
	bgtz	a2, accessWords	# outer loop done?
	jr	ra

