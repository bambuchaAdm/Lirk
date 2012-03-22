	tst PORTB
	brnq else
	sbi PROTB 1
	rjump end
else:
	sbi PORTB 2
end:	