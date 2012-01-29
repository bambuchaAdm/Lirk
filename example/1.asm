.DEVICE ATtiny13
.CSEG
  sbi PORTB, 0
  sbi DDRB, 1
  out R0
main:   cbi R0, 1
  out PORTB, R0
  ldi R16, 250
G676:   dec R16
  brne G676
  sbi R0, 1
  out PORTB, R0
  ldi R16, 250
G698:   dec R16
  brne G698
  rjmp main
