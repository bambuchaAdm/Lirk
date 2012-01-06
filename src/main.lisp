;;Podstawowy mechanizm 

(defparameter *out* T)

(defstruct register
  name)

(defstruct big-register
  name)

(defstruct label
  name)

(defparameter R0 (make-register :name "R0"))
(defparameter R1 (make-register :name "R1"))

(defmacro print-mnemonic (name &rest args)
  `(format *out* "~t ~a ~{~a~^, ~}~%" ,name (list ,@args)))

(defmethod ldi ((to register)(number integer))
  (print-mnemonic "ldi" (register-name to) number))

(defmethod ld ((to register)(from big-register))
  (print-mnemonic "ld" (register-name to) (big-register-name from)))

(defmethod sbi ((reg register)(bit integer))
  (print-mnemonic "sbi" (register-name reg)  bit))

(defmethod cbi ((reg register)(bit integer))
  (print-mnemonic "cbi" (register-name reg) bit))

(defun make-asm-label (label)
  (format *out* "~a : ~%" (label-name label)))

(defmethod jmp ((where label))
  (print-mnemonic "jmp" (label-name where)))

(defmethod rjmp ((where integer))
  (print-mnemonic "rjmp" where))

(defmethod rjmp ((where label))
  (print-mnemonic "rjmp" (label-name where)))

(defmacro main-loop (&body body)
  (let ((main-label (make-label :name "main")))
    `(progn
       (make-asm-label ,main-label)
       ,@body
       (rjmp ,main-label))))