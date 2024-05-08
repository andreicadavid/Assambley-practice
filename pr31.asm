assume cs:code,ds:data
data segment
s db 1,2,3,4
l equ ($-s)
d dw l-1 dup(0)
data ends
code segment
start:
mov ax,data
mov ds,ax
mov cx,l
mov si,0
mov di,0
repeta:
cmp si,l-1
je sfarsit
mov al,s[si]
mov bl,s[si+1]
mul bl
mov d[di],ax
inc si
add di,2
loop repeta
sfarsit:
mov ax,4c00h
int 21h
code ends
end start