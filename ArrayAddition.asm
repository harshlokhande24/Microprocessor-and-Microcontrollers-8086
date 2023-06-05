//Assignment 1 MM 
//Harshwardhan Lokhande

input macro
mov ah,01H
int 21H
endm

output macro
mov ah,02H
endm

disp macro var
lea dx,var
mov ah,09H
int 21H
endm

.model small
.stack 100H
.data


m1 db 10,13, "How many numbers ?:-$"
m2 db 10,13, "Enter Numbers:- $"
m3 db 10,13, "Addition :- $"
m4 db 10,13, "$"
array db 10 dup(0)
count db 0
.code
mov ax,@data
mov ds,ax
lea si,array
disp m1
input
sub al,30H

mov count,al
mov cl,count
disp m4

      s1:disp m2
input
mov [si],al
inc si
loop s1

disp m4
disp m3

mov ax,0000H
mov cl,count

lea si,array
      s2:add al,[si]
sub al,30H
inc si
loop s2

mov ch,02h
mov cl,04H
mov bl,al

      s3:rol bl,cl
      
mov dl,bl
and dl,0FH
cmp dl,09;dl=dl-09
jbe s4
add dl,07

      s4:add dl,30H

output
dec ch
jnz s3

mov ah,4CH
int 21H
end
