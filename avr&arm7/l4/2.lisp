(load "attiny13.lisp")

(code-segment 0)
(cli)
(ldi R16 (low RAMEND))
(out SPL R16)

(sbi DDRB 0)
(sbi DDRB 1)
(cbi PORTB 1)

(deflabel czekaj)

(main-loop
  (sbi PORTB 0)
  (rcall czekaj)
  (cbi PORTB 0)
  (rcall czekaj))

(defvar licznik-wewnetrzny R21)
(defvar licznik-zewnetrzny R20)

(make-asm-label czekaj)
(deflabel zew)
(ldi licznik-zewnetrzny 0)
(make-asm-label zew)
(progn
  (ldi licznik-wewnetrzny 0)
  (deflabel wew)
  (make-asm-label wew)
  (progn
    (inc licznik-wewnetrzny)
    (cpi licznik-wewnetrzny 250)
    (brlo wew))
  (inc licznik-zewnetrzny)
  (cpi licznik-zewnetrzny 250)
  (brlo zew))
(ret)
  