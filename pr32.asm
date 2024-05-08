assume cs:code,ds:data
data segment
s dd 12345678h , 4d163a42h
l equ ($-s)/4
d db l dup(0)
data ends
code segment
start:
mov ax,data
mov ds,ax
mov cx,l
mov si,0
mov di,0
repeta:
cmp di,l*4
je sfarsit
mov al,byte ptr s[si]
mov d[di],al
inc di
add si,4
loop repeta
sfarsit:
mov ax,4c00h
int 21h
code ends
end start
