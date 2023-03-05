spiritTempleStart:
	tempo 73

spiritTempleChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 1
    duty $02
    goto spiritTempleChannel1Measure1
; Measure 6d
    octave 4
    vol HI_VOL
    env $1 $00
    vibrato $01
    duty $01
    beat d R2+R3 d HF
    beat r Q+S1+T3
; Measure 7b
; 4/4
    beat c T4 d E2+S1+T3
    beat fs T4 f E2+Q+HF r T1
; Measure 8c
    beat d W3 ds W4 d S2+E2+Q r E1+S3+T7
; Measure 9a
    octaved
    beat fs T8 ou d Q+HF
; Measure 10
    beat c Q od as HF
    beat g E1 as T5 g T6 f T7 g T8+Q+S1 r S2
; Measure 11c
    beat g T5 gs T6 g S4+E1 ;r T8
    ;beat g T1 gs T2 g S2
    beat as Y4 as Y5
    beat as Y6+Q+E1
; Measure 12a-13
    beat g T5 as T6 ;g T7 r T8
    ;beat g T1 as T2 g S2+E2+Q+S1+T3
    beat g S4+HF+S1+T3
    beat f T4 g E2+HF r HF+S1+T3
; Measure 14a
    octaveu
    beat cs T4 f E1+S3
    beat f S4+E1+Q ds Q
; Measure 15
    beat d T1 ds T2+S2+E2
    beat d R1
    vol LO_VOL
    beat d R2 d R3
    beat c T1 
    vol HI_VOL
    beat d T2+S2+E2+Q+Q r S1
; Measure 16a
    beat f S2+T5 f T6+T7 ds T8+S1
    beat f S2+E2+Q+Q

spiritTempleChannel1Measure17bLoop:
; Measure 17b
    beat d Q+HF r E1
    goto spiritTempleChannel1Measure18a
    octave 4
    beat d Q+HF+E1 r E2+E1
; Measure 22b
    octaved
    beat as W7 ou c W8 od as W9+S4+E1
    octaveu
    beat c E2+E1
    octaved
    beat g T5 as T6+S4+Q
; Measure 23b
    vol LO_VOL+1
    beat g HF+E1+S3 gs S4
; Measure 24
    beat as S1+W4+W5 b W6
    beat as E2+S1 gs S2 b S3 as S4
    beat gs Y1+Y2 b Y3+Y4
    beat as Y5+W11 gs W12+S1
    beat as S2+S3 b S4
; Measure 25
    beat as E1+S3+W10+W11 g W12+S1
    octaveu
    beat d S2+T5 ds T6 d T7 r T8+T1
    beat cs T2+S2+E2 od g S1+T3
    beat as T4 b T5 as T6+S4+E1+T1
; Measure 26   
    beat gs T2+T3 b T4
    beat as T1 r T2 as T3 r T4
    beat gs S3 as S4
    beat gs T1 b T2+S2
    beat as E2+S1 b T3 as T4+E2
; Measure 27
    beat gs E1 g E2+Q+E1
    octaveu
    beat d S3 ds T7
    beat cs T8+E1 od as E2 r E1
; Measure 28a
    octaveu
    beat cs E2
    env $0 $00
    shift 2
    beat cs S1
    shift 5
    beat cs S2
    shift 0
    env $1 $00
    beat d E2+E1 fs E2+S1
    beat d S2 cs E2
; Measure 29
    beat d S1 cs S2+S3
    octaved
    beat as S4+Y1 b W3 as S2+E2
    beat a S1 as S2+S3 a W10+W11
    beat b W12 ou c W1 od b W2+W3
    beat as S2 b T5 as T6+S4 r S1+W4
; Measure 30a
    beat g W5 gs W6
    beat g E2+HF as T1 g T2+S2+S3+T7 b T8
; Measure 31
    beat g S1+T3 gs T4
    beat g E2+HF+E1 as T5 g T6+S4+E1
; Measure 32a
    octaveu
    vol HI_VOL+2
    beat cs S3
    vol LO_VOL+1
    octaved
    beat g S4+HF+E1+S3 r T7
    vol HI_VOL
    beat g T8
; Measure 33
    octaveu
    beat g T1 gs T2 g S2+E2+Q r E1
    beat g E2 f S1 g S2 gs T5 g T6+S4+Q
; Measure 34a
    beat g T1 b T2 as S2
    beat gs E2+Q g Q+E1+S3+W10
; Measure 35a
    beat g W11 as W12
    beat gs E1+S3 g S4+E1
    beat b S3 gs S4+S1
    beat g S2+Y4 g W9 a W10 ou c Y6
; Measure 36
    octaved
    beat gs S1+T3 g T4+S3+T7 gs T8
    beat g Q+E1 f S3 fs T7 f T8+Q
; Measure 37
    beat f S1+T3 g T4+T5 gs T6
    beat g S4+HF+E1 r E2+Q
; Measure 38b
    beat d Y1 od g W3+S2+S3
    beat as S4+HF r R1+R2
; Measure 39a
    octaveu
    beat cs R3 
    beat d T1 cs T2+S2
    beat d T5 cs T6+S4
    beat d T1 cs T2+S2+S3
    beat c S4+S1 cs S2 c E2
; Measure 40
    beat c W1
    env $0 $00
    octaved
    beat b W2 as W3 r S2+S3
    env $1 $00
    octave 3
    beat gs S4 g T1 gs T2 g S2 as E2
    beat g S1 as S2+S3 g S4+Q
; Measure 41
    octave 3
    beat d Y1 ds W3 d S2+S3
    beat g S4+Q r Q+E1
    beat g S3+T7 gs T8
; Measure 42
    beat g HF r Q+S1+T3
    beat f T4 as E2
; Measure 43
    beat as E1 r E2
    beat g Q+E1 g T5 as T6+S4
    beat g E1+S3 as S4
; Measure 44
    beat g S1 gs W4 as Y3 r T1
    beat a T2 g S2+E2+E1
    beat g Y4+Y5 gs Y6
    beat g E1+T5 a T6 g S4+Y1+Y2
; measure 45a-46
    beat f Y3 g E2+E1+T5
    beat gs T6 g S4+S1+T3
    beat gs T4 g E2+Q+E1 r E2+Q+HF+E1+S3+T7
; Measure 47a
    octaveu
    beat d T8+R1 d R2 d R3
    beat d HF+Q r S1
; Measure 48b-49
    beat f S2+T5 f T6+T7 ds T8+S1
    beat f S2+E2+Q+Q d Q+HF r Q
; Measure 50a
    goto spiritTempleChannel1Measure18a
    goto spiritTempleChannel1Measure17bLoop
    cmdff

spiritTempleChannel1Measure18a:
; Measure 18a
    octave 4
    beat g T5 a T6 ;g T7 r T8
    ;beat g T1 a T2 g S2+S3
    beat g S4+E1+S3
    beat as S4+Q+E1 g E2+E1
; Measure 19a
    beat as T5 ou c T6 ;od as T7 r T8
    ;beat as T1 ou c T2 od as S2+E2+S1
    octaved
    beat as S4+Q+S1
    beat g S2+T5 gs T6 g S4+E1+S3 r S4
; Measure 20
    beat g E1 as S3 g S4+Q+E1
    beat f E2+S1 r S2 f S3 r S4
; Measure 21
    beat f E1+S3 d S4
    endSec

spiritTempleChannel0Measure1:
    transpose -5
    duty $01
spiritTempleChannel1Measure1:
beginLoop 2
; Measure 1,3c
; 6/4
	vol $0
    beat gs3 HF

    vol HI_VOL
	vibrato $00
	env $1 $00
	octave 5
    beat c Q od as Q+HF+Q r HF
; Measure 2d
; 9/4
    beat gs Q as Q g W ; (Q+HF+Q)
breakOrLoop
; Measure 5d
; 6/4
    octave 4
    env $0 $00
    vol LO_VOL
    beat g Q+HF
    vol LO_VOL-2
    beat g HF+Q+R1
    endSec


spiritTempleChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $2

; Measure 1
    goto spiritTempleChannel0Measure1
; Measure 6
    octave 4
    vol $0
    beat gs3 R2+R3+HF
; Measure 7-8,9-10
    transpose 0
beginLoop 2
    vol HI_VOL
    octave 3
    duty $03
    vibrato $e2
    env $2 $00
    beat d HF+Q+E1+S3
    vol LO_VOL
    env $0 $00
    vibrato $02
    beat d S4+HF+E1
    vol LO_VOL-2
    beat d E2+Q
    transpose 1
breakOrLoop
; Measure 11
    goto spiritTempleChannel0Measure11Start
    goto spiritTempleChannel0Measure11
; Measure 12
    octave 3
    beat ds HF+Q f Q

spiritTempleChannel0Measure13Loop:
; Measure 13-22
beginLoop 5
    goto spiritTempleChannel0Measure11
    goto spiritTempleChannel0Measure14
breakOrLoop
; Measure 23
    octave 3
    beat d Q
    octave 4
    vol HI_VOL+1
    beat d Q+HF+Q
; Measure 24b
    beat ds HF f Q+Q
; Measure 25b
    beat d Q+HF+Q
; Measure 26b
    beat g Q as Q+R1+R2 g R3
; Measure 27
    transpose 5+12
    goto spiritTempleChannel0Measure11
; Measure 28
    goto spiritTempleChannel0Measure28 
    octave 4   
    beat d Q+Q
; Measure 30b
    beat f HF g Q+Q
; Measure 31b
    transpose 12
    goto spiritTempleChannel0Measure11
; Measure 32b
    beat d Q f HF+Q
; Measure 33b
    beat d Q+HF
; Measre 34-37
beginLoop 2
    goto spiritTempleChannel0Measure14
    goto spiritTempleChannel0Measure11
breakOrLoop
; Measure 38
    octave 3
    beat ds Q
    vol HI_VOL+1
    transpose 12
    goto spiritTempleChannel0Measure11
    octave 4
    vol HI_VOL+1
    beat d HF
; Measure 39d
    beat c Q+Q
; Measure 40b
    beat d Q g Q f Q+Q
; Measure 41b
    beat as Q g HF+HF
; Measure 42c
    beat f HF
; Measure 43   
    transpose 12
    goto spiritTempleChannel0Measure11
; Measure 44-45
    goto spiritTempleChannel0Measure28
    octave 4
    vol HI_VOL
    beat g Q
; Measure 46
    goto spiritTempleChannel0Measure14
; Measure 47
    goto spiritTempleChannel0Measure11
; Measure 48
    goto spiritTempleChannel0Measure14
; Loop
    goto spiritTempleChannel0Measure13Loop
    cmdff

spiritTempleChannel0Measure14:
    transpose 1
spiritTempleChannel0Measure11:
    octave 3
    beat d Q+Q+E1+S3
    vol LO_VOL
    env $0 $00
    vibrato $02
    beat d S4+E1
    vol LO_VOL-2
    beat d E2
spiritTempleChannel0Measure11Start:
    duty $02
    vibrato $e2
    vol HI_VOL
    env $2 $00
    transpose 0
    endSec

spiritTempleChannel0Measure28:
; Measure 28
    vol $0
    beat gs3 Q
    octave 4
    vol HI_VOL+1
    beat as HF gs Q+Q
; Measure 29b
    beat g HF
    endSec

spiritTempleChannel4:
	.redefine HI_VOL $0a
	.redefine LO_VOL $0e

    transpose 0
beginLoop 2
; Measure 1,3
    octave 2
    goto spiritTempleChannel4Measure1
    beat g Q+W-Y6
    duty LO_VOL
    beat g Y6
; Measure 2,4
    goto spiritTempleChannel4Measure1
    transpose 3
    goto spiritTempleChannel4Measure1
    ;beat g W+HF
    beat g W+R1+R2
    duty LO_VOL
    beat g R3+Q r Q
breakOrLoop
; Measure 6c
    beat r Q+HF+HF r W
    .redefine HI_VOL $0e
    .redefine LO_VOL $0f
beginLoop 2
; Measure 7-8,9-10
    octave 2
    duty HI_VOL
    beat g W+R1+R2
    duty LO_VOL
    beat g R3+Q+HF
    transpose 1
breakOrLoop

.redefine HI_VOL $0f
.redefine LO_VOL $0c

spiritTempleChannel4Measure11Loop:
    transpose 0
beginLoop 2
; Measure 11,12
    octave 2
    duty HI_VOL
    beat g HF+R1+R2
    duty LO_VOL
    beat g R3+Q
    transpose 1
breakOrLoop
    goto spiritTempleChannel4Measure11Loop
    cmdff

spiritTempleChannel4Measure1:
	.redefine HI_VOL $0a
	.redefine LO_VOL $0e
; Measure 1
    octave 2
    duty HI_VOL
    beat f Q-Y6
    duty LO_VOL
    beat f Y6
    duty HI_VOL
    transpose 0
    endSec


spiritTempleChannel6:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

    .redefine SLAP $26
    .redefine MED_TOM $23
    .redefine LO_TOM $24;$2e

beginLoop 2
; Measure 1,2
; 6/4
    vol HI_VOL
    beat SLAP Q SLAP Q r W
; Measure 2,3
; 9/4, 6/4
    beat SLAP Q SLAP Q SLAP Q
    vol $0
    beat r HF+Q r HF+Q
breakOrLoop
; Measure 4c
    beat r Q
; Measure 4d-6
; Measure 7-10
beginLoop 2+4
   beat r W
breakOrLoop
; Measure 11
    vol HI_VOL
    beat LO_TOM HF
    vol LO_VOL
    beat SLAP W1 SLAP W2+W3+S2+E2+Q
; Measure 12
    vol HI_VOL
    beat MED_TOM HF+Q
    vol LO_VOL
    beat SLAP E1 SLAP E2

spiritTempleChannel6Measure13Loop:
; Measure 13
    vol HI_VOL
    beat LO_TOM Q
    vol LO_VOL
    beat SLAP W1 SLAP W2+W3+S2+E2+Q 
    beat SLAP E1 SLAP E2
    goto spiritTempleChannel6Measure13Loop
    cmdff
