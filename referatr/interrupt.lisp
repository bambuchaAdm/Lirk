(definterrupt INT0
  (sbi R1 0)
  (nop)
  (nop)
  (nop)
  (cbi R1 0))