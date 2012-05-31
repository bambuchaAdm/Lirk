(defpackage #:attiny13
  (:use :cl :lirk)
  (:export #:R0
	   #:R1
	   #:R2
	   #:R3
	   #:R4
	   #:R5
	   #:R6
	   #:R7
	   #:R8
	   #:R9
	   #:R10
	   #:R11
	   #:R12
	   #:R13
	   #:R14
	   #:R15
	   #:R16
	   #:R17
	   #:R18
	   #:R19
	   #:R20
	   #:R21
	   #:R22
	   #:R23
	   #:R24
	   #:R25
	   #:R26
	   #:R27
	   #:R28
	   #:R29
	   #:R30
	   #:R31
	   #:SPL
	   #:SREG
	   #:X
	   #:Y
	   #:Z
	   #:EEARL
	   #:EEDR
	   #:EECR
	   #:OSCCAL
	   #:CLKPR
	   #:MCUSR
	   #:WDTCR
	   #:MCUSR
	   #:WDTCR
	   #:MCUCR
	   #:GIMSK
	   #:GIFR
	   #:PCMSK
	   #:PORTB
	   #:DDRB
	   #:PINB
	   #:TCCR0A
	   #:TCCR0B
	   #:TCNT0
	   #:OCR0A
	   #:OCR0B
	   #:TIMSK0
	   #:TIRF0
	   #:GTCCR
	   #:ADCSRB
	   #:ACSR
	   #:DIDR0
	   #:ADMUX
	   #:ADCSRA
	   #:ADCH
	   #:ADCL
	   #:ADCSRB
	   #:DIDR0
	   #:RAMEND
	   #:RESET_INT
	   #:INT0
	   #:PCINT0
	   #:TIM0_OVF
	   #:EE_RDY
	   #:ANA_COMP
	   #:TIM0_COMPA
	   #:TIM0_COMPB
	   #:WDT
	   #:ADC))

(in-package :attiny13)

(push "tn13def.inc" *include-list*)

;;definicja rejestrow ogolnego przeznaczenia
;;nauczyć się robić to loop'em
(defparameter R0 (make-register :name "r00"))
(defparameter R1 (make-register :name "r01"))
(defparameter R2 (make-register :name "r02"))
(defparameter R3 (make-register :name "r03"))
(defparameter R4 (make-register :name "r04"))
(defparameter R5 (make-register :name "r05"))
(defparameter R6 (make-register :name "r06"))
(defparameter R7 (make-register :name "r07"))
(defparameter R8 (make-register :name "r08"))
(defparameter R9 (make-register :name "r09"))
(defparameter R10 (make-register :name "r10"))
(defparameter R11 (make-register :name "r11"))
(defparameter R12 (make-register :name "r12"))
(defparameter R13 (make-register :name "r13"))
(defparameter R14 (make-register :name "r14"))
(defparameter R15 (make-register :name "r15"))
(defparameter R16 (make-register :name "r16"))
(defparameter R17 (make-register :name "r17"))
(defparameter R18 (make-register :name "r18"))
(defparameter R19 (make-register :name "r19"))
(defparameter R20 (make-register :name "r20"))
(defparameter R21 (make-register :name "r21"))
(defparameter R22 (make-register :name "r22"))
(defparameter R23 (make-register :name "r23"))
(defparameter R24 (make-register :name "r24"))
(defparameter R25 (make-register :name "r25"))
(defparameter R26 (make-register :name "r26"))
(defparameter R27 (make-register :name "r27"))
(defparameter R28 (make-register :name "r28"))
(defparameter R29 (make-register :name "r29"))
(defparameter R30 (make-register :name "r30"))
(defparameter R31 (make-register :name "r31"))

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

;(defmacro def-long-register (name (low high))
;  `(defparameter ,name (make-long-register :low ,low :high ,high)))

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

(defparameter RAMEND (make-asmconst :name "RAMEND"))

(defparameter RESET_INT (make-interrupt-vector :name "reset" :address 0))
(defparameter INT0 (make-interrupt-vector :name "int0" :address 1))
(defparameter PCINT0 (make-interrupt-vector :name "pcint0" :address 2))
(defparameter TIM0_OVF (make-interrupt-vector :name "tim0_ovf" :address 3))
(defparameter EE_RDY (make-interrupt-vector :name "ee_rdy" :address 4))
(defparameter ANA_COMP (make-interrupt-vector :name "ana_comp" :address 5))
(defparameter TIM0_COMPA (make-interrupt-vector :name "tim0_compa" :address 6))
(defparameter TIM0_COMPB (make-interrupt-vector :name "tim0_compb" :address 7))
(defparameter WDT (make-interrupt-vector :name "wdt" :address 8))
(defparameter ADC (make-interrupt-vector :name "adc" :address 9))
