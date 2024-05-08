assume cs:code, ds:data
data segment
a dw 55cah
;    5432109876543210
b dw 0f0fh
;    5432109876543210
c dw ?
data ends

;0110 1000 0000 0110
;5432 1098 7654 3210

code segment
start:
mov ax,data
mov ds,ax
;calculam in bx rezultatul
mov bx,0
mov ax,a
and ax,0000111100000000b
mov cl,8
ror ax,cl
or bx,ax;bitii 8-11 din a sunt pe poz 0-3 in bx

and bx,1111100000001111b
;pe poz 4-10 este bitul 0

mov ax,b
and ax,1111100000000000b
or bx,ax
;in bx avem rezultatul final
mov c,bx
mov ax , 4c00h
int 21h
code ends
end start