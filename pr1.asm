assume cs:code, ds:data
data segment
a db 3
b db 5
c db 7
rez dw ?
data ends
code segment
start:
;1

mov ax,data
mov ds,ax
;mul/imul inmulteste doar cu al sau ax
;idiv imparte ax:dx sau ax cu op
mov al,a
mul al;ax = a*a
mov bx,ax
mov al,b
mul al;ax = b*b
add bx,ax ;bx = a*a+b*b
sub bx,5;bx = a*a+b*b-5
mov ax,1
;cwd ax ;dx:ax = 1
div bx; dx:ax/bx => ax - cat , dx - rest
mov cx,ax;cx = 1/(a*a+b*b-5)
mov al,a
mul al;ax = a*a
mov bx,ax
mov al,b
mul al;ax = b*b
sub bx,ax ;bx = a*a-b*b
add bx,4;bx = a*a-b*b+4
mov ax,2
;cwd ax;dx:ax = 2
div bx; dx:ax/bx => ax - cat , dx - rest
add cx,ax;1/(a*a+b*b-5)+2/(a*a-b*b+4)
mov rez,cx
mov ax,4c00h
int 21h
code ends
end start