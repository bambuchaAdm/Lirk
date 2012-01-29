;;Podstawowy mechanizm 

(defparameter *out* T)

(defstruct register
  name)

(defstruct long-register
  name
  low
  high)

(defstruct label
  name)

(defmacro deflabel (name)
  `(defparameter ,name (make-label :name (string ',name))))

(defun make-asm-label (label)
  (format *out* "~a: ~%" (label-name label)))

(defmacro print-mnemonic (name &rest args)
  `(format *out* "~t ~a ~{~a~^, ~}~%" ,name (list ,@args)))

(defmethod ldi ((to register)(number integer))
  (print-mnemonic "ldi" (register-name to) number))

(defmethod ld ((to register)(from long-register))
  (print-mnemonic "ld" (register-name to) (long-register-name from)))

(defmethod sbi ((reg register)(bit integer))
  (print-mnemonic "sbi" (register-name reg)  bit))

(defmethod cbi ((reg register)(bit integer))
  (print-mnemonic "cbi" (register-name reg) bit))


(defmethod jmp ((where label))
  (print-mnemonic "jmp" (label-name where)))

(defmethod rjmp ((where integer))
  (print-mnemonic "rjmp" where))

(defmethod rjmp ((where label))
  (print-mnemonic "rjmp" (label-name where)))

(defmethod dec ((where register))
  (print-mnemonic "dec" (register-name where)))

(defmethod ldi ((where register) (value integer))
  (print-mnemonic "ldi" (register-name where) value))

(defmethod sbis ((reg register) (bit integer))
  (print-mnemonic "sbis" (register-name reg) bit))

(defmethod breq ((where integer))
  (print-mnemonic "breq" where))

(defmethod breq ((where label))
  (print-mnemonic "breq" (label-name where)))

(defmethod brne ((where integer))
  (print-mnemonic "brne" where))

(defmethod brne ((where label))
  (print-mnemonic "brne" (label-name where)))

(defmethod out ((to register) (from register))
  (print-mnemonic "out" (register-name to) (register-name from)))

(defmethod clr ((which register))
  (print-mnemonic "clr" (register-name which)))

(defmacro main-loop (&body body)
  (let ((main-label (make-label :name "main")))
    `(progn
       (make-asm-label ,main-label)
       ,@body
       (rjmp ,main-label))))

