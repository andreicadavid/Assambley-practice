ASSUME cs:code,ds:data
data segment
a dw 2
b dw 3
c dw 4
d db 7
rez dw ?
data ends
code segment
start:
mov ax, data
mov ds, ax
mov ax, b
mul c;dx:ax = b*c
mov bx,a
mov cx,0
add ax,bx
adc dx,cx;dx:ax = a=bc
mov bl,d
mov bh,0
div bx
mov rez,ax
mov ax,4c00h
int 21h
code ends
end start