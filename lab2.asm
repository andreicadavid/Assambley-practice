ASSUME cs:code,ds:data
data segment
a db 2
b db 3
c db 5
d db 3
result dw ?
data ends
code segment
incepe:
mov ax,data
mov ds,ax
; a + b + c + 1
mov al, a
add al, b
add al, c
add al, 1
mov bl, al; bl = a + b + c + 1
; (a + b + c + 1) * (a + b + c + 1)
mul bl;ax=rezultatul
mov bx, ax
; a - b + d
mov al, a
sub al, b
add al, d
mov dl, al; dl = a - b + d
; (a - b + d)^2
mul dl      ; ax = (a - b + d)^2
; (a + b + c + 1)^2 / (a - b + d)^2
mov cx, ax
mov ax, bx
mov bx, cx
mov dx, 0
div bx
mov result, ax   ; Salvăm rezultatul în variabila 'result'
; Aici avem rezultatul 'z' în variabila 'result'
mov ax, 4C00h
int 21h
code ends
end incepe
