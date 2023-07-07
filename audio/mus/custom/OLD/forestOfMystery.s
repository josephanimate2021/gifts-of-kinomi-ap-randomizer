forestOfMysteryStart:
; BPM = 140
	tempo 140
forestOfMysteryChannel1:
.redefine BEAT 1
.redefine CHANNEL 1
.redefine HI_VOL $5
.redefine LO_VOL $4
; Measure 1
	vol $0
	beat g3 E1
forestOfMysteryChannel1Reset:
	resetCoda
forestOfMysteryChannel1Measure1:
;Coda == 0,1
	incCoda

	octave 4
	vol HI_VOL
	env $2 $05
	duty $01
	vibrato $00
.rept 2
	beat b E2 b E1 b E2 r E1
.endr
; Measure 2a
	beat b E2 b E1 b E2+E1
	octaveu
	octaveu
	beat b S3 a S4 b Q r E1

	gotoCond 0+1 forestOfMysteryChannel1Measure1

; Coda == 2
; Measure 5a
	octave 6
	beat b E2 b E1 b E2
	beat b E1 f E2+E1 f E2 + E1
; Measure 6a
	beat e E2 e S1 d S2
	beat e E2+Q r Q + E1
; Measure 7a
	beat a E2 a E1 a E2
	beat a E1 e E2+E1 e E2 + E1
; Measure 8a
	beat d E2 d S1 c S2
	beat d E2+Q r Q + E1
; Measure 9a
	beat g E2 g E1 g E2
	beat g E1 c E2+E1 c E2+E1

	beat d E2 e E1 f E2 r E1
	beat e E2 f E1
; Measure 9d-12
	env $2 $00
	vibrato $e1
	beat g E2 + HF+E1+S3
	env $0 $00
	vibrato $01
	vol LO_VOL
	beat g S4+Q + HF+E1 r E2+Q + E1

	goto forestOfMysteryChannel1Reset
	cmdff

forestOfMysteryChannel0:
.redefine BEAT 1
.redefine CHANNEL 0
.redefine HI_VOL $5
.redefine LO_VOL $3
; Measure 1
	vol $0
	beat g3 E1
forestOfMysteryChannel0Reset:
	resetCoda
forestOfMysteryChannel0Measure1:
;Coda == 0,1
	incCoda

	octave 4
	vol HI_VOL
	env $2 $05
	duty $01
	vibrato $00
.rept 2
	beat gs E2 gs E1 gs E2 r E1
.endr
; Measure 2a
	beat a E2 a E1 a E2+E1 r E2+Q+E1
	vol $0
	gotoCond 0+1 forestOfMysteryChannel0Measure1

forestOfMysteryChannel0Measure5:
; Coda == 2-3,7
	incCoda
; Measure 5-6,11-12
	octave 4
	vol LO_VOL
	vibrato $01
	duty $00
	beat g E2 g E1 g E2
	vol HI_VOL
	beat g E1
	vol LO_VOL
	beat g E2 g E1 g E2 r E1
	vol $0


	gotoCond 2+2 forestOfMysteryChannel0Measure7
	gotoCond 7+2 forestOfMysteryChannel0Reset
	goto forestOfMysteryChannel0Measure5

forestOfMysteryChannel0Measure7:
; Coda == 4,5,6
	incCoda
; Measure 7-8,10
	vol LO_VOL
	duty $02
	beat f E2 f E1 f E2
	vol HI_VOL
	beat f E1
	vol LO_VOL
	beat f E2 f E1 f E2 r E1

	gotoCond 4+1 forestOfMysteryChannel0Measure7
	gotoCond 6+1 forestOfMysteryChannel0Measure5
; Coda == 6
; Measure 9
	vol LO_VOL
	duty $02
	beat ds E2 ds E1 ds E2
	vol HI_VOL
	beat ds E1
	vol LO_VOL
	beat ds E2 ds E1 ds E2 r E1

	goto forestOfMysteryChannel0Measure7
	cmdff

forestOfMysteryChannel4:
.redefine CHANNEL 4
.redefine HI_VOL $07
.redefine LO_VOL $08

forestOfMysteryChannel4Reset:
resetCoda
forestOfMysteryChannel4Measure1:
; Coda == 0,1
incCoda
; Measure 1,3
	octave 3
	duty HI_VOL
	beat e Q+E1
	duty LO_VOL
	beat e E2+Q
	duty HI_VOL
	beat od b E1+S3
	duty LO_VOL
	beat b S4
; Measure 2,4
	octaveu
	duty HI_VOL
	beat f Q+E1
	duty LO_VOL
	beat f E2
	duty HI_VOL
	beat c Q+E1
	duty LO_VOL
	beat c E2	

	gotoCond 0+1 forestOfMysteryChannel4Measure1

; Measure 5
	octave 3
	duty HI_VOL
	beat g HF+E1+S3
	duty LO_VOL
	beat g S4+E1 r E2
	;	HF = Q+E1 + E2
	;	Q = E1+S3 + S4
	;	E1 = S1+T3 + T4
; Measure 6
	duty HI_VOL
	beat c HF+E1+S3
	duty LO_VOL
	beat c S4+E1 r E2
; Measure 7
	duty HI_VOL
	beat f HF+E1+S3
	duty LO_VOL
	beat f S4+E1 r E2
; Measure 8
	octaved
	duty HI_VOL
	beat as HF+E1+S3
	duty LO_VOL
	beat as S4+E1 r E2
; Measure 9
	duty HI_VOL
	beat gs HF+E1+S3
	duty LO_VOL
	beat gs S4+E1 r E2
; Measure 10
	duty HI_VOL
	beat as HF+E1+S3
	duty LO_VOL
	beat as S4+E1 r E2
; Measure 11-12
	octaveu
	duty HI_VOL
	beat c HF+E1+S3
	duty LO_VOL
	beat c S4+Q + HF+Q+E1 r E2

	goto forestOfMysteryChannel4Reset

forestOfMysteryChannel6:
	cmdff