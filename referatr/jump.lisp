(defun wait()
  (let ((lab (make-label 
	      :name (string
		     (gensym)))))
    (ldi R16 250)
    (make-asm-label lab)
    (dec R16)
    (brne lab)))

(main-loop
 (cbi R2 1)
 (out PORTB R2)
 (call wait)
 (sbi R2 1)
 (out PORTB R2)
 (call wait))
