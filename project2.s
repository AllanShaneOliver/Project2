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
