lightWorldDungeonStart:
; BPM = 150, Quarter = 24
lightWorldDungeonChannel1:
	resetCoda
	.redefine BEAT 6	;sixteenth
lightWorldDungeonChannel1Measure1:
	incCoda	
; Measure 1
; 9/8
	octave 4
	vol $6
	duty $03
	beat cs 5 od g 5 fs 4 ou fs 4
; Measure 2-4
; 4/4 x2 + 7/8
	beat c 4 
	
	gotoCond 2 lightWorldDungeonChannel1Measure6b

;	beat c 42
	beat c 10
	vol $4
	beat c 14
	vol $3
	beat c 11
	vol $2
	beat c 7

	goto lightWorldDungeonChannel1Measure1		; 4 bytes

lightWorldDungeonChannel1Measure6b:
; Measure 6b-8
;	beat d 42
	beat d 10
	vol $4
	beat d 14
	vol $3
	beat d 11
	vol $2
	beat d 7
; Measure 9
; 9/8
	vol $6
	beat ds 5 e 5 f 4 a 4
; Measure 10-12
; 4/4 x2 + 7/8
	beat gs 4 c 4

;	beat od b 38
	beat od b 10
	vol $4
	beat b 14
	vol $3
	beat b 11
	vol $2
	beat b 3
; Measure 13
; 3/4
	vol $6
	octaveu
	beat g 4 fs 4 od as 4
; Measure 14
; 3/4
	beat a 12
; Measure 15
; 3/4
	octaveu
	beat f 4 e 4 od gs 4
; Measure 16
; 3/4
	beat g 11 r 1
; Measure 17
	beat g 2 fs 2 ou c 2 od b 2
	beat ou f 2 e 2 as 2 a 2
; Measures 18-19
	beat ds 16 r 18

lightWorldDungeonChannel1Measure20:
	octave 4
	vol $6
	duty $02
	vibrato $00
; Measure 20-21
.rept 2
	beat cs 2 d 2 a 4
.endr
	beat cs 2 d 2 a 10 r 2	
; Measure 22-23
.rept 2
	beat c 2 cs 2 gs 4
.endr
	beat c 2 cs 2 gs 10 r 2
; Measure 24-25
.rept 2
	beat od b 2 ou c 2 g 4
.endr
	beat od b 2 ou c 2 g 10	r 2
; Measure 26-27
	vol $5
.rept 2
	beat c 2 cs 2 gs 4
.endr
	beat c 2 cs 2 gs 10

; Measure 28
	octave 4
	duty $01
	vibrato $01
	beat a 12 gs 2 a 2
; Measure 29
	beat b 12 a 2 gs 2
; Measure 30-31
	beat cs 26 r 2
.redefine BEAT 8
	beat cs 1 c 1 cs 1
.redefine BEAT 6
; Measure 32
	beat g 12 fs 2 g 2
; Measure 33
	beat a 12 g 2 fs 2
; Measure 34-35
	octaved
	beat b 26 r 2
.redefine BEAT 8
	beat b 1 as 1 b 1
; Measure 36
	beat as 8 ou c 1
	beat f 1 fs 1 ou cs 1
.redefine BEAT 6
; Measure 37
	beat c 12 od gs 4
; Measure 38-39
	octaveu
	beat c 2 od b 22 e 8
; Measure 40
	beat ds 10 c 2
.redefine BEAT 8
	beat d 1 e 1 ou ds 1
; Measure 41
	beat d 9 od as 3
; Measure 42-43
	beat a 24
.redefine BEAT 6
	beat r 2

	goto lightWorldDungeonChannel1Measure20
	cmdff



lightWorldDungeonChannel0:
	resetCoda
	.redefine BEAT 6
lightWorldDungeonChannel0Measure1:
	incCoda	
; Measure 1
; 9/8

	octave 4
	vol $3
	duty $03
	env $2 $00

	beat r 3
	beat cs 5 od g 5 fs 4 ou fs 4
; Measure 2-4
; 4/4 x2 + 7/8
	beat c 4

	gotoCond 2 lightWorldDungeonChannel0Measure6b

	env $0 $00
;	beat g 39
	beat od g 11
;	vol $3
	beat g 10
	vol $2
	beat g 11
	vol $1
	beat g 7

	goto lightWorldDungeonChannel0Measure1		; 4 bytes

lightWorldDungeonChannel0Measure6b:
; Measure 6b-8
	octave 4
	beat d 1
;	beat a 36
	env $0 $00
	beat od a 10
;	vol $3
	beat a 10
	vol $2
	beat a 11
	vol $1
	beat a 7

; Measure 9
; 9/8
	vol $3
	env $2 $00
	beat r 3
	octave 4
	beat ds 5 e 5 f 4 a 4
; Measure 10-12
; 4/4 x2 + 7/8
	beat gs 4 c 4
	beat od b 1

	env $0 $00
;	beat fs 34
	beat fs 13
;	vol $3
	beat fs 10
	vol $2
	beat fs 8
	vol $1
	beat fs 3

; Measure 13
; 3/4
	vol $3
	env $2 $00
	octave 4
	beat r 3
	beat g 4 fs 4 od as 4
; Measure 14
; 3/4
	beat a 1 e 8 r 3
; Measure 15
; 3/4
	beat ou f 4 e 4 od gs 4
; Measure 16
; 3/4
	beat g 1 d 8 r 3
; Measure 17
	beat g 2 fs 2 ou c 2 od b 2
	beat ou f 2 e 2 as 2 a 2
; Measures 18-19
	beat od ds 13 r 16

lightWorldDungeonChannel0Measure20:
; Measurese 20-27
;	vol $0
;	duty $02
;.redefine BEAT 1
;.rept 3
;	beat r 255
;.endr
;	beat r 3



	octave 4
	vol $3
	duty $02
	vibrato $00
	env $2 $00
; Measure 20-21
	beat r 5
.rept 2
	beat cs 2 d 2 a 4
.endr
	beat cs 2 d 2 a 1 r 11	
; Measure 22-23
.rept 2
	beat c 2 cs 2 gs 4
.endr
	beat c 2 cs 2 gs 1 r 11
; Measure 24-25
.rept 2
	beat od b 2 ou c 2 g 4
.endr
	beat od b 2 ou c 2 g 1 r 11
; Measure 26-27
.rept 2
	beat c 2 cs 2 gs 4
.endr
	beat c 2 cs 2 gs 1




.redefine BEAT 6
	vol $4
	env $0 $00
; Measure 28-29
	beat r 8
.rept 2
	beat cs 2 d 2 a 4
.endr
	beat cs 2 d 2 a 10 r 2	
; Measure 30-31
.rept 2
	beat c 2 cs 2 gs 4
.endr
	beat c 2 cs 2 gs 10 r 2
; Measure 32-33
.rept 2
	beat od b 2 ou c 2 g 4
.endr
	beat od b 2 ou c 2 g 10	r 2

; Measure 34-35
.rept 2
	beat od as 2 b 2 ou fs 4
.endr
	beat od as 2 b 2 ou fs 10 r 2	
; Measure 36-37
	octaveu
.rept 2
	beat od f 2 fs 2 ou cs 4
.endr
	beat od f 2 fs 2 ou cs 10 r 2	
; Measure 38-39
.rept 2
	beat od e 2 f 2 ou c 4
.endr
	beat od e 2 f 2 ou c 10 r 2	
; Measure 40-41
.rept 2
	beat od g 2 gs 2 ou ds 4
.endr
	beat od g 2 gs 2 ou ds 10 r 2	
; Measure 42-43
.rept 2
	beat od gs 2 a 2 ou e 4
.endr
	beat od gs 2 a 2 ou e 10

	goto lightWorldDungeonChannel0Measure20
	cmdff


lightWorldDungeonChannel4:
	resetCoda
	.redefine BEAT 6
lightWorldDungeonChannel4Measure1:
	incCoda	
; Measure 1
; 9/8
	octave 3
	duty $08
	beat gs 5 d 5 cs 4 ou cs 4
; Measure 2-4
; 4/4 x2 + 7/8
	beat od g 4 
	
	gotoCond 2 lightWorldDungeonChannel4Measure6b

	beat g 4 r 38

	goto lightWorldDungeonChannel4Measure1		; 4 bytes

lightWorldDungeonChannel4Measure6b:
; Measure 6b-8
	beat a 4 r 38
; Measure 9
; 9/8
	beat as 5 b 5 ou c 4 e 4
; Measure 10-12
; 4/4 x2 + 7/8
	beat ds 4 od g 4 fs 4 r 34
; Measure 13
; 3/4
;	duty $08
	octaveu
	beat d 4 cs 4 od fs 4
; Measure 14
; 3/4
	beat e 4 r 8
; Measure 15
; 3/4
	octaveu
	beat cs 4 od b 4 ds 4
; Measure 16
; 3/4
	beat d 4 r 8
; Measure 17
	beat d 2 cs 2 g 2 fs 2
	beat ou c 2 od b 2 ou f 2 e 2

lightWorldDungeonChannel4Measure18:
;Coda 2
	incCoda
; Measures 18-19
	octave 2
	duty $0e
	beat b 1
	duty $0f
	beat b 1

	gotoCond 18 lightWorldDungeonChannel4MeasureBReset
	goto lightWorldDungeonChannel4Measure18

lightWorldDungeonChannel4MeasureBReset:
	resetCoda
lightWorldDungeonChannel4MeasureB:
;Coda 0,64
	incCoda
; Measures 20-21,28-29
	octave 2
	duty $0e
	beat b 1
	duty $0f
	beat b 1

	gotoCond $10 lightWorldDungeonChannel4MeasureAs
	gotoCond $50 lightWorldDungeonChannel4MeasureAs
	goto lightWorldDungeonChannel4MeasureB

lightWorldDungeonChannel4MeasureAs:
;Coda 16,80
	incCoda
; Measures 22-23,30-31
	octave 2
	duty $0e
	beat as 1
	duty $0f
	beat as 1

	gotoCond $20 lightWorldDungeonChannel4MeasureA
	gotoCond $40 lightWorldDungeonChannel4MeasureB
	gotoCond $60 lightWorldDungeonChannel4MeasureA
	goto lightWorldDungeonChannel4MeasureAs

lightWorldDungeonChannel4MeasureA:
;Coda 32,96
	incCoda
; Measures 24-25,32-33
	octave 2
	duty $0e
	beat a 1
	duty $0f
	beat a 1

	gotoCond $30 lightWorldDungeonChannel4MeasureAs
	gotoCond $70 lightWorldDungeonChannel4MeasureGs
	goto lightWorldDungeonChannel4MeasureA

lightWorldDungeonChannel4MeasureGs:
;Coda 112
	incCoda
; Measures 34-35
	octave 2
	duty $0e
	beat gs 1
	duty $0f
	beat gs 1

	gotoCond $80 lightWorldDungeonChannel4MeasureDs
	goto lightWorldDungeonChannel4MeasureGs

lightWorldDungeonChannel4MeasureDs:
;Coda 128
	incCoda
; Measures 36-37
	octave 3
	duty $0e
	beat ds 1
	duty $0f
	beat ds 1

	gotoCond $90 lightWorldDungeonChannel4MeasureD
	goto lightWorldDungeonChannel4MeasureDs

lightWorldDungeonChannel4MeasureD:
;Coda 144
	incCoda
; Measures 38-39
	octave 3
	duty $0e
	beat d 1
	duty $0f
	beat d 1

	gotoCond $a0 lightWorldDungeonChannel4MeasureF
	goto lightWorldDungeonChannel4MeasureD

lightWorldDungeonChannel4MeasureF:
;Coda 160
	incCoda
; Measures 38-39
	octave 3
	duty $0e
	beat f 1
	duty $0f
	beat f 1

	gotoCond $b0 lightWorldDungeonChannel4MeasureFs
	goto lightWorldDungeonChannel4MeasureF

lightWorldDungeonChannel4MeasureFs:
;Coda 180
	incCoda
; Measures 38-39
	octave 3
	duty $0e
	beat fs 1
	duty $0f
	beat fs 1

	gotoCond $c0 lightWorldDungeonChannel4MeasureBReset
	goto lightWorldDungeonChannel4MeasureFs

.define lightWorldDungeonChannel6 MUSIC_CHANNEL_FALLBACK EXPORT