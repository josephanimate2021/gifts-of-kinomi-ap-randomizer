kakarikoVillageStart:
; BPM 100, Quarter = 36, 3/4 time
kakarikoVillageChannel1:
	resetCoda
	.redefine BEAT 1

; Measure 1
	vol $0
	beat r 108

kakarikoVillageChannel1Measure2:
; Measures 2-3
	vol $0
	beat r 255 r 33
; Measure 4
kakarikoVillageChannel1Measure4c:
	vol $6
	duty $02
	octave 4
	vibrato $e1
.rept 2
	beat f 36
; Measure 5,9
	beat as 72 f 36
; Measure 6,10
	beat ou d 72 od as 36
; Measures 7-8,11-12
	beat ou f 177 r 3 od
.endr
	octave 5
	beat f 36
; Measure 13
	beat g 108
; Measure 14
	octave 4
	beat a 72 ou g 36
; Measure 15
	beat f 108
; Measures 16-17
	.redefine NOTE_END_WAIT 3
.rept 2
	beat d 108
.endr
; Measure 18
	.redefine NOTE_END_WAIT 0
	beat d 72 c 36
; Measures 19-20
	beat od as 177 r 3

	gotoCond $01 kakarikoVillageChannel1Measure21c
	incCoda
	goto kakarikoVillageChannel1Measure4c

kakarikoVillageChannel1Measure21c:
; Measure 21
	octave 4
	beat as 33 r 3
; Measure 22
	beat as 108
; Measure 23
	beat a 72 ou c 36
; Measure 24
	beat od as 108
; Measure 25
	beat f 108
; Measure 26
	beat ds 72 d 36
; Measure 27
	beat ds 72 f 36
; Measures 28-29
	beat d 180 as 33 r 3
; Measure 30
	beat as 108
; Measure 31
	beat a 72 ou c 36
; Measure 32
	beat od as 72 f 36
; Measure 33
	octave 5
	beat f 108
; Measure 34
	beat ds 108
; Measure 35
	beat d 72 c 36
; Measures 36-37
	beat od as 216

	resetCoda
	goto kakarikoVillageChannel1Measure2
	cmdff

kakarikoVillageChannel0:
kakarikoVillageChannel0Measure1:
	resetCoda
	.redefine BEAT 1

	octave 2
	duty $01
	env $0 $04
	vol $6
; Measure 1,37
	beat as 18 ou f 18 as 18
	beat ou d 18 od as 18 f 18
	
	vol $5
	octave 2
; Measure 2
	beat g 18 ou d 18 g 18
	beat as 18 g 18 d 18
; Measure 3
	beat c 18 g 18 as 18
	beat ou f 18 od as 18 g 18
; Measure 4
	beat r 18 f 18 ou c 18
	beat ds 18 c 18 od a 18

kakarikoVillageChannel0Measure5:
	octave 3
; Measure 5
	beat r 18 f 18 as 18
	beat ou d 18 od as 18 f 18
; Measure 6
	beat r 18 d 18 g 18
	beat as 18 g 18 d 18
; Measure 7
	beat r 18 g 18 as 18
	beat ou f 18 od as 18 g 18
; Measure 8
	beat r 18 f 18 ou c 18
	beat ds 18 c 18 od a 18
; Measure 9
	beat r 18 f 18 as 18
	beat ou d 18 od as 18 f 18
; Measure 10
	beat r 18 d 18 g 18
	beat as 18 g 18 d 18
; Measure 11
	beat r 18 g 18 as 18
	beat ou f 18 od as 18 g 18
; Measure 12
	beat r 18 f 18 ou c 18
	beat ds 18 c 18 od a 18

; Measure 13
	octave 2
	beat r 18 as 18 ou
	.rept 2
		beat as 18 g 18
	.endr
; Measure 14
	beat r 18 c 18
	.rept 2
		beat a 18 f 18
	.endr	
; Measure 15
	beat r 18 f 18
	.rept 2
		beat as 18 f 18
	.endr
; Measure 16
	beat r 18 d 18
	.rept 2
		beat as 18 d 18
	.endr
; Measure 17
	beat r 18 g 18
	.rept 2
		beat as 18 g 18
	.endr
; Measure 18
	beat r 18 c 18
	.rept 2
		beat a 18 c 18
	.endr
; Measure 19
	beat r 18 f 18
	.rept 2
		beat as 18 f 18
	.endr
; Measure 20/21
	beat r 18 f 18
	.rept 2
		beat as 18 f 18
	.endr

	gotoCond $01 kakarikoVillageChannel0Measure22
	incCoda
	goto kakarikoVillageChannel0Measure5

kakarikoVillageChannel0Measure22:
; Measures 22-23,30-31
.rept 2
	octave 2
	beat r 18 as 18 ou
	.rept 2
		beat as 18 g 18
	.endr
.endr
; Measures 24-25,32-33
.rept 2
	beat r 18 f 18
	.rept 2
		beat as 18 f 18
	.endr
.endr
; Measure 26,34
	beat r 18 g 18
	.rept 2
		beat as 18 g 18
	.endr	
; Measure 27,35
	beat r 18 c 18
	.rept 2
		beat a 18 c 18
	.endr
; Measure 28,36
	beat r 18 f 18
	.rept 2
		beat as 18 f 18
	.endr

	gotoCond $02 kakarikoVillageChannel0Measure1

; Measure 29
	beat r 18 f 18
	.rept 2
		beat gs 18 f 18
	.endr

	incCoda
	goto kakarikoVillageChannel0Measure22
	cmdff

kakarikoVillageChannel4:
kakarikoVillageChannel4Measure1:
	resetCoda
	.redefine BEAT 1

; Measure 1-3
	beat r 255 r 69
; Measure 4
.redefine BEAT 36	;quarter
	duty $14
	octave 2
	beat f 3

kakarikoVillageChannel4Measure5:
; Measures 5-8,9-12
.rept 2
	beat as 3 g 3 ou c 3 od f 3
.endr
; Measures 13-16
	beat ds 3 f 3 as 3 g 3
; Measures 17-18
	beat ou c 3 od f 3
; Measure 19-20/21
	.redefine NOTE_END_WAIT 1
.rept 2
	beat as 3
.endr

	gotoCond $01 kakarikoVillageChannel4Measure22
	incCoda
	goto kakarikoVillageChannel4Measure5

kakarikoVillageChannel4Measure22:
;NOTE_END_WAIT == 1
; Measures 22-23
.rept 2
	beat ds 3
.endr
; Measures 24-25
.rept 2
	beat d 3
.endr
; Measures 26-28
	.redefine NOTE_END_WAIT 0
	octave 3
	beat c 3 od f 3 as 3

	gotoCond $02 kakarikoVillageChannel4Measure1

; Measure 29
	beat gs 3

	incCoda
	goto kakarikoVillageChannel4Measure22
	cmdff

kakarikoVillageChannel6:
	cmdff