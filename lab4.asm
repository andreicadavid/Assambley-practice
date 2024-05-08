;ASSUME cs: code, ds:data
;data SEGMENT
;parola db 'corect',0; sirul parola
;lens equ ($-parola)
;sir_citit db 20,?,20 dup (0)
;data ENDS
;code SEGMENT
;start:
;mov ax,data
;mov bl,parola
;mov cl,lens
;repeta:
;mov si,0
;mov ah,0Ah
;mov dx, offset sir_citit
;int 21h

ASSUME cs: code, ds:data
data SEGMENT
parola db 'corect'  ; sirul parola
lens equ ($-parola)
mesaj_incorect db 'parola incorecta$'
mesaj_corect db 'parola corecta$'
sir_citit db 20,?,20 dup(0); sirul citit de la tastatura
data ENDS
code SEGMENT
start:
mov ax, data
mov ds, ax
mov si, offset parola ; Adresa sirului parola
mov di, 2 ; Adresa sirului citit
mov cx, lens ; Lungimea sirului parola
mov ah, 0Ah           
mov dx, offset sir_citit 
int 21h 
repe_cmp:   
mov al,sir_citit[1]
cmp al,lens
jne sir_incorect           ; Apel la serviciul de citire string
mov al, parola[si]      
;sub al,'0'
mov bl,sir_citit[di]
;sub bl,'0'
cmp al, bl
je ok
jne sir_incorect  
ok:
inc si           
inc di 
jmp sari
sir_incorect:
mov ah, 09h           ; Serviciul de afisare string DOS
mov dx, offset mesaj_incorect  ; Adresa mesajului pentru parola incorecta
int 21h               ; Apel la serviciul de afisare string  
mov ah, 0Ah           
mov dx, offset sir_citit 
int 21h 
mov cx,lens
jmp repe_cmp
sari:		
loop repe_cmp     ; Continuam comparatia cat timp nu am ajuns la finalul sirului parola
mov ah, 09h           ; Serviciul de afisare string DOS
mov dx, offset mesaj_corect  ; Adresa mesajului pentru parola incorecta
int 21h               ; Apel la serviciul de afisare string
mov ah, 4Ch           ; Serviciul de terminare DOS
int 21h               ; Apel la serviciul de terminare
code ENDS
END start


