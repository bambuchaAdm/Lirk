
(load "../../lirk.asd")
(require 'lirk )

(use-package 'lirk)
(use-package 'attiny13)

(code-segment)

(ldi R16  3)
(out DDRB R16)

(ldi R16  1)
(out PORTB R16)

(main-loop)