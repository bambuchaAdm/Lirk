main:
	cbi R0, 1
	out PORTB, R0
	rcall wiat
	sbi R0, 1
	out PORTB, R0
	rcall wait
	rjmp main


wait:
	ldi R16, 250
G698:
	dec R16
	brne G698
	ret