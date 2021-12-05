;This exercise is destined to train the push and pop commands in a program with more than one function, as well as saving critical values like the $ra

.data
 cr: .word 0x10000
 dr: .word 0x10008

.code
 
daddi $sp,$sp,0x200
 
jal Function1

halt

;-------------------------------------- 
	;tl cr		t2 dr		t3 aux
	;t4 A		t5 B
	
Function1:
daddi $sp,$sp,-8
sd $ra,($sp)
 
ld $t1,cr($zero)
ld $t2,dr($zero)

;Get A:
daddi $t3,$zero,8
sd $t3,($t1)
ld $t4,($t2)

;Get B:
daddi $t3,$zero,8
sd $t3,($t1)
ld $t5,($t2)

daddi $sp,$sp,-16
sd $t4,8($sp)
sd $t5,($sp)

jal Max		

ld $t5,($sp)
ld $t4,8($sp)
daddi $sp,$sp,16


;Send to screen:
sd $v0,($t2)
daddi $t3,$zero,2
sd $t3,($t1)

ld $ra,($sp)
daddi $sp,$sp,8

jr $ra
;------------------------------------------
	;Function Max 	;Gets the largest of 2 values - Returns the largest to the stack																																																				
	;a 8($sp)	b ($sp)	largest: $v0		;$t0 aux	$a1 a		$a2 b

Max:
ld $a1,8($sp)
ld $a2,($sp)

;F LargestA:  
;if a<b:
slt $t0,$a1,$a2
beqz $t0,LargestA

;F LargestB:  		
dadd $v0,$a2,$zero  
jr $ra

LargestA:
dadd $v0,$a1,$zero
jr $ra