fallingRainStart:
    tempo 135

fallingRainChannel1:
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

fallingRainChannel4:
    .redefine HI_VOL $0e
    .redefine LO_VOL $0f

; Measure 1-4
    duty $03
    duty HI_VOL
    octave 4
    beat r Q c Q+HF
    beat r Q cs Q+HF
    beat r Q d Q+HF
    beat r Q ds Q+HF
; Measure 5
    transpose -4
    .redefine LO_VOL $08
    duty LO_VOL
    goto fallingRainChannel0Measure5
; Measure 6
    transpose -3
    goto fallingRainChannel0Measure5
; Measure 7
    transpose -2
    goto fallingRainChannel0Measure5
; Measure 8
    transpose -1
    goto fallingRainChannel0Measure5

fallingRainChannel0Measure9Loop:
.rept 2
; Measure 9,17
    transpose 0
    goto fallingRainChannel0Measure9
; Measure 10,18
    transpose -6
    goto fallingRainChannel0Measure5
; Measure 11,19
    transpose 3
    goto fallingRainChannel0Measure9
; Measure 12,20
    transpose -3
    goto fallingRainChannel0Measure5
; Measure 13,21
    transpose -2
    goto fallingRainChannel0Measure5
; Measure 14,22
    goto fallingRainChannel0Measure14
; Measure 15-16,23-24
.rept 2
    goto fallingRainChannel0Measure15
.endr
.endr
; Measure 25-26
    transpose 0
.rept 2
    goto fallingRainChannel0Measure25 
.endr
; Measure 27-28
.rept 2
    goto fallingRainChannel0Measure27
.endr
; Measure 29-30
    transpose -3
.rept 2
    goto fallingRainChannel0Measure25
.endr
; Measure 31-32
    transpose -5
.rept 2
    goto fallingRainChannel0Measure25
.endr  
; Measure 33-34
    transpose 0
.rept 2
    goto fallingRainChannel0Measure25 
.endr
; Measure 35-36
.rept 2
    goto fallingRainChannel0Measure27
.endr
; Measure 37-38
    transpose -2
.rept 2
    goto fallingRainChannel0Measure25 
.endr
; Measure 39
    transpose 2
    goto fallingRainChannel0Measure27
; Measure 40
    goto fallingRainChannel0Measure25

    goto fallingRainChannel0Measure9Loop
    cmdff
/*
fallingRainChannel0Measure1:
    beat r Q
    duty HI_VOL
    octave 4
    beat g Q+E1
    duty LO_VOL
    beat g E2+Q
    endSec
*/

fallingRainChannel0Measure5:
; Measure 5
    octave 4
beginLoop 4
    beat b T1 fs T2 b T3 fs T4
    beat b T5 fs T6 b T7 fs T8
breakOrLoop
    endSec

fallingRainChannel0Measure9:
; Measure 9
    octave 4
beginLoop 4
    beat g T1 e T2 g T3 e T4
    beat g T5 e T6 g T7 e T8
breakOrLoop
    endSec

fallingRainChannel0Measure14:
; Measure 14
    octave 4
beginLoop 4
    beat gs T1 fs T2 gs T3 fs T4
    beat gs T5 fs T6 gs T7 fs T8
breakOrLoop
    endSec

fallingRainChannel0Measure15:
; Measure 15
    octave 4
beginLoop 4
    beat gs T1 e T2 gs T3 e T4
    beat gs T5 e T6 gs T7 e T8
breakOrLoop
    endSec

fallingRainChannel0Measure25:
; Measure 25
    octave 4
beginLoop 3
    beat f T1 d T2 f T3 d T4
    beat f T5 d T6 f T7 d T8
breakOrLoop
    endSec

fallingRainChannel0Measure27:
; Measure 27
    octave 4
beginLoop 3
    beat e T1 c T2 e T3 c T4
    beat e T5 c T6 e T7 c T8
breakOrLoop
    endSec


fallingRainChannel0:
    .redefine HI_VOL $5
    .redefine LO_VOL $3

; Measure 1-8
    transpose 0
beginLoop 8
    goto fallingRainChannel4Measure1
breakOrLoop

fallingRainChannel4Measure9Loop:
; Measure 9,17
beginLoop 2
    transpose 5
    goto fallingRainChannel4Measure1
; Measure 10,18
    transpose 10
    goto fallingRainChannel4Measure1
; Measure 11,19
    transpose 3
    goto fallingRainChannel4Measure1
; Measure 12,20
    transpose 8
    goto fallingRainChannel4Measure1
; Measure 13,21
    transpose 9
    goto fallingRainChannel4Measure1
; Measure 14,22
    transpose 2
    goto fallingRainChannel4Measure1
; Measure 15-16,23-24
    transpose 7
.rept 2
    goto fallingRainChannel4Measure1
.endr
breakOrLoop
; Measure 25-26 
.rept 2
    goto fallingRainChannel4Measure25
.endr
; Measure 27-28
    transpose 6
.rept 2
    goto fallingRainChannel4Measure25
.endr  
; Measure 29
    transpose 4
    goto fallingRainChannel4Measure25
; Measure 30
    transpose -3
    goto fallingRainChannel4Measure25
; Measure 31-32
    transpose 2
.rept 2
    goto fallingRainChannel4Measure25
.endr
; Measure 33-34
    transpose 7
.rept 2
    goto fallingRainChannel4Measure25
.endr
; Measure 35-36
    transpose 6
.rept 2
    goto fallingRainChannel4Measure25
.endr
; Measure 37-38
    transpose 5
.rept 2
    goto fallingRainChannel4Measure25
.endr
; Measure 39
    transpose 4
    goto fallingRainChannel4Measure25
; Measure 40
    transpose 3
    goto fallingRainChannel4Measure25

    goto fallingRainChannel4Measure9Loop
    cmdff

fallingRainChannel4Measure1:
    vol HI_VOL
    duty $03
    env $1 $00
    vibrato $e1
    octave 2
    beat c E1 g E2
    octaveu
    beat c Q+E1
    vol LO_VOL
    env $0 $00
    vibrato $01
    beat c E2+Q
    endSec

fallingRainChannel4Measure25:
    vol HI_VOL
    duty $03
    env $1 $00
    vibrato $e1
    octave 2
    beat ds E1 as E2
    octaveu
    beat ds Q+E1
    vol LO_VOL
    env $0 $00
    vibrato $01
    beat ds E2
    endSec 

fallingRainChannel6:
    cmdff