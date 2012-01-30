(load "attiny13.lisp")

(code-segment 0)
(sbi DDRB 0)
(sbi DDRB 1)

(sbi PORTB 0)
(sbi PORTB 1)

(main-loop)
