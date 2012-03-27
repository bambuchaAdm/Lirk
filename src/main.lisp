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

(defstruct asmconst
  name)

(defstruct asm-number
  expr)

(defstruct interupt-vector
  name
  address)

(defmacro deflabel (name)
  `(defparameter ,name (make-label :name (string ',name))))

(defun make-asm-label (label)
  (format *out* "~a: ~%" (label-name label)))

(defmacro print-mnemonic (name &rest args)
  `(format *out* "~t ~a ~{~a~^, ~}~%" ,name (list ,@args)))

(defmethod ldi ((to register)(number integer))
  (print-mnemonic "ldi" (register-name to) number))

(defmethod ldi ((to register)(number asm-number))
  (print-mnemonic "ldi" (register-name to) (asm-number-expr number)))

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

(defmethod inc ((where register))
  (print-mnemonic "inc" (register-name where)))

(defmethod ldi ((where register) (value integer))
  (print-mnemonic "ldi" (register-name where) value))

(defmethod sbis ((reg register) (bit integer))
  (print-mnemonic "sbis" (register-name reg) bit))

(defmethod cpi ((reg register) (number integer))
  (print-mnemonic "cpi" (register-name reg) number))

(defmethod breq ((where integer))
  (print-mnemonic "breq" where))

(defmethod breq ((where label))
  (print-mnemonic "breq" (label-name where)))

(defmethod brne ((where integer))
  (print-mnemonic "brne" where))

(defmethod brne ((where label))
  (print-mnemonic "brne" (label-name where)))

(defmethod brlo ((where label))
  (print-mnemonic "brlo" (label-name where)))

(defmethod brlo ((where integer))
  (print-mnemonic "brlo" where))


(defmethod out ((to register) (from register))
  (print-mnemonic "out" (register-name to) (register-name from)))

(defmethod clr ((which register))
  (print-mnemonic "clr" (register-name which)))

(defun cli ()
  (print-mnemonic "cli"))

(defmethod rcall ((where label))
  (print-mnemonic "rcall" (label-name where)))

(defun ret ()
  (print-mnemonic "ret"))

(defmacro main-loop (&body body)
  (let ((main-label (make-label :name "main")))
    `(progn
       (make-asm-label ,main-label)
       ,@body
       (rjmp ,main-label))))


(defun include (args)
  (format *out* ".nolist~%~{.include \"~a\"~%~}.list~%" args))

(defun code-segment (&optional (org nil) )
  (format *out* ".cseg~%")
  (if org
      (format *out* ".org ~a~%" org)))


(defmethod low ((arg asmconst))
  (make-asm-number :expr (concatenate 'string "LOW(" (asmconst-name arg) ")")))

(defmethod high ((arg asmconst))
  (make-asm-number :expr (concatenate 'string "HIGH(" (asmconst-name arg) ")")))