main:
	cbi R0, 1
	out PORTB, R0
	ldi R16, 250
G676:
	dec R16
	brne G676
	sbi R0, 1
	out PORTB, R0
	ldi R16, 250
G698:
	dec R16
	brne G698
	rjmp main
