(load "attiny13.lisp")

(code-segment 0)
(ldi R16  3)
(out DDRB R16)
(ldi R16  1)
(out PORTB R16)
(main-loop)