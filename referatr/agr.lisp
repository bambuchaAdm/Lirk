(defun get-number ()
  (LD R20 X+)
  R20)

(main-loop
 (out PORTA (get-number)))