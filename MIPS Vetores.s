.data
 cr: .word 0x10000
 dr: .word 0x10008
;8 a1) VETOR V, de 10 valores:
; Estamos a usar 64 bits. 64/8=8 Por isso cada elemento ocupará 8bytes. 8*10elementos = 80 Bytes
 v: .word 3, 15, 100, 7 ;valores dados antes, no exercicio. pode-se fazer isto: colocar varias linhas com o numero 
	.word 0xf9876543987625aa ;valor dado antes
	.word 17, 5, 15,-100, 2023 ; a virgula e apenas separador , valor dado antes
vLen: .word 10; tamanho do vetor (feito para todo o exercicio).
	
	
;r1 r2 r3 - cr dr aux
;r4 i		r5 i*8 	  r8 8
	
	
.code
 ld r1,cr(r0)
 ld r2,dr(r0)
	
;8 a3) incrementar o 4º elemento (v[3])
 daddi r24,r0,24
 ld r3,v(r24) ; v[3] (quarto elemento porque primeiro elemenbto e o 0) que em assembler passa a ser 3*8 que e 24
; r3 passa a ter o 4º elemento do vetor
 daddi r3,r3,1  ;adiciona se 1
 sd r3,v(r24) ;envia-se a soma final para o vetor (no 4ºelemento)
 
 
;8 a2)
; for i=0; i<10; i++
;mostra v[i]

 daddi r4,r0,0  ;i=0
 daddi r8,r0,8
For:
 slti r3,r4,10 ;i=<10? 10 porque o vetor tem 10 elementos 
 beqz r3,FimFor


;mostrar elemento do vetor:
 dmul r5,r4,r8  ;multiplicar i*8 para ir buscar o proximo elemento do vetor, que estara num endereço igual a i+8, e depois i+8+8, etc 
 ld r3,v(r5)  ; v(r5) -este endereço que me referia na linha acima
 sd r3,(r2)
 daddi r3,r0,2
 sd r3,(r1)
 
 daddi r4,r4,1  ;i++
 j For
FimFor:

	
	
	
	
	
	
 halt