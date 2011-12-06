;;Podstawowy mechanizm 

(defparameter *out* T)

(defun mov (to from)
  (format T "mov ~a, ~a" to from))

(defun add (to from)
  (format T "add ~a, ~a" to form))


(defstruct register
  name)

(defparameter R0 (make-register :name "R1"))
(defparameter R1 (make-register :name "R2"))

(defgeneric ldi (to from))

(defmethod ldi ( (to register) (number integer))
  (format T "ldi ~a, ~d~%" (register-name to) number))

(defmethod sbi ( (reg register) (bit integer) )
  (format T "sbi ~a, ~a~%" (register-name reg)  bit))

(defmethod cbi ( (reg register) (bit integer) )
  (format T "sbi ~a, ~a~%" (register-name reg) bit))

#+nil(defun ldi (to number)
  (format T "ldi ~a, ~a" to number))
