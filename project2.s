.data
invalid: .asciiz "Invalid Input!\n"
list: .space 1002 #can store 1000 characters into a string named "list"
.text
.globl main

main:
  li $v0, 8 #reads strings into list string
  la $a0, list
  li $a1, 1001 #input no more than 1001 characters
  syscall

jal conversion

li $v0, 10
syscall

conversion:

li $s1, '0' #character 0
li $s2, '9' #character 9
li $t4, 'a' #character a - lower boundary for base 29
li $t5, 's' #character s - upper boundary for base 29
li $t6, 'A' #character A - lower boundary for base 29
li $t7, 'S' #character S - upper boundary for base 29
li $s3, 0 #result variable
li $s4, 0 #variable which will print the final result
li $t3, -1 #obtains length of string
li $t2, 4 #print invalid input if string length > 4

length:
  lb $t0, ($a0)
  beq $t0, $0, begin
  addi $t3, $t3, 1 #increment length
  addi $a0, $a0, 1
  bgt $t3, $t2, EL
j length

begin:
  move $s0, $t3
  li $s5, 1 #used to square, cube, etc 29
  li $s6, 29 #base
  li $s7, 0 #product of 29 * 1
  la $a0, list

loop:
    lb $t1, ($a0)
    addi $s0, $s0, -1
    beq $s0, $zero, afterloop #jump to afterloop after 10th character is reached
    addi $a0, $a0, 1 #add 1 after each iteration, i++;
    mul $s7, $s6, $s5
