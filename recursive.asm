
.data

DYNAMEIS: 4, 16, 64, 256, 1024, 4096 , 16384, 65536
PARAGONTIKA: 1, 2, 6, 24, 120, 720, 5040, 40320
APOTEL: 0,0,0,0,0,0,0,0

.text
la $s5, DYNAMEIS 
la $s6, PARAGONTIKA 
la $s7, APOTEL 

addiu $a0, $zero, 9
jal anadromh
move $s0,$v0

exit_module: li $v0, 10 
syscall


anadromh:
    addi $sp, $sp, -8     
    sw   $ra, 4($sp)      
    sw   $a0, 0($sp)      

    slti $t0, $a0, 1     
    beq  $t0, $zero, L1

li $t1, 1
sw $t1, 0($s7) 
 
addiu $s7,$s7,4 


    addi $sp, $sp, 8      
    jr   $ra              


L1: addi $a0, $a0, -1     
    jal  anadromh             

   
    addi $sp, $sp, 8     

lw   $a0, 0($sp)      
lw   $ra, 4($sp)     

lw $t2, 0($s5) 
lw $t3, 0($s6) 

div $t4 ,$t2,$t3 
sw $t4, 0($s7) 

addiu $s7,$s7,4 
addiu $s6,$s6,4
addiu $s5,$s5,4 

    jr   $ra          