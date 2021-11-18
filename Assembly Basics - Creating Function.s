;Ex 10
;


.data
 cr: .word 0x10000
 dr: .word 0x10008

.code
;sl cr		s2 dr		s3 aux
;s4 A		s5 B
 
 
ld $s1,cr($zero)   ;=ld r1,cr(r0)
ld $s2,dr($zero)   ;=ld r2,dr(r0)

;Obter A:
daddi $s3,$zero,8  ;=daddi r3,r0,8
sd $s3,($s1)
ld $a0,($s2)

;Obter B:
daddi $s3,$zero,8  ;=daddi r3,r0,8
sd $s3,($s1)
ld $a1,($s2)

jal Max		;chamar funcao

;Enviar para o ecra:
sd $v0,($s2)
daddi $s3,$zero,2
sd $s3,($s1)

 
 halt


;Rotina Max
;Calcula o maximo de 2 valores

;Registos entrada: $a0 e $a1
;Registos saida: $v0																																																									

Max:

;Fazer o if. Tal como chegámos a ver tenta-se adivinhar e se nao, é o outro
;adivinhar se a<b   Se nao, é a

dadd $v0,$a0,$zero  ;colocar $a0 em $v0
slt $t0,$a0,$a1
beqz $t0,MaiorA

;MaiorB:  ;manda valor B para output
dadd $v0,$a1,$zero

MaiorA:


 jr $ra
