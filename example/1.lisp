(require 'lirk "../lirk.asd")

(use-package 'lirk)
(use-package 'attiny13)

(defun wait()
  (let ((lab (gen-label)))
    (ldi R16 250)
    (make-asm-label lab)
    (dec R16)
    (brne lab)))

(code-segment)
(sbi PORTB 0)
(sbi DDRB 1)
(clr R2)
(main-loop
 (cbi R2 1)
 (out PORTB R2)
 (wait)
 (sbi R2 1)
 (out PORTB R2)
 (wait))


