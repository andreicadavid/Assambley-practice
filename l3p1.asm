assume cs:code, ds:data
data segment
s db 1,2,4,6,10,20,25
lens equ ($-s)
d db lens-1 dup(0)
data ends

code segment
start:
;Se da un sir de octeti S de lungime l. Sa se construiasca 
;sirul D de lungime l-1 astfel incat elementele din D sa 
;reprezinte diferenta dintre fiecare 2 elemente consecutive din S. 
;Exemplu:
;S: 1, 2, 4, 6, 10, 20, 25
;D: 1, 2, 2, 4, 10, 5
mov ax,data
mov ds,ax
mov cx,lens-1
;am atribuit lui cx numarul de repetari
mov si,0
;parcurgere s
mov di,0
;parcurgere d
repeta:
mov al, s[si]
inc si
mov bl, s[si]
;cmp al, bl
;JAE almax
;JB blmax
;almax:
;sub al, bl
;mov d[di], al
;JMP endif1
blmax:
sub bl, al
mov d[di], bl
endif1:
inc di
loop repeta

mov ax , 4c00h
int 21h
code ends
end start 	
