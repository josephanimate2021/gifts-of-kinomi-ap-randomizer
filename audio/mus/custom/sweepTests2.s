sweepTestsStart:
	tempo 120

sweepTestsChannel0:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

	vol $6
	vibrato $00
	env $0 $00
	duty $02
	octave 3
/* ;Does nothing
	sweep $0 $0 $1
	beat d W
	sweep $1 $0 $1
	beat d W
	sweep $2 $0 $1
	beat d W	
	sweep $3 $0 $1
	beat d W
	sweep $4 $0 $1
	beat d W
	sweep $5 $0 $1
	beat d W
	sweep $6 $0 $1
	beat d W
	sweep $7 $0 $1
*/
/*
	beat d W	
	sweep $4 $0 $2
	beat d W
	sweep $4 $0 $3
	beat d W
	sweep $4 $0 $4
	beat d W
	sweep $4 $0 $5
	beat d W
	sweep $4 $0 $6
	beat d W
	sweep $4 $0 $7
	beat d W
*/
/*
	sweep $7 $0 $1
	beat d W	
	sweep $7 $0 $2
	beat d W
	sweep $7 $0 $3
	beat d W
	sweep $7 $0 $4
	beat d W
	sweep $7 $0 $5
	beat d W
	sweep $7 $0 $6
	beat d W
	sweep $7 $0 $7
	beat d W
*/
/*
sweep $0 $0 $7
loop:
	
	beat d HF ds HF e HF f HF
	;sweep $0 $0 $0
	goto loop
*/
	sweep $4 $0 $5

     .redefine HI_VOL $6
    .redefine LO_VOL $4

; Measure 1
    duty $02
    transpose 0
    goto fallingRainChannel1Measure1
; Measure 2
    transpose 1
    goto fallingRainChannel1Measure1
; Measure 3
    transpose 2
    goto fallingRainChannel1Measure1
; Measure 4
    transpose 3
    goto fallingRainChannel1Measure1
; Measure 5
    transpose -7
    goto fallingRainChannel1Measure1
; Measure 6
    transpose -6
    goto fallingRainChannel1Measure1
; Measure 7
    transpose -5
    goto fallingRainChannel1Measure1
; Measure 8
    transpose -4
    goto fallingRainChannel1Measure1

fallingRainChannel1Measure9Loop:
beginLoop 2
; Measure 9,17
    transpose 0
    vol HI_VOL
    vibrato $e1
    env $1 $00
    duty $02
    octave 4
    beat b HF+Q a E1 g E2
; Measure 10,18
    beat a W
; Measure 11,19
    octaveu
    beat d HF+Q c E1 od as E2
; Measure 12,20
    octaveu
    beat c W
; Measure 13-14,21-22
.rept 2
    octave 5
    beat c HF+Q od b E1 a E2
.endr
; Measure 15-16,23-24
    beat b W+W
breakOrLoop

; Measure 25-28
    goto fallingRainChannel1Measure25
; Measure 29
    beat f HF as Q
; Measure 30
    beat f Q e Q as Q
; Measure 31-32
    beat a HF+Q+Q+HF
; Measure 33-36
    goto fallingRainChannel1Measure25
; Measure 37
    octave 4
    beat g HF ou c Q
; Measure 38
    octaved
    beat g Q f Q g Q
; Measure 39
    beat a HF+Q
; Measure 40
    beat b HF+Q

    goto fallingRainChannel1Measure9Loop
    cmdff

fallingRainChannel1Measure1:
    vol $0
    beat gs3 Q
    vol HI_VOL
    env $1 $00
    vibrato $e1
    octave 4
    beat g Q+E1
    vibrato $01
    vol LO_VOL
    env $0 $00
    beat g E2+Q
    endSec

fallingRainChannel1Measure25:
; Measure 25-26
beginLoop 2
    octave 4
    beat a HF ou d Q
breakOrLoop
; Measure 27
    beat c HF od b E1 ou c E2
; Measure 28
    octaved
    beat a HF+Q
    endSec

	cmdff

sweepTestsChannel1:
	.redefine HI_VOL $4
	.redefine LO_VOL $2


sweepTestsChannel4:
	.redefine HI_VOL $28
	.redefine LO_VOL $08

sweepTestsChannel6:
	cmdff
