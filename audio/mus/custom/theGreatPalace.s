theGreatPalaceStart:
	tempo 156

theGreatPalaceChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 1
	duty $02
	env $0 $05
	vibrato $02
	vol HI_VOL
	goto theGreatPalaceChannel1Measure1
; Measure 2
	octave 4
	beat f E1 g E2 a E1 b E2+E1
	beat a E2 g Q r Q

theGreatPalaceChannel1Loop:
	transpose 0
	env $0 $05
beginLoop 2
; Measure 3b,7b
	octave 4
	beat a E1 a E2
	beat b E1 ou c E2 d E1 e E2
; Measure 4,8
	beat b Q+E1 a E2+Q e Q
; Measure 5,9
	beat g Q+E1 fs E2+Q d Q
; Measure 6,10
	beat f Q+E1 e E2+Q c Q+E1 r E2
breakOrLoop

; Measure 11b-14
	goto theGreatPalaceChannel1Measure11b
; Measure 15-18
	vol $0
	beat g3 Q
	goto theGreatPalaceChannel1Measure11b
; Measure 19
	octave 5
	beat c E1 od a E2+E1 ou e E2+HF
; Measure 20
	beat c E1 od a E2+E1 ou g E2+E1 fs E2+Q
; Measure 21
	beat c E1 od a E2+E1 ou e E2+HF
; Measure 22
	octaved
	env $0 $07
	beat e E1 f E2+E1 gs E2+E1 b E2+Q
; Measure 3a
	beat r Q

	goto theGreatPalaceChannel1Loop
	cmdff

theGreatPalaceChannel1Measure11b:
; Measure 11b
	octave 4
	vol HI_VOL
	beat gs Q ou c E1 d E2+E1
; Measure 11d	
	beat f E2+Q+E1 ds E2+E1 f E2+Q
; Measure 13
	beat g E1 f E2 ds E1 f E2+E1 ds E2 d Q
; Measure 14
	beat ds E1 d E2 c E1 d E2+E1 c E2
	octaved
	beat as Q

	endSec

theGreatPalaceChannel1Measure1:
; Measure 1
	octave 4
	beat a Q g E1 a E2+E1 e E2+E1 g E2
	
	endSec
	
theGreatPalaceChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $2

; Measure 1
	duty $02
	env $0 $06
	vibrato $01
	vol HI_VOL
	transpose -5
	goto theGreatPalaceChannel1Measure1
; Measure 2
	vol $0
	beat g3 E1
	vol HI_VOL
	transpose 0
	octave 4
	beat c E2 c E1 d E2+S1 r S2
	beat d E2 d Q

theGreatPalaceChannel0Loop:
	transpose 0
; Measure 3-10
	env $0 $06
beginLoop 4
	goto theGreatPalaceChannel0Measure3
	goto theGreatPalaceChannel0Measure4
breakOrLoop
; Measure 11-18
beginLoop 16
	octave 3
	beat gs E1 ou c E2 d E1 f E2
breakOrLoop
; Measure 19
	goto theGreatPalaceChannel0Measure3
; Measure 20
	goto theGreatPalaceChannel0Measure4
; Measure 21
	goto theGreatPalaceChannel0Measure3
; Measure 22
	env $0 $07
	octave 3
	beat b E1 ou c E2+E1 d E2+E1 e E2+Q

	goto theGreatPalaceChannel0Loop
	cmdff
	

theGreatPalaceChannel0Measure3:
; Measure 3
	octave 3
	beat a E1 ou c E2 e E1 a E2
	octaved
	beat a E1 ou c E2 e E1 gs E2

	endSec

theGreatPalaceChannel0Measure4:
; Measure 4
	octaved
	beat a E1 ou c E2 e E1 g E2	
	octaved
	beat a E1 ou c E2 e E1 fs E2

	endSec


theGreatPalaceChannel4:
	.redefine HI_VOL $28
	.redefine LO_VOL $08

; Measure 1
	octave 2
	duty HI_VOL
	beat a E1 r E2 g E1 a E2
	beat r E1 e E2 r E1 g E2
; Measure 2
	beat f E1 f E2 f E1 g E2
	beat r E1 g E2 g E1 r E2

theGreatPalaceChannel4Loop:
	transpose 0
; Measure 3-10
beginLoop 8
	goto theGreatPalaceChannel4Measure3
breakOrLoop
; Measure 11-18
	transpose -4
beginLoop 8
	goto theGreatPalaceChannel4Measure3
breakOrLoop
; Measure 19-21
	transpose 0
beginLoop 3
	goto theGreatPalaceChannel4Measure3
breakOrLoop
; Measure 22
	octave 2
	beat e E1 f E2 r E1 gs E2
	beat r E1 b E2 r Q

	goto theGreatPalaceChannel4Loop
	cmdff

theGreatPalaceChannel4Measure3:
; Measure 3
	octave 2
	beat a E1 r E2 e E1 a E2 r Q+E1 e E2

	endSec

theGreatPalaceChannel6:
	.redefine HI_VOL $4
	.redefine LO_VOL $3
	.redefine HIT $2a

; Measure 1
	vol $0
	beat r W
theGreatPalaceChannel6Loop:
; Measure 2,22
	beat r W
; Measure 3-21
	vol HI_VOL
beginLoop 19
	beat HIT Q+E1 HIT E2+Q HIT Q
breakOrLoop
	vol $0

	goto theGreatPalaceChannel6Loop
	cmdff
