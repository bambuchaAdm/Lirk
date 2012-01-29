.nolist
.include "tn13def.inc"
.list
.cseg

  sbi PORTB, 0
  sbi DDRB, 1
  clr r02
main: 
  cbi r02, 1
  out PORTB, r02
  ldi r16, 250
G676: 
  dec r16
  brne G676
  sbi r02, 1
  out PORTB, r02
  ldi r16, 250
G698: 
  dec r16
  brne G698
  rjmp main
