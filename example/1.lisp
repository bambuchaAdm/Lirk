(load "attiny13.lisp")

(defun wait()
  (let ((lab (make-label :name (string (gensym)))))
    (ldi R16 250)
    (make-asm-label lab)
    (dec R16)
    (brne lab)))

(code-segment)
(sbi PORTB 0)
(sbi DDRB 1)
(clr R2)
(code-segment 20)
(main-loop
 (cbi R2 1)
 (out PORTB R2)
 (wait)
 (sbi R2 1)
 (out PORTB R2)
 (wait))


