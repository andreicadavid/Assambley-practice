ASSUME cs: code, ds:data
data SEGMENT
SIR dd 11111111h, 11111111h, 11231111h
lens equ ($-SIR)
maxim db 0
data ENDS
code SEGMENT
start:
mov ax,data
mov ds,ax
mov cx,lens
mov si,0; pt S
repeta:
mov al,byte ptr SIR[si]
cmp al,maxim
JA modifica
JB numodifica
modifica:
mov maxim,al
JMP sari
numodifica:
sari:
inc si
loop repeta
mov ax, 4c00h
int 21h
code ENDS
END start