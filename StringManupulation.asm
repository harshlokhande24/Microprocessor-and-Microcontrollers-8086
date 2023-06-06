//Assignment 2 MM
//Harshwardhan Lokhande

.model small
.stack 100h

disp macro msg
	mov ah, 09h
	lea dx, msg
	int 21h
endm

.data
	str1 db 25, ?, 25 dup ('$')
	str2 db 25, ?, 25 dup (?)
	msg0 db 10,13, '<<<<<<<<Menu>>>>>>>>>>>>$'
	msg1 db 10,13, '1.Accept a String$'
	msg2 db 10,13, '2.Find the length of the string$'
	msg3 db 10,13, '3.Reverse the string$'
	msg4 db 10,13, '4.Check whether given string is Palindrome or not$'
	msg5 db 10,13, '5.Exit$'
	msg6 db 10,13, 'Enter your choice: $'
	msg7 db 10,13, 'Invalid choice!$'
	msg8 db 10,13, 'Enter string'
	msg9 db 10,13, 'String is:$'
	msg10 db 10,13, 'Length is:$'
	msg11 db 10,13, 'The string is a Palindrome$'
	msg12 db 10,13, 'The string is not a Palindrome$'

.code
begin: mov ax, @data
	mov ds, ax
	
menu: disp msg0 ;menu
	disp msg1 ;1.accept
	disp msg2 ;2.length
	disp msg3 ;3.reverse
	disp msg4 ;4.palindrome
	disp msg5 ;5.exit
	disp msg6 ;enter your choice

	mov ah, 01h
	int 21h

switch: mov bl, al
	cmp bl, 31h
	je case1
	cmp bl, 32h
	je case2
	cmp bl, 33h
	je case3
	cmp bl, 34h
	je case4
	cmp bl, 35h
	je case5
	disp msg7
	jmp menu

case1: call acc
	jmp menu
case2: call len
	jmp menu
case3: call rev
	jmp menu
case4: call palin
	jmp menu
case5: jmp exit

acc proc near
	disp msg8 ;enter string
	mov ah, 0ah ;accepts a string in string whose EA is loaded in dx
	lea dx, str1 ;loads effective address of str1 in dx
	int 21h
	ret
acc endp
;-----------------------------------------------------------------
len proc near
	disp msg10 ;length is
	mov cl, str1+1 ;increase counter 1 by 1 till end of string
	add cl, 30h ;conversion to ASCII
	mov ah, 02h ;display length
	mov dl, cl ;as 02h interrupt displays from dl register
	int 21h
	ret
len endp
;------------------------------------------------------------------
rev proc near
	disp msg9 ;string is
	mov ch, 00 ;initialise counter to zero
	mov cl, str1+1 ;set cl so that si can be set
	sub cl, 01h ;sub 1 from cl to set pointer at last character
	lea si, str1+2 ;set si pointer for str1 by loading EA of str1 in si
	lea di, str1+2 ;inform di about position of si
	rep movsb ;move string byte by byte
	mov cl, str1+1 ;set cl equal to str1 length for count
	lea di, str2+2 ;set counter for destination string

loop1: mov dl, [si]
	mov [di], dl
	mov ah, 02h ;display character in dl register
	int 21h
	dec si
	inc di
	dec cl
	cmp cl, 00h ;loop till counter cl!=0
	jne loop1
	ret
rev endp
;--------------------------------------------------------------------
palin proc near
	disp msg9 ;string is
	call rev
	lea di, str2+2
	lea si, str1+2
	mov cl, str1+1

loop2: mov al, [si]
	mov bl, [di]
	dec cl
	cmp cl, 00h ;keep track of count
	je loop4
	cmp al, bl ;compare if string characters are equal
	je loop3
	disp msg12 ;string is not palindrome
	jmp loop5

loop4: disp msg11 ;string is palindrome
loop5: ret
loop3: inc si
	inc di
	jmp loop2
	ret
palin endp

exit:
	mov ah, 4ch
	int 21h

end begin
