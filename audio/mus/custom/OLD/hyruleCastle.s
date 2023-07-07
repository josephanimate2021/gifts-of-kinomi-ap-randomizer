hyruleCastleStart:
; BPM = 100 (B=36)
hyruleCastleChannel1:
	.redefine BEAT 1
	resetCoda

; Measures 1-2 (Eighth Note Pickup and Full Measure)
	vol $0	;temp
	beat r 42
	octave 5
	duty $02
	vol $8
	.redefine NOTE_END_WAIT 3
	beat d 6 d 6
	.redefine NOTE_END_WAIT 9
	beat d 18 c 18
	.redefine NOTE_END_WAIT 0
	vibrato $82
	beat d 36
	vibrato $00
	beat ds 27 fs 9
; Measure 3	
	vibrato $e2
	beat d 126
; Measures 4-5	BPM = 150 (B=36)
	beat r 222		;102+120
hyruleCastleChannel1Measure6:
; Measure 6
	vol $4
	octave 3
	duty $01
	env $0 $04
	beat g 24 g 12 f 24 f 12 g 24
; Measure 7
	beat g 12 g 12 g 6 g 6
	vol $5
	beat g 12 g 12 gs 12 fs 12

hyruleCastleChannel1Measure8:
; Measures 8,12,20
	vol $6
	octave 4
	duty $02
	env $0 $00
	beat g 36 fs 3 f 3 e 3 ds 3
	vibrato $e2
	beat d 84
; Measures 9,13,21
	vibrato $00
	beat g 12 gs 12 as 20 fs 8 as 8
; Measures 10,14,22
	beat g 36 fs 3 f 3 e 3 ds 3
	vibrato $e2
	beat d 84
; Measures 11,15,23
	vibrato $00
	duty $01
	env $0 $04
	octave 5
	beat d 6 d 6 f 12 f 12 
	beat ds 6 d 6 cs 6 c 6
	duty $02
	env $0 $00

	incCoda
	gotoCond $01 hyruleCastleChannel1Measure8
	gotoCond $03 hyruleCastleChannel1Measure24

; Measure 16
	octave 5
	beat c 36 od b 3 as 3 a 3 gs 3
	vibrato $e2
	beat g 84
; Measure 17
	vibrato $00
	beat ou c 12 f 16 ds 16 cs 8 od b 8
; Measure 18
	beat ou c 36 od b 3 as 3 a 3 gs 3
	vibrato $e2
	beat g 84
; Measure 19
	vibrato $00
	duty $01
	env $0 $04
	octave 5
	beat g 6 g 6 as 12 as 12
	beat gs 6 g 6 fs 6 f 6

	goto hyruleCastleChannel1Measure8

hyruleCastleChannel1Measure24:
; Measure 24,26
	octave 4
	beat f 32 ds 8 d 8
	beat c 12 ds 12 f 12 ou c 12
; Measure 25,27
	vibrato $e2
	beat od g 84 r 12
	vibrato $00

	incCoda
	gotoCond $04 hyruleCastleChannel1Measure24

; Measure 28 (Coda = $05)
	octave 4
	beat f 28 r 4 ds 8 d 8
	beat c 12 d 12 
	.redefine NOTE_END_WAIT 6
	beat f 12 g 12
	.redefine NOTE_END_WAIT 0
; Measure 29
	vol $7
	beat as 28 r 4 gs 8 g 8
	beat f 12 g 12 
	.redefine NOTE_END_WAIT 6
	beat gs 12 as 12
	.redefine NOTE_END_WAIT 0	
; Measure 30
	beat ou c 28 r 4 od as 8 a 8
	vol $8
	beat g 12 a 12 
	.redefine NOTE_END_WAIT 6
	beat as 12 ou c 12
	.redefine NOTE_END_WAIT 0
; Measure 31
	vol $9
	vibrato $e1
	beat d 84 r 12
	vibrato $00

; Measure 32
	octave 3
	vol $6
	duty $01
	beat g 48 r 12
	beat a 12 as 12 ou d 12
; Measure 33
	vibrato $e1
	beat cs 48 od a 48
; Measure 34
	vibrato $82
	beat ou c 48
	vibrato $00
	beat od as 16 fs 16 as 16
; Measure 35
	vibrato $e2
	beat g 96

; Measure 36
	octave 4
	vol $7
	vibrato $82
	beat g 48 r 12
	beat a 12 as 12 ou d 12
; Measure 37
	vibrato $e1
	beat cs 48 od a 48
; Measure 38
	vibrato $82
	beat ou c 48
	vibrato $00
	beat od as 16 fs 16 as 16
; Measure 39
	vibrato $e3
	beat g 96 

; Measure 40
	octave 5
	vol $8
	vibrato $82
	beat ds 24
	vibrato $00
	env $0 $04
	beat r 12 ds 6 ds 6
	beat ds 12 c 12 od g 12 ou ds 12
; Measure 41
	env $0 $00
	vibrato $e2
	beat d 84 r 12
; Measure 42
	vibrato $82
	beat c 24
	vibrato $00
	env $0 $04
	beat r 12 c 6 c 6
	beat c 12 od g 12 ds 12 ou c 12	
; Measure 43
	env $0 $00
	vibrato $e2
	beat od as 84 r 12
; Measure 44
	octave 5
	env $0 $00
	vibrato $82
	beat ds 30
	vibrato $00
	env $0 $04
	beat r 6 ds 6 ds 6
	beat ds 12 c 12 od g 12 ou ds 12
; Measure 45
	env $0 $00
	vibrato $82
	beat d 30
	vibrato $00
	env $0 $04	
	beat r 6 d 6 d 6
	beat d 12 od as 12 g 12 ou d 12
; Measure 46
	env $0 $00
	vibrato $82
	beat c 30
	vibrato $00
	env $0 $04
	beat r 6 c 6 c 6
	beat c 12 od fs 12 ds 12 ou c 12
; Measure 47
	env $0 $00
	vibrato $e2
	beat od as 108 r 96
	vibrato $00

	resetCoda
	goto hyruleCastleChannel1Measure6

	cmdff

hyruleCastleChannel0:
	.redefine BEAT 1
	resetCoda

; Measures 1-2 (Eighth Note Pickup and Full Measure)
	vol $0	;temp
	beat r 42
	octave 4
	duty $01
	vol $8
	.redefine NOTE_END_WAIT 3
	beat g 6 g 6
	.redefine NOTE_END_WAIT 9
	beat g 18 f 18
	.redefine NOTE_END_WAIT 0
	vibrato $82
	beat g 36
	vibrato $00
	beat gs 27 b 9
; Measure 3	
	vibrato $e2
	beat g 126	r 30
	vibrato $00

	env $0 $04
	vol $4
	octave 3
; Measure 4
	beat d 24
hyruleCastleChannel0Measure4a:
	vol $4
	beat d 12 c 24 c 12 d 24
; Measure 5
	vol $5
	beat d 12 d 12 d 6 d 6 
	beat d 12 d 12 ds 12 cs 24
; Measure 6
	vol $6
	beat d 24 d 12 c 24 c 12 d 24
; Measure 7
	vol $7
	beat d 12 d 12 d 6 d 6 
	vol $8
	beat d 12 d 12 ds 12 cs 24

hyruleCastleChannel0Measure8:
	vol $4
; Measure 8,12,20
	beat d 24 d 12 c 24 c 12 d 24
; Measure 9,13,21
	vol $5
	beat d 12 d 12
	vol $6
	beat d 6 d 6 
	beat d 12 d 12 ds 12 cs 24	
; Measure 10,14,22
	vol $4
	beat d 24 d 12 c 20
	octave 4
	vol $6
	beat g 4 a 4 as 4 ou c 4 d 24
; Measure 11,15,23
	beat d 12 d 12
	octave 3
	beat d 6 d 6 
	beat d 12 d 12 ds 12 cs 24

	incCoda
	gotoCond $01 hyruleCastleChannel0Measure8
	gotoCond $03 hyruleCastleChannel0Measure24

	vol $4
	octave 3
; Measure 16
	beat g 24 g 12 f 24 f 12 g 24
; Measure 17
	vol $5
	beat g 12 g 12
	vol $6
	beat g 6 g 6 
	beat g 12 g 12 gs 12 fs 24	
; Measure 18
	vol $4
	beat g 24 g 12 f 20
	octave 5
	vol $6
	beat c 4 d 4 ds 4 f 4
	env $0 $00
	vibrato $82
	beat g 36 r 12
; Measure 19
	vibrato $00
	env $0 $04
	octave 3
	beat g 6 g 6 
	beat g 12 g 12 gs 12 fs 24

	goto hyruleCastleChannel0Measure8

hyruleCastleChannel0Measure24:
; Measure 24,26
	beat r 108
	octave 5
	vol $6
; Measure 25,27
	beat d 4 d 4 d 8 d 8
	beat d 12 ds 12 f 8 ds 8 d 8
	vol $0
	beat r 12

	incCoda
	gotoCond $04 hyruleCastleChannel0Measure24

; Measure 28
	beat r 52
	vol $6
	beat f 4 f 4
.rept 3
	beat f 8
.endr
; Measure 29
	env $0 $00
	vibrato $81
	beat g 48 r 16
	vibrato $00
	env $0 $04

	beat g 4 g 4
	vol $7
.rept 3
	beat g 8
.endr
; Measure 30
	env $0 $00
	vibrato $81
	beat g 48 r 16
	vibrato $00
	env $0 $04

	beat g 4 g 4
	vol $8
.rept 3
	beat g 8
.endr
	vol $9
; Measure 31
	env $0 $00
	vibrato $82
	beat g 48 fs 48

hyruleCastleChannel1Measure32:
; Coda = $05
	vol $4
	octave 4
	env $0 $04
	duty $02

hyruleCastleChannel1Measure32a:
	incCoda
; Measure 32,35,36,39
	beat as 12 d 12 as 8 as 8 as 8
	gotoCond $09 hyruleCastleChannel1Measure39b
	beat as 12 d 12 as 12 d 12

	gotoCond $07 hyruleCastleChannel1Measure32a
	gotoCond $0a hyruleCastleChannel1Measure42		;exit loop

; Measure 33,37
	beat ou cs 12 od e 12 ou cs 8 cs 8 cs 8
	beat cs 12 od e 12 ou cs 12 od e 12

	gotoCond $09 hyruleCastleChannel1Measure32a

hyruleCastleChannel1Measure34:
; Measure 34,38
	beat ou c 12 od ds 12 ou c 8 c 8 c 8
	beat c 12 od ds 12 ou c 12 od ds 12

	goto hyruleCastleChannel1Measure32a


hyruleCastleChannel1Measure39b:
; Measure 39b
	duty $01
	vol $6
	octave 5
	beat d 12
	beat od od g 4 ou c 4 d 4
	vol $7
	beat ds 4 f 4 a 4
	vol $8
	beat as 4 ou c 4 d 4

	vol $5
	duty $02
	goto hyruleCastleChannel1Measure34

hyruleCastleChannel1Measure42:
; Measure 42
	octave 4
	beat g 12 c 12 g 8 g 8 g 8
	beat g 12 c 12 g 12 c 12
; Measure 43
	beat g 12 od as 12 ou g 8 g 8 g 8
	beat g 12 od as 12 ou g 12 od as 12

; Measure 44
	octave 4
	duty $01
	env $0 $00
	vibrato $82
	beat g 30
	vibrato $00
	env $0 $04
	beat r 6 g 6 g 6
	beat g 12 ds 12 c 12 g 12
; Measure 45
	env $0 $00
	vibrato $82
	beat f 30
	vibrato $00
	env $0 $04	
	beat r 6 f 6 f 6
	beat f 12 d 12 od as 12 ou f 12
; Measure 46
	env $0 $00
	vibrato $82
	beat ds 30
	vibrato $00
	env $0 $04
	beat r 6 ds 6 ds 6
	beat ds 12 c 12 od a 12 ou ds 12
; Measure 47
	env $0 $00
	vibrato $e2
	beat d 36
	vibrato $00

	env $0 $04
	resetCoda
	goto hyruleCastleChannel0Measure4a
	cmdff

hyruleCastleChannel4:
	.redefine BEAT 1
	octave 2

; Measures 1-2 (Eighth Note Pickup and Full Measure)
	beat r 6
	duty $0a
	beat g 3 r 3 g 3 r 3
	vibrato $82
	beat g 108
	vibrato $00
	beat gs 36
; Measure 3	
	vibrato $e2
	beat g 126 r 18

hyruleCastleChannel4Measure4a:
	resetCoda
	duty $14
hyruleCastleChannel4Measure4:
; Measure 4
	beat g 48 f 48
; Measure 5
	beat g 48 gs 24 fs 24

	incCoda
	gotoCond $06 hyruleCastleChannel4Measure16
	gotoCond $0a hyruleCastleChannel4Measure24
	goto hyruleCastleChannel4Measure4

hyruleCastleChannel4Measure16:
; Measure 4
	octave 3
	beat c 48 od as 48
; Measure 5
	beat ou c 48 cs 24 od b 24

	incCoda 
	gotoCond $08 hyruleCastleChannel4Measure4
	goto hyruleCastleChannel4Measure16


hyruleCastleChannel4Measure24:
; Coda == $09
	duty $0e
	octave 2
; Measures 24,26
	beat gs 32 ou ds 8 gs 8
	beat ou ds 12 r 24 od od gs 6 r 6
; Measure 25,27
	beat g 32 ou d 8 g 8
	beat ou d 32 od od g 6 r 2 g 8

	incCoda
	gotoCond $0b hyruleCastleChannel4Measure24

; Coda == $0c
; Measure 28
	beat as 32 ou ds 8 f 8
	beat as 36 od as 12
; Measure 29
	beat gs 32 ou d 8 ds 8
	beat gs 32
	.redefine NOTE_END_WAIT 2
	beat od gs 8 gs 8
	.redefine NOTE_END_WAIT 0
; Measure 30
	duty $0a
	beat a 32 ou ds 8 g 8
	beat a 36 od a 6 r 6
; Measure 31
	beat ou d 32 a 8 ou c 8
	beat d 32
	.redefine NOTE_END_WAIT 2
	beat od d 8 d 8

	.redefine NOTE_END_WAIT 0
	octave 2
hyruleCastleChannel4Measure32:
	incCoda
; Measure 32,35,36,39,44
.rept 6
	duty $0e
	beat g 6
	duty $0f
	beat g 5 r 1
.endr
.rept 3
	duty $0e
	beat g 4
	duty $0f
	beat g 3 r 1
.endr
	gotoCond $0e hyruleCastleChannel4Measure32
	gotoCond $10 hyruleCastleChannel4Measure40
	gotoCond $11 hyruleCastleChannel4Measure40

hyruleCastleChannel4Measure33:
; Measure 33,37,43,47
.rept 6
	duty $0e
	beat a 6
	duty $0f
	beat a 5 r 1
.endr
.rept 3
	duty $0e
	beat a 4
	duty $0f
	beat a 3 r 1
.endr
	gotoCond $10 hyruleCastleChannel4Measure32
	gotoCond $11 hyruleCastleChannel4Measure4a	;back to beginning

; Measure 34,38
.rept 6
	duty $0e
	beat fs 6
	duty $0f
	beat fs 5 r 1
.endr
.rept 3
	duty $0e
	beat fs 4
	duty $0f
	beat fs 3 r 1
.endr
	goto hyruleCastleChannel4Measure32

hyruleCastleChannel4Measure40:
; Measure 40,45
	octave 3
.rept 6
	duty $0e
	beat c 6
	duty $0f
	beat c 5 r 1
.endr
.rept 3
	duty $0e
	beat c 4
	duty $0f
	beat c 3 r 1
.endr
; Measure 41,46
	octaved
.rept 6
	duty $0e
	beat as 6
	duty $0f
	beat as 5 r 1
.endr
.rept 3
	duty $0e
	beat as 4
	duty $0f
	beat as 3 r 1
.endr
	goto hyruleCastleChannel4Measure33

	cmdff

hyruleCastleChannel6:
	.redefine BEAT 6
	octave 2

; Measures 1-2 (Eighth Note Pickup and Full Measure)
	beat r 1
	vol $6
.rept 2
	beat $2a 1
.endr
	beat $52 18
	vol $3
.rept 4
	beat $2a 1
.endr
	beat $2a 2
; Measure 3	
.rept 4
	beat $2a 1
.endr

vol $4
.rept 4
	beat $2a 1
.endr

vol $5
.rept 4
	beat $2a 1
.endr

vol $6
.rept 4
	beat $2a 1
.endr
.rept 2
	beat $2a 2
.endr
	beat $2a 4

	.redefine BEAT 6
hyruleCastleChannel6Measure4:
	vol $5
	resetCoda
hyruleCastleChannel6Measure4a:
; Measure 4
	beat $2a 2 $2a 4 $2a 2
	beat $2a 6 $2a 4
; Measure 5
.rept 2
	beat $2a 2
.endr
.rept 2	
	 beat $2a 1
.endr
.rept 4
	beat $2a 2
.endr

	incCoda
	gotoCond $0a hyruleCastleChannel6Measure24
	goto hyruleCastleChannel6Measure4a

hyruleCastleChannel6Measure24:
	.redefine BEAT 4
	vol $4
; Measure 24
	beat $2a 12
.rept 4
	beat $2a 3
.endr
; Measure 25
	beat $2a 8 
.rept 2
	beat $2a 2
.endr
.rept 2
	beat $2a 3
.endr
.rept 3
	beat $2a 2
.endr

	incCoda
	gotoCond $0e hyruleCastleChannel6Measure32
	goto hyruleCastleChannel6Measure24

hyruleCastleChannel6Measure32:
	.redefine BEAT 6
	vol $5
; Measure 32
	beat $2a 14
.rept 2
	beat $2a 1
.endr

	incCoda
	gotoCond $16 hyruleCastleChannel6Measure40
	goto hyruleCastleChannel6Measure32

hyruleCastleChannel6Measure40:
	.redefine BEAT 2
	vol $6
; Measure 40
	beat $2a 12 
.rept 3
	beat $2a 4
.endr
	beat $2a 18
.rept 2
	beat $2a 3
.endr

	incCoda
	gotoCond $1a hyruleCastleChannel6Measure44
	goto hyruleCastleChannel6Measure40

hyruleCastleChannel6Measure44:
; Measure 44
	beat $2a 12 $2a 6
.rept 2
	beat $2a 3
.endr
.rept 2
	beat $2a 6
.endr
.rept 3
	beat $2a 4
.endr

	incCoda
	gotoCond $1d hyruleCastleChannel6Measure4
	goto hyruleCastleChannel6Measure44
	cmdff
