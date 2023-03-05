hyruleFieldQStart:
	tempo 150

hyruleFieldQChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 129
	vol $0
	beat gs3 W+Q
; Measure 130b
	goto hyruleFieldNChannel0Measure106
	vol $0
	beat gs3 HF
; Measure 131-136
.rept 2
	goto hyruleFieldPChannel1Measure122
.endr

	indexJump
hyruleFieldQChannel0:
hyruleFieldQChannel4:
hyruleFieldQChannel6:
	cmdff
