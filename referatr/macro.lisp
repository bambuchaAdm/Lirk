(defmacro definterrupt (v &body body)
  `(defun ,v ()
     ,@body
     (iret)))