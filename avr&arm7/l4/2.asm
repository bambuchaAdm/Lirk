.cseg
.org 0
  cli 
  ldi r16, LOW(RAMEND)
  out SPL, r16
  sbi DDRB, 0
  sbi DDRB, 1
  cbi PORTB, 1
main: 
  sbi PORTB, 0
  rcall CZEKAJ
  cbi PORTB, 0
  rcall CZEKAJ
  rjmp main
CZEKAJ: 
  ldi r20, 0
ZEW: 
  ldi r21, 0
WEW: 
  inc r21
  cpi r21, 250
  brlo WEW
  inc r20
  cpi r20, 250
  brlo ZEW
  ret 
