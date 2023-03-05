hyruleFieldKStart:
	tempo 150

hyruleFieldKChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 81-82
	duty $02
	vibrato $a1
	vol HI_VOL-1
	transpose 0	
	goto hyruleFieldKChannel1Measure81
; Measure 83-84
	vol HI_VOL
	transpose 5
	goto hyruleFieldKChannel1Measure81
; Measure 85-86
	vol HI_VOL+1
	transpose 10
	goto hyruleFieldKChannel1Measure81
; Measure 87
	vol HI_VOL+2
	env $0 $00
	transpose 28
	goto hyruleFieldDChannel1Measure77
; Measure 88
	vol $0
	beat gs3 W

	indexJump
	cmdff	

hyruleFieldKChannel1Measure81:
; Measure 81-82
	env $0 $04
	octave 5
beginLoop 2
	beat c R1+R2 c R3+R1 c R2 c R3
	beat c R1+R2 d R3+R1 d R2 d R3
breakOrLoop

	endSec

hyruleFieldKChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 81-82
	vol HI_VOL
	duty $03
	vibrato $a1
	transpose -9
	goto hyruleFieldKChannel1Measure81
; Measure 83-84
	vol HI_VOL+1
	transpose -5
	goto hyruleFieldKChannel1Measure81
; Measure 85-86
	vol HI_VOL+2
	transpose 0
	goto hyruleFieldKChannel1Measure81
; Measure 87
	goto hyruleFieldBChannel1Measure9
	octave 5
	beat d E1 cs S3 c S4
; Measure 88
	transpose 16
	goto hyruleFieldDChannel1Measure77


	indexJump
	cmdff


hyruleFieldKChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 81-82
	transpose 3
	goto hyruleFieldKChannel4Measure81
; Measure 83-84
	transpose 7
	goto hyruleFieldKChannel4Measure81
; Measure 85-86
	transpose 0
	goto hyruleFieldKChannel4Measure81
; Measure 87
	goto hyruleFieldAChannel4Measure1
; Measure 88
	goto hyruleFieldAChannel4Measure1

	indexJump
hyruleFieldKChannel6:
	cmdff

hyruleFieldKChannel4Measure81:
; Measure 81
	duty HI_VOL
	octave 2
beginLoop 2
	beat f E1 r E2+E1
	beat f S3 r S4+E1
	beat f S3 r S4
	beat g E1 r E2
breakOrLoop

	endSec
