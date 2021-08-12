.include"m16def.inc"

ldi R16,0b11111111            
out DDRA,R16            

ldi R16, 0b10000000
out DDRD, R16
out OCR2,R16

ldi R20,0b01101001
out TCCR0,R20

ldi R17,0b01000000          
ldi R18,0b11000000                
ldi R19,0b10000000
ldi R22,8

ldi R24,0b00000001
ldi R25,0b00000010
ldi R26,0b00000100

p0:in R23, PINC
   and R23,R24
   ror R23
   brcs petlja
   rjmp p0
          
petlja: clc
        in R23,PINC
        and R23,R26
		ror R23
		ror R23
		ror R23
        brcs p1
		rjmp petlja

     p1:in R21,ACSR 
        lsl R21
        lsl R21     
		add R21,R19
		brcc p2
		or R16,R17

	p2: brcs p3      
	    eor R16,R18
	
	p3: out OCR2,R16
	    out PORTA,R16
	    lsr R17
		lsr R18
		dec R22
		brne petlja 
