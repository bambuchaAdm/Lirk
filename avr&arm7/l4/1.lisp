(load "../../lirk.asd")
(require 'lirk )

(use-package 'lirk)
(use-package 'attiny13)

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

(make-asm-label czekaj)
(deflabel zew)
(ldi R20 0)
(make-asm-label zew)
(progn
  (ldi R21 0)
  (deflabel wew)
  (make-asm-label wew)
  (progn
    (inc R21)
    (cpi R21 250)
    (brlo wew))
  (inc R20)
  (cpi R20 250)
  (brlo zew))
(ret)
  



(defun gen (n)
  (if (zerop n)
      (gen (1- n))
      (n)))