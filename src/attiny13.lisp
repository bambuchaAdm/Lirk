(load "main.lisp")

;;definicja rejestrow ogolnego przeznaczenia
;;nauczyć się robić to loop'em
(defparameter R0 (make-register :name "R0"))
(defparameter R1 (make-register :name "R1"))
(defparameter R2 (make-register :name "R2"))
(defparameter R3 (make-register :name "R3"))
(defparameter R4 (make-register :name "R4"))
(defparameter R5 (make-register :name "R5"))
(defparameter R6 (make-register :name "R6"))
(defparameter R7 (make-register :name "R7"))
(defparameter R8 (make-register :name "R8"))
(defparameter R9 (make-register :name "R9"))
(defparameter R10 (make-register :name "R10"))
(defparameter R11 (make-register :name "R11"))
(defparameter R12 (make-register :name "R12"))
(defparameter R13 (make-register :name "R13"))
(defparameter R14 (make-register :name "R14"))
(defparameter R15 (make-register :name "R15"))
(defparameter R16 (make-register :name "R16"))
(defparameter R17 (make-register :name "R17"))
(defparameter R18 (make-register :name "R18"))
(defparameter R19 (make-register :name "R19"))
(defparameter R20 (make-register :name "R20"))
(defparameter R21 (make-register :name "R21"))
(defparameter R22 (make-register :name "R22"))
(defparameter R23 (make-register :name "R23"))
(defparameter R24 (make-register :name "R24"))
(defparameter R25 (make-register :name "R25"))
(defparameter R26 (make-register :name "R26"))
(defparameter R27 (make-register :name "R27"))
(defparameter R28 (make-register :name "R28"))
(defparameter R29 (make-register :name "R29"))
(defparameter R30 (make-register :name "R30"))
(defparameter R31 (make-register :name "R31"))

;tylko jeden bo nie jest SPH nie jest potrzebny (@attiny13)
(defparameter SPL (make-register :name "SPL"))

(defparameter SREG (make-register :name "SREG"))

;;Rejestru "długie do adresacji"
(defparameter X (make-long-register :name "X" :low R26 :high R27))
(defparameter Y (make-long-register :name "Y" :low R28 :high R31))
(defparameter Z (make-long-register :name "Z" :low R30 :high R31))

;(def-long-register X (R26 R27))
;(def-long-register Y (R28 R29))
;(def-long-register Z (R30 R31))

#+nil(defmacro def-long-register (name (low high))
  `(defparameter ,name (make-long-register :low ,low :high ,high)))





;EEPROM
(defparameter EEARL (make-register :name "EEARL"))
(defparameter EEDR (make-register :name "EEDR"))
(defparameter EECR (make-register :name "EECR"))

;System clock
(defparameter OSCCAL (make-register :name "OSCCAL"))
(defparameter CLKPR (make-register :name "CLKPR"))

;system control
(defparameter MCUSR (make-register :name "MCUSR"))
(defparameter WDTCR (make-register :name "WDTCR"))

;interrupts
(defparameter MCUCR (make-register :name "MCUCR"))
(defparameter GIMSK (make-register :name "GIMASK"))
(defparameter GIFR (make-register :name "GIRF"))
(defparameter PCMSK (make-register :name "PCMSK"))

;gpio
(defparameter PORTB (make-register :name "PORTB"))
(defparameter DDRB (make-register :name "DDRB"))
(defparameter PINB (make-register :name "PINB"))


;8-bit timer
(defparameter TCCR0A (make-register :name "TCCR0A"))
(defparameter TCCR0B (make-register :name "TCCR0B"))
(defparameter TCNT0 (make-register :name "TCNT0"))
(defparameter OCR0A (make-register :name "ORC0A"))
(defparameter OCR0B (make-register :name "OCR0B"))
(defparameter TIMSK0 (make-register :name "TIMSK0"))
(defparameter TIRF0 (make-register :name "TIRF0"))

;timer prescaller
(defparameter GTCCR (make-register :name "GTCCR"))

;analog comparator
(defparameter ADCSRB (make-register :name "ADCSRB"))
(defparameter ACSR (make-register :name "ACSR"))
(defparameter DIDR0 (make-register :name "DIDR0"))

;ADC
(defparameter ADMUX (make-register :name "ADMUX"))
(defparameter ADCSRA (make-register :name "ADCSRA"))
(defparameter ADCH (make-register :name "ADCH"))
(defparameter ADCL (make-register :name "ADCL"))

;(def-long-register ADC (ADCL ADCH))

(defparameter ADCSRB (make-register :name "ADCSRB"))
(defparameter DIDR0 (make-register :name "DIDR0"))
