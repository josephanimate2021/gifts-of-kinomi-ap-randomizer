gerudoValleyStart
; BPM = 129 B = 28
gerudoValleyChannel1:
	.redefine BEAT 7		;Sixteenth
	resetCoda

; Measures 1-3
	vol $0
	beat r 1
	vol $7
	duty $01
	env $0 $04
	octave 3

	beat d 1 gs 1
	beat b 2 ou d 2 fs 2
	beat f 1 gs 1 b 1

	beat ou cs 36

	.redefine NOTE_END_WAIT 3/7
gerudoValleyChannel1Measure4:
; Measures 4-5
	octave 4
	;vol $7
	beat fs 1
	vol $6
	beat fs 1 fs 1
	beat fs 2 fs 2 fs 1
	vol $8

	incCoda
	gotoCond $04 gerudoValleyChannel1Measure6
	goto gerudoValleyChannel1Measure4

gerudoValleyChannel1Measure6:
; Measure 6
	beat e 1
	vol $6
	beat e 1 e 1
	beat e 2 e 2 e 1
	vol $8

	incCoda 
	gotoCond $05 gerudoValleyChannel1Measure6

gerudoValleyChannel1Measure7:
; Measure 7
	beat f 1
	vol $6
	beat f 1 f 1
	beat f 2 f 2 f 1
	vol $8

	incCoda
	gotoCond $07 gerudoValleyChannel1Measure7

	.redefine NOTE_END_WAIT 0
	resetCoda
gerudoValleyChannel1Measure8:
; Measure 8		Coda = $08
	octave 4
	vol $0
	beat r 1
	vol $8
	beat cs 1 fs 1 gs 1
	beat a 3 cs 1 fs 1 gs 1
	beat a 6
; Measure 9
	beat r 1 d 1 fs 1 gs 1
	beat a 3 d 1 fs 1 gs 1
	beat a 6	
; Measure 10
	beat r 1 od b 1 ou e 1 fs 1
	beat gs 3 od b 1 ou e 1 fs 1
	beat gs 6
; Measure 11
	beat r 1
	
	gotoCond $01 gerudoValleyChannel1Measure15

	beat fs 1 gs 1 fs 1 f 12
; Measure 12
	vol $0
	duty $02
	env $0 $00
	vibrato $01

	incCoda
	goto gerudoValleyChannel1Measure8

gerudoValleyChannel1Measure15:
; Measure 15
	octave 4
	beat a 1 b 1 a 1
	vibrato $82
	beat gs 12

gerudoValleyChannel1Measure16:
	beat r 2
	vibrato $00
	duty $01
	env $0 $04
; Measure 16	Coda = $01
	octave 4
	vol $8
	beat cs 3 a 3 gs 3 fs 3 cs 2
; Measure 17
	beat e 4 e 1 fs 1 e 1 d 7

	gotoCond $02 gerudoValleyChannel1Measure22

	beat r 4
; Measure 18
	beat od b 3 ou gs 3 fs 3 e 3 d 2
; Measure 19
	beat cs 4 d 1 e 1 d 1 cs 9

	incCoda
	goto gerudoValleyChannel1Measure16

gerudoValleyChannel1Measure22:
; Measure 21d
	octave 4
	env $0 $00
	vibrato $01
	beat d 2
; Measures 22-23
	vibrato $82
	beat e 6 fs 2 e 6 d 2
	vibrato $e2
	beat cs 16 r 2
	vibrato $00
; Measure 24
	env $0 $04
	beat a 3 gs 3 a 3 gs 3 cs 2
; Measure 25
	beat e 5 d 1 cs 1 d 11
; Measure 26
	beat gs 3 fs 3 gs 3 e 3 d 2
; Measure 27
	beat cs 4 d 1 e 1 d 1 cs 11

; Measure 28
	octave 3
	beat fs 1 gs 1 a 1 ou cs 3
	beat od fs 1 gs 1 a 1 ou cs 7
; Measure 29
	beat od fs 1 gs 1 a 1 ou d 3
	beat od fs 1 gs 1 a 1 ou d 3
	env $0 $00
	vibrato $01
	beat d 2
; Measures 30-31
	vibrato $82
	beat od b 6 ou gs 2 fs 6 od b 2
	vibrato $e2
	beat ou cs 16
	vibrato $01

gerudoValleyChannel1Measure32:
; Measure 32		Coda = $02
	octave 4
	duty $02
	beat a 1 gs 1
	vibrato $82
	beat a 8
	vibrato $01
	beat fs 1 gs 1
	beat a 1 b 1 a 1 gs 1
; Measure 33
	beat a 1 gs 1
	vibrato $e2
	beat a 12 r 2
	vibrato $01

	gotoCond $03 gerudoValleyChannel1Measure38

; Measure 34
	beat gs 1 fs 1
	vibrato $82
	beat gs 8 
	vibrato $01
	beat e 1 fs 1
	beat gs 1 a 1 gs 1 fs 1
; Measure 35
	beat gs 1 fs 1
	vibrato $e2
	beat f 12 r 2
	vibrato $01

	incCoda
	goto gerudoValleyChannel1Measure32

gerudoValleyChannel1Measure38:
; Measure 38
	octave 4
	beat b 1 a 1
	vibrato $82
	beat b 8
	vibrato $01
	beat gs 1 a 1
	beat b 1 ou cs 1 d 1 e 1
; Measure 39
	beat cs 1 d 1
	vibrato $e2
	beat cs 12 r 2
	vibrato $00

; Measure 40
	octave 4
	duty $01
	env $0 $04
.rept 2
	beat fs 2 a 1 gs 3 a 2
.endr
; Measure 41
.rept 2
	beat d 2 a 1 gs 3 a 2
.endr
; Measure 42
.rept 2
	beat e 2 b 1 as 3 b 2
.endr
; Measure 43
	beat ou d 1 e 1 d 1 cs 13

	resetCoda
	goto gerudoValleyChannel1Measure8
	cmdff


gerudoValleyChannel0:
	.redefine BEAT 7		;Sixteenth

; Measures 1-3
	duty $01
	env $0 $04
	vol $7
	octave 3
	beat cs 9

	beat gs 1 ds 1 d 1
	beat cs 36

	resetCoda
gerudoValleyChannel0MeasureA:		;a
	octave 3
; Measure 4		(14 bytes)
	beat a 1
	vol $6
	beat a 1 a 1
	beat a 2 a 2 a 1
	vol $8

	beat a 1
	vol $6
	beat a 1 a 1
	beat a 2 a 2 a 1
	vol $8

	incCoda 
	gotoCond $01 gerudoValleyChannel0MeasureD4


gerudoValleyChannel0MeasureFs:		;fs
	octave 3
; Measure 9
	beat fs 1
	vol $6
	beat fs 1 fs 1
	beat fs 2 fs 2 fs 1
	vol $8

	beat fs 1
	vol $6
	beat fs 1 fs 1
	beat fs 2

	gotoCond $09 gerudoValleyChannel0Measure22

	beat fs 2 fs 1
	vol $8

gerudoValleyChannel0MeasureGs:		;gs
	octave 3
; Measure 10
	beat gs 1
	vol $6
	beat gs 1 gs 1
	beat gs 2 gs 2 gs 1
	vol $8

	beat gs 1
	vol $6
	beat gs 1 gs 1
	beat gs 2 gs 2 gs 1
	vol $8

	gotoCond $07 gerudoValleyChannel0MeasureB
	gotoCond $0f gerudoValleyChannel0MeasureB

gerudoValleyChannel0MeasureF:		;f (es)
	octave 3
; Measure 11
	env $0 $04
	beat f 1
	vol $6
	beat f 1 f 1
	beat f 2 f 2 f 1
	vol $8

	beat f 1
	vol $6
	beat f 1 f 1
	beat f 2 f 2 f 1
	vol $8

	gotoCond $0a gerudoValleyChannel0MeasureCs
	gotoCond $0e gerudoValleyChannel0Measure36
	goto gerudoValleyChannel0MeasureA



gerudoValleyChannel0MeasureD4:		;d
	octave 4
; Measure 5
	beat d 1
	vol $6
	beat d 1 d 1
	beat d 2 d 2 d 1
	vol $8

	incCoda 
	gotoCond $02 gerudoValleyChannel0MeasureD4

gerudoValleyChannel0MeasureB:		;b
	octave 3
; Measure 6
	beat b 1
	vol $6
	beat b 1 b 1
	beat b 2 b 2 b 1
	vol $8

	gotoCond $0e gerudoValleyChannel0MeasureA

	beat b 1
	vol $6
	beat b 1 b 1
	beat b 2 b 2 b 1
	vol $8

	gotoCond $07 gerudoValleyChannel0MeasureA
	gotoCond $0f gerudoValleyChannel0MeasureAReset

gerudoValleyChannel0MeasureCs4:		;cs
	octave 4
; Measure 7
	beat cs 1
	vol $6
	beat cs 1 cs 1
	beat cs 2 cs 2 cs 1
	vol $8

	incCoda 
	gotoCond $04 gerudoValleyChannel0MeasureCs4

	goto gerudoValleyChannel0MeasureA

gerudoValleyChannel0MeasureCs:		;cs
	octave 3
; Measure 28
	beat cs 1
	vol $6
	beat cs 1 cs 1
	beat cs 2 cs 2 cs 1
	vol $8

	incCoda 
	gotoCond $0b gerudoValleyChannel0MeasureCs

gerudoValleyChannel0MeasureD:		;d
	octave 3
; Measure 29
	beat d 1
	vol $6
	beat d 1 d 1
	beat d 2

	gotoCond $0d gerudoValleyChannel0Measure30

	beat d 2 d 1
	vol $8

	incCoda 
	goto gerudoValleyChannel0MeasureD


gerudoValleyChannel0Measure22:
	octave 3
; Measure 21c
	.redefine NOTE_END_WAIT 4/7
	beat fs 1
	vol $8
	env $0 $00
	beat a 2
; Measure 22
	vibrato $81
	beat b 6 b 2 b 6 gs 2
	vibrato $00

	goto gerudoValleyChannel0MeasureF

gerudoValleyChannel0Measure30:
	octave 3
; Measure 29c
	.redefine NOTE_END_WAIT 4/7
	beat d 1
	vol $8
	env $0 $00
	beat a 2
; Measure 30
	vibrato $81
	beat gs 6 ou e 2 d 6 od gs 2	
	vibrato $00

	goto gerudoValleyChannel0MeasureF

gerudoValleyChannel0Measure36:
; Measure 36
	.redefine NOTE_END_WAIT 0
	octave 4
	env $0 $00
	beat cs 1 od b 1
	vibrato $81
	beat ou cs 8
	vibrato $00
	beat od a 1 b 1 ou cs 1 d 1 cs 1 od b 1
; Measure 37
	beat ou cs 1 od b 1
	vibrato $82
	beat ou cs 9
	vibrato $00

	env $0 $04
	vol $6
	beat od fs 2 fs 2 fs 1
	vol $8
; Measure 38
	octave 4
	env $0 $00
	beat d 1 cs 1
	vibrato $81
	beat d 8
	vibrato $00
	beat od b 1 ou c 1 d 1 e 1 fs 1 gs 1
; Measure 39
	beat f 1 fs 1
	vibrato $82
	beat f 6
	vibrato $00
	env $0 $04

	goto gerudoValleyChannel0MeasureB

gerudoValleyChannel0MeasureAReset:
	resetCoda
	incCoda
	incCoda
	incCoda
	incCoda
	incCoda
	goto gerudoValleyChannel0MeasureA
	cmdff

gerudoValleyChannel4:
	.redefine BEAT 1
; Measures 1-3
	beat r 255 r 81

gerudoValleyChannel4Measure4:
; Measure 4
	octave 2
	duty $0e
.rept 2
	beat fs 24 r 4
	beat fs 14 r 14
.endr

; Measure 5
.rept 2
	beat d 24 r 4
	beat d 14 r 14
.endr

; Measure 6
.rept 2
	beat e 24 r 4
	beat e 14 r 14
.endr

; Measure 7
	octave 3
.rept 2
	beat cs 24 r 4	
	beat cs 14 r 14
.endr

	goto gerudoValleyChannel4Measure4
	cmdff


gerudoValleyChannel6:
	.redefine BEAT 7
	resetCoda

; Measure 1
	beat r 16
gerudoValleyChannel6Measure2:
; Measures 2-7
.rept 2
	vol $7
	beat $24 1
	vol $5
	beat $24 1 $24 1
.endr
	vol $7
	beat $24 1
	vol $5
	beat $24 1

	vol $7
.rept 2
	beat $24 1
	vol $5
	beat $24 1 $24 1
	vol $7
	beat $24 1
.endr

	incCoda
	gotoCond $05 gerudoValleyChannel6Measure8
	goto gerudoValleyChannel6Measure2

gerudoValleyChannel6Measure8:
; Measures 8-43
.rept 2
	vol $7
	beat $24 1
	vol $5
	.rept 3
		beat $24 1
	.endr
.endr

	vol $7
	beat $24 1
	vol $5
	.rept 5
		beat $24 1
	.endr

	vol $7
	beat $24 1
	vol $5
	beat $24 1

	goto gerudoValleyChannel6Measure8
	cmdff