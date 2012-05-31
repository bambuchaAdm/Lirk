(load "../../lirk.asd")
(require 'lirk )

(use-package 'lirk)
(use-package 'attiny13)

(code-segment)
(sbi DDRB 0)
(sbi DDRB 1)

(sbi PORTB 0)
(sbi PORTB 1)

(main-loop)
