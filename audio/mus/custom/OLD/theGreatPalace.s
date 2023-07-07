theGreatPalaceStart:
; BPM = 150 B = 24
theGreatPalaceChannel1:
    .redefine BEAT 12
    .redefine CHANNEL 1
    .redefine HI_VOL $6
    .redefine LO_VOL $3
    .redefine LO_VOL_RATIO 0.25
    octave 4
; Measure 1
    duty $02
	volbeat a 2 g 1 a 2 e 2 g 1
; Measure 2
	volbeat f 1 g 1 a 1 b 2 a 1 g 2
	volbeat r 2

theGreatPalaceChannel1Measure3bReset:
    resetCoda

theGreatPalaceChannel1Measure3b:
	incCoda
; Measure 3b,7b
	octave 4
	vibrato $02
	volbeat a 1 a 1
	volbeat b 1 ou c 1 d 1 e 1
; Measure 4,8
	volbeat b 3 a 3 e 2
; Measure 5,9
	volbeat g 3 fs 3 d 2
; Measure 6,10
	volbeat f 3 e 3 c 3 r 1

	gotoCond 1 theGreatPalaceChannel1Measure3b

theGreatPalaceChannel1Measure11b:
	incCoda
; Measure 11b
	octave 4
	volbeat gs 2 ou c 1 d 2 f 4
; Measure 12
	volbeat ds 2 f 3
; Measure 13
	volbeat g 1 f 1 ds 1 f 2 ds 1 d 2
; Measure 14
	volbeat ds 1 d 1 c 1 d 2 c 1 

	gotoCond 4 theGreatPalaceChannel1Measure18d

	volbeat od as 3 r 1

	goto theGreatPalaceChannel1Measure11b

theGreatPalaceChannel1Measure18d:
; Measure 18d
	octave 4
	volbeat as 2
; Measure 19
	octaveu
	volbeat c 1 od a 2 ou e 5
; Measure 20
	volbeat c 1 od a 2 ou g 2 fs 3
; Measure 21
	volbeat c 1 od a 2 ou e 5
; Measure 22
	octaved
	volbeat e 1 f 2 gs 2 b 3 r 2

	goto theGreatPalaceChannel1Measure3bReset
    cmdff

theGreatPalaceChannel0:
    .redefine BEAT 12
    .redefine CHANNEL 0
    .redefine HI_VOL $4
    .redefine LO_VOL $2
    .redefine LO_VOL_RATIO 0.25
; Measure 1
	octave 4
	duty $02
	volbeat e 2 d 1 e 2 od b 2 ou d 1
; Measure 2
	volbeat r 1 c 1 c 1
.redefine BEAT 6
	volbeat d 3 r 1
.redefine BEAT 12
	volbeat d 1
	vol $6
	beat d 2

theGreatPalaceChannel0Measure3Reset:
	resetCoda
	env $0 $06
theGreatPalaceChannel0Measure3:
	incCoda
; Measure 3
	octave 3
	volbeat a 1 ou c 1 e 1 a 1
	octaved
	volbeat a 1 ou c 1 e 1 gs 1

	gotoCond 22 theGreatPalaceChannel0Measure22

; Measure 4
	octaved
	volbeat a 1 ou c 1 e 1 g 1	
	octaved
	volbeat a 1 ou c 1 e 1 fs 1

	gotoCond 4 theGreatPalaceChannel0Measure11
	goto theGreatPalaceChannel0Measure3

theGreatPalaceChannel0Measure11:
	incCoda
; Measure 11
	octave 3
	volbeat gs 1 ou c 1 d 1 f 1

	gotoCond 20 theGreatPalaceChannel0Measure3
	goto theGreatPalaceChannel0Measure11

theGreatPalaceChannel0Measure22:
; Measure 22
	octave 3
	volbeat b 1 ou c 2 d 2 e 3

	goto theGreatPalaceChannel0Measure3Reset
    cmdff


theGreatPalaceChannel4:
    .redefine BEAT 12
    .redefine CHANNEL 4
    .redefine HI_VOL $0e
    .redefine LO_VOL $0f
    .redefine LO_VOL_RATIO 0.5
	octave 2
; Measure 1
    volbeat a 1 r 1 g 1 a 1
    volbeat r 1 e 1 r 1 g 1
; Measure 2
    volbeat f 1 f 1 f 1 g 1
    volbeat r 1 g 1 g 1 r 1

theGreatPalaceChannel4Measure3Reset:
	resetCoda
theGreatPalaceChannel4Measure3:
	incCoda
; Measure 3
	volbeat a 1 r 1 e 1 a 1 r 3 e 1

	gotoCond 8 theGreatPalaceChannel4Measure11
	gotoCond 19 theGreatPalaceChannel4Measure22
	goto theGreatPalaceChannel4Measure3

theGreatPalaceChannel4Measure11:
	incCoda
; Measure 4
	volbeat f 1 r 1 c 1 f 1 r 3 c 1

	gotoCond 16 theGreatPalaceChannel4Measure3
	goto theGreatPalaceChannel4Measure11

theGreatPalaceChannel4Measure22
; Measure 22
	volbeat e 1 f 1 r 1 gs 1 r 1 b 1 r 2

	goto theGreatPalaceChannel4Measure3Reset

theGreatPalaceChannel6:
    .redefine BEAT 12
; Measure 1-2
	vol $0
	beat r 8
theGreatPalaceChannel6Measure3Reset:
	beat r 8
	resetCoda
	vol $5
theGreatPalaceChannel6Measure3:
	incCoda
; Measure 3-21
	beat $2a 3 $2a 3 $2a 2

	gotoCond 19 theGreatPalaceChannel6Measure3Reset
	goto theGreatPalaceChannel6Measure3
    cmdff