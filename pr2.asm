assume cs:code ,ds: data
data segment
a dw 5678h;0101011001111000b
b dw 1234h;0001001000110100b
c dw ?
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ax,a;ax = 101011001111000b
mov cx,ax;cx = 101011001111000b
shr cx,7;cx = 000000010101100b
and cx,000000000000111b;cx = 000000000000100b
mov bx,b
mov dx,bx
shr dx,6;dx = 0000000001001000b
and dx,0000000001111000b
or cx,dx
mov c,cx
mov ax,4c00h
int 21h
code ends
end start


