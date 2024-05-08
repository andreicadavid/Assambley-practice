;7. Se sa citeasca un sir de cifre a. 
;Sa se salveze in sirul c doar cifrele impare. 
;Sa se afiseze sirul c pe ecran.
assume cs:code,ds:data
data segment 
a db 20,?,20 dup(0)
l equ ($-a)
c db 20,?,20 dup(0)
data ends
code segment
start:
mov ax,data
mov ds,ax
mov cx,l
mov si,0
mov di,offset c
mov ah,0Ah
mov dx,offset a
int 21h
mov ah,09h
mov dx,offset a
int 21h
verificare:
mov bl,a[si]
cmp bl,0
je sfarsit
mov bl,a[si]
sub bl,'0'
mov al,a[si]
sub al,'0'
cbw
mov cl,2
div cl
mov cl,1
cmp ah,cl
je adaugare
jne sari
adaugare:
mov cl,a[si]
sub cl,'0'
mov c[di],cl
inc si
inc di
sari:
inc si
loop verificare
mov ah,09h
mov dx,offset c
int 21h
sfarsit:
mov ah,09h
mov dx,offset c
int 21h
mov ax,4c00h
int 21h
code ends
end start

