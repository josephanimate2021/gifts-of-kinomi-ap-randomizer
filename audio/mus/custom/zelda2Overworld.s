zelda2OverworldStart:
    tempo 130


zelda2OverworldChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3
    .redefine ENV_1 $0
    .redefine ENV_2_LONG $07
    .redefine ENV_2_SHORT $05

; Measure 1
	duty $02
	env ENV_1 ENV_2_LONG
	vibrato $02
    vol HI_VOL

    octave 4
    beat f HF+R1+R2
beginLoop 2
    goto zelda2OverworldChannel1Measure1c
; Measure 2, 3
    beat f R1+R2 ds R3 f Q r R1+R2
breakOrLoop 
    goto zelda2OverworldChannel1Measure1c
; Measure 4
    beat f E1
beginLoop 3
    beat c S3 c S4 c E1
breakOrLoop
    beat c E2

zelda2OverworldChannel1Measure5Loop:
beginLoop 2
; Measure 5,9
    octave 4
    env ENV_1 ENV_2_LONG
    beat a HF+R1+R2
    env ENV_1 ENV_2_SHORT
    beat a R3 a R1 as R2 ou c R3
; Measure 6,10
    beat ds R1+R2 od f R3
    octaveu
    beat d R1+R2 od f R3
    octaveu
    beat c R1+R2 od f R3
    beat as R1+R2 f R3
; Measure 7,11
    beat a R1+R2 g R3
    env ENV_1 ENV_2_LONG
    beat a HF
    env ENV_1 ENV_2_SHORT
    octaveu
    beat f R1 f R2 f R3
; Measure 8,12
.rept 2
    beat c Q f R1 f R2 f R3
.endr
breakOrLoop
; Measure 13-14
    goto zelda2OverworldChannel1Measure13
; Measure 15
    beat ds R1+R2 ds R3
    beat d Q+R1+R2
    octaved
    beat as R3 as R1 ou c R2 d R3
; Measure 16
    beat d R1+R2 d R3
    env ENV_1 ENV_2_LONG
    beat c HF+Q
; Measure 17-18
    goto zelda2OverworldChannel1Measure13
; Measure 19
    octave 5
    beat e R1 d R2 e R3
    beat c Q+R1+R2
    octaved
    beat g R3 g R1 g R2 g R3
; Measure 20
    beat e R1 d R2 e R3
    beat c Q+R1+R2
    beat c R3 c R1 c R2 c R3
beginLoop 2
; Measure 21
    env ENV_1 ENV_2_LONG
    beat f HF+Q
    env ENV_1 ENV_2_SHORT
    beat as Q
; Measure 22
    beat as R1+R2 as R3
    env ENV_1 ENV_2_LONG
    beat a HF+Q
breakOrLoop
; Measure 23
    goto zelda2OverworldChannel1Measure23
; Measure 24
    octave 5
    beat g R1 a R2 g R3
    beat f R1 g R2 f R3
    beat e R1 f R2 e R3
    beat d R1 e R2 d R3
; Measure 25
    goto zelda2OverworldChannel1Measure23
; Measure 26
    beat e R1+R2 f R3
    beat d R1+R2 e R3
    beat c R1+R2 d R3
    octaved
    beat as R1+R2 ou c R3

    goto zelda2OverworldChannel1Measure5Loop
    cmdff

zelda2OverworldChannel1Measure1c:
; Measure 1c
    octave 4
    env ENV_1 ENV_2_SHORT
    beat f R3 f R1 f R2 f R3
    endSec

zelda2OverworldChannel1Measure13:
; Measure 13
    env ENV_1 ENV_2_LONG
    octave 4
    beat g HF+R1+R2
    env ENV_1 ENV_2_SHORT
    beat a R3 as R1+R2 ou d R3
; Measure 14
    beat as Q a Q g Q f Q
    endSec 

zelda2OverworldChannel1Measure23:
; Measure 23
    octave 4
beginLoop 2
    env ENV_1 ENV_2_SHORT
    beat g R1 as R2 ou d R3
    beat f R1 d R2 od as R3
breakOrLoop
    endSec


zelda2OverworldChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 1
	duty $02
	env ENV_1 ENV_2_LONG
	vibrato $02
    vol HI_VOL

    octave 4
    transpose -8
    beat f HF+R1+R2
    goto zelda2OverworldChannel1Measure1c
; Measure 2
    transpose -10
beginLoop 2
    beat f R1+R2 f R3 f Q r R1+R2
    goto zelda2OverworldChannel1Measure1c
; Measure 3
    transpose -9
breakOrLoop
; Measure 4
    beat e E1
beginLoop 3
    beat cs S3 cs S4 cs E1
breakOrLoop
    beat cs E2

zelda2OverworldChannel0Measure5Loop:
    transpose 0
beginLoop 2
; Measure 5,9
    octave 4
    env ENV_1 ENV_2_SHORT
    beat c Q
    beat d R1 c R2 od b R3 
    octaveu
    beat c R1+R2 c R3
    beat c R1 d R2 a R3
; Measure 6,10
.rept 4
    beat f R1+R2 d R3
.endr
; Measure 7,11
    octave 4
    beat c R1+R2 c R3
    env ENV_1 ENV_2_LONG
    beat c HF
    env ENV_1 ENV_2_SHORT
    octaveu
    beat c R1 c R2 c R3
; Measure 8,12
.rept 2
    octaved
    beat a Q 
    octaveu
    beat c R1 c R2 c R3
.endr
breakOrLoop
; Measure 13-14
    goto zelda2OverworldChannel0Measure13
; Measure 15
    octave 4
    beat g R1+R2 g R3
    beat f Q+R1+R2
    beat f R3 d R1 f R2 as R3
; Measure 16
    beat a R1+R2 a R3
    beat a S1 gs S2 a S3 as S4
    beat a Q f Q
; Measure 17-18
    goto zelda2OverworldChannel0Measure13
; Measure 19
    octave 4
    beat g R1 g R2 g R3
    beat g Q+R1+R2
    beat e R3 e R1 e R2 e R3
; Measure 20
    octaved
    beat g R1 g R2 g R3
    beat g Q+R1+R2
    beat g R3 g R1 g R2 g R3
beginLoop 2
; Measure 21
    octave 3
    env ENV_1 ENV_2_LONG
    beat a HF+Q
    env ENV_1 ENV_2_SHORT
    octaveu
    beat d Q
; Measure 22
    beat d R1+R2 d R3
    env ENV_1 ENV_2_LONG
    beat c HF+Q
breakOrLoop
; Measure 23
    goto zelda2OverworldChannel0Measure23
; Measure 24
    octave 4
beginLoop 2
    beat as S1 ou d S2 od as S3 ou d S4
breakOrLoop
    octave 4
beginLoop 2
    beat g S1 as S2 g S3 g S4
breakOrLoop 
; Measure 25
    goto zelda2OverworldChannel0Measure23
; Measure 26
    octave 5
    beat c Q
    octaved
    beat as R1+R2 g R3+Q
    beat e Q

    goto zelda2OverworldChannel0Measure5Loop
    cmdff

zelda2OverworldChannel0Measure13:
; Measure 13
    octave 3
    beat as Q
    octaveu
    beat c R1 od as R2 a R3
    beat as R1+R2 ou c R3
    beat d R1+R2 as R3
; Measure 14
    octaveu
    beat d Q c Q d Q od a Q
    endSec 

zelda2OverworldChannel0Measure23:
; Measure 23
    octave 4
    env ENV_1 ENV_2_SHORT
beginLoop 2
    beat d R1 g R2 as R3
    octaveu
    beat d R1 od as R2 g R3
breakOrLoop
    endSec


zelda2OverworldChannel4:
	.redefine HI_VOL $0f
	.redefine LO_VOL $0f

; Measure 1
    goto zelda2OverworldChannel4Measure1
; Measure 2
    transpose -2
    goto zelda2OverworldChannel4Measure1
; Measure 3
    transpose -4
    goto zelda2OverworldChannel4Measure1
; Measure 4
    transpose 0
    octave 2
beginLoop 3
    duty HI_VOL
    beat c E1
    duty LO_VOL
    beat c E2
breakOrLoop
    duty HI_VOL
    beat d S1 r S2 e S3 r S4

zelda2OverworldChannel4Measure5Loop:
beginLoop 2
; Measure 5,9
    octave 2
    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    duty HI_VOL
    beat f Y1
    duty LO_VOL
    beat f Y2
    duty HI_VOL
    beat f Y3
    duty LO_VOL
    beat f Y4
    duty HI_VOL
    beat f Y5
    duty LO_VOL
    beat f Y6 

    duty HI_VOL
    beat a E1
    duty LO_VOL
    beat a E2

    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2
; Measure 6,10
    octave 2
.rept 4
    duty HI_VOL
    beat as E1
    duty LO_VOL
    beat as E2
.endr
; Measure 7,11
    ; Measure 5
    octave 2
    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    duty HI_VOL
    beat f Y1
    duty LO_VOL
    beat f Y2
    duty HI_VOL
    beat f Y3
    duty LO_VOL
    beat f Y4
    duty HI_VOL
    beat f Y5
    duty LO_VOL
    beat f Y6 

    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    octave 4
    duty HI_VOL
    beat c Y1
    duty LO_VOL
    beat c Y2
    duty HI_VOL
    beat c Y3
    duty LO_VOL
    beat c Y4
    duty HI_VOL
    beat c Y5
    duty LO_VOL
    beat c Y6 
; Measure 8,12
.rept 2
    octaved
    duty HI_VOL
    beat a E1
    duty LO_VOL
    beat a E2

    octaveu
    duty HI_VOL
    beat c Y1
    duty LO_VOL
    beat c Y2
    duty HI_VOL
    beat c Y3
    duty LO_VOL
    beat c Y4
    duty HI_VOL
    beat c Y5
    duty LO_VOL
    beat c Y6 
.endr
breakOrLoop

; Measure 13
    transpose 2
    goto zelda2OverworldChannel4Measure1
; Measure 14
    goto zelda2OverworldChannel4Measure14
; Measure 15
    octave 2
    duty HI_VOL
    beat as E1
    duty LO_VOL
    beat as E1

    duty HI_VOL
    beat as Y1
    duty LO_VOL
    beat as Y2
    duty HI_VOL
    beat f Y3
    duty LO_VOL
    beat f Y4
    duty HI_VOL
    beat as Y5
    duty LO_VOL
    beat as Y6

    octaveu
    duty HI_VOL
    beat d E1
    duty LO_VOL
    beat d E2

    octaved
    duty HI_VOL
    beat as E1
    duty LO_VOL
    beat as E2
; Measure 16
    octave 2
    duty HI_VOL
    beat f Y1
    duty LO_VOL
    beat f Y2 r R2
    duty HI_VOL
    beat f Y5
    duty LO_VOL
    beat f Y6

    duty HI_VOL
    beat a E1
    duty LO_VOL
    beat a E2   
    
    octaveu
    duty HI_VOL
    beat c E1
    duty LO_VOL
    beat c E2 
    
    octaved
    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2
; Measure 17
    transpose 2
    goto zelda2OverworldChannel4Measure1
; Measure 18
    goto zelda2OverworldChannel4Measure14
; Measure 19
    octave 2
    duty HI_VOL
    beat c E1
    duty LO_VOL
    beat c E2

    duty HI_VOL
    beat e Y1
    duty LO_VOL
    beat e Y2
    duty HI_VOL
    beat ds Y3
    duty LO_VOL
    beat ds Y4
    duty HI_VOL
    beat e Y5
    duty LO_VOL
    beat e Y6

    duty HI_VOL
    beat g E1
    duty LO_VOL
    beat g E2

    duty HI_VOL
    beat as E1
    duty LO_VOL
    beat as E2
; Measure 20
    octaveu
    duty HI_VOL
    beat c E1
    duty LO_VOL
    beat c E2

    octaved
    duty HI_VOL
    beat as Y1
    duty LO_VOL
    beat as Y2
    duty HI_VOL
    beat a Y3
    duty LO_VOL
    beat a Y4
    duty HI_VOL
    beat as Y5
    duty LO_VOL
    beat as Y6

    duty HI_VOL
    beat e E1
    duty LO_VOL
    beat e E2

    duty HI_VOL
    beat c E1
    duty LO_VOL
    beat c E2

beginLoop 4
; Measure 21-24
    goto zelda2OverworldChannel4Measure1
breakOrLoop 
; Measure 25-27
    octave 2
beginLoop 3
    duty HI_VOL
    beat g E1
    duty LO_VOL
    beat g E2 r HF

    octave 2
    duty HI_VOL
    beat as Y1
    duty LO_VOL
    beat as Y2
    octaveu
    duty HI_VOL
    beat d R2
    duty LO_VOL
    beat d R3
breakOrLoop
; Measure 28
    transpose 0
    octave 2
    duty HI_VOL
    beat c R1
    duty LO_VOL
    beat c R2
    duty HI_VOL
    beat e Y5 r Y6

    beat e R1
    duty LO_VOL
    beat e R2
    duty HI_VOL
    beat g Y5 r Y6

    beat g R1
    duty LO_VOL
    beat g R2
    duty HI_VOL
    beat d Y5 r Y6

    beat as R1
    duty LO_VOL
    beat as R2
    duty HI_VOL
    beat c Y5 r Y6

    goto zelda2OverworldChannel4Measure5Loop
    cmdff

zelda2OverworldChannel4Measure1:
; Measure 1
    octave 2
    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    duty HI_VOL
    beat f Y1
    duty LO_VOL
    beat f Y2
    duty HI_VOL
    beat f Y3
    duty LO_VOL
    beat f Y4
    duty HI_VOL
    beat f Y5
    duty LO_VOL
    beat f Y6 

    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    duty HI_VOL
    beat f E1
    duty LO_VOL
    beat f E2

    endSec

zelda2OverworldChannel4Measure14:
; Measure 14
    transpose 0
    octave 2
    duty HI_VOL
    beat g Y1
    duty LO_VOL
    beat g Y2
    duty HI_VOL
    beat fs Y3
    duty LO_VOL
    beat fs Y4
    duty HI_VOL
    beat g Y5
    duty LO_VOL
    beat g Y6 

    duty HI_VOL
    beat g E1
    duty LO_VOL
    beat g S3 r S4

    duty HI_VOL
    beat as Y1
    duty LO_VOL
    beat as Y2
    duty HI_VOL
    beat a Y3
    duty LO_VOL
    beat a Y4
    duty HI_VOL
    beat as Y5
    duty LO_VOL
    beat as Y6 

    octaveu
    duty HI_VOL
    beat d E1
    duty LO_VOL
    beat d S3 r S4
    
    endSec

zelda2OverworldChannel6:

    cmdff