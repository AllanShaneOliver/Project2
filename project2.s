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
