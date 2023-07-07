ghostsNGoblinsGraveyardStart:

ghostsNGoblinsGraveyardChannel1:
    tempo 110
	.redefine HI_VOL $6
	.redefine LO_VOL $4

; Measure 1
    duty $01
    octave 4
    vol HI_VOL
    env $0 $04
    vibrato $01
    beat as S1 as S2 as E2+E1 b E2
    octaveu
    beat c E1 od b E2 as E1 a E2
; Measure 2
    beat as E1 r S3 od as S4 as Q+HF

ghostsNGoblinsGraveyardChannel1Measure3Loop:
    tempo 180
; Measure 3
    vol $0
    beat gs3 Q

    goto ghostsNGoblinsGraveyardChannel1Measure3b
    octave 4
    beat a Q r Q
; Measure 7b
    goto ghostsNGoblinsGraveyardChannel1Measure3b
    octave 5
    beat c Q
; Measure 11
    goto ghostsNGoblinsGraveyardChannel1Measure11
    octave 5
    beat cs Q
; Measure 12
    goto ghostsNGoblinsGraveyardChannel1Measure11
    beat d Q
; Measure 13
    goto ghostsNGoblinsGraveyardChannel1Measure11
    beat ds Q
; Measure 14
    goto ghostsNGoblinsGraveyardChannel1Measure11
    beat e Q

; Measure 15
    goto ghostsNGoblinsGraveyardChannel1Measure15
    octave 5
    beat a Q
; Measure 16
    goto ghostsNGoblinsGraveyardChannel1Measure15
    beat as Q
; Measure 17
    goto ghostsNGoblinsGraveyardChannel1Measure15
    beat e Q
; Measure 18
    beat f E1 od f E2 fs E1 g E2
    beat gs E1 a E2 as E1 ou c E1

; Measure 19
    env $1 $00
    octaved
    beat as HF+Q r Q+Q
; Measure 20b
    transpose e5-a5
    goto ghostsNGoblinsGraveyardChannel1Measure11
; Measure 21
    octave 5
    beat d HF+Q r Q+Q
; Measure 22b
    goto ghostsNGoblinsGraveyardChannel1Measure11
; Measure 23
    beat fs HF+Q r Q+Q
; Measure 24b
    transpose 0
    env $1 $05
    beat fs E1 gs E2 r E1
    beat fs E2 gs E1 r E2
; Measure 25
    beat f Q+E1 od f E2+Q ou f Q r E1
; Measure 26a
    beat ds E2 ds E1 ds E2
    beat c E1 c E2 od a E1 a E2

    goto ghostsNGoblinsGraveyardChannel1Measure3Loop
    cmdff

ghostsNGoblinsGraveyardChannel1Measure3b:
; Measure 3b
    octave 5
    env $1 $04
    vibrato $21
    vol HI_VOL
    beat as HF a Q
; Measure 4
    beat gs HF g Q fs Q
; Measure 5
    beat e E1 f E2 r E1
    beat e E2 f E1 r E2
    beat e E1 f E2 r E1
; Measure 6a
    octaved
    beat e E2 f E1 e E2
    beat f Q
    endSec

ghostsNGoblinsGraveyardChannel1Measure11:
; Measure 11
    octave 5
    env $1 $04
    beat a E1 as E2 r E1
    beat a E2 as E1 r E2
    env $1 $00
    endSec

ghostsNGoblinsGraveyardChannel1Measure15:
; Measure 15
    octave 5
    beat f E1 f E2 f Q r Q 
    endSec

ghostsNGoblinsGraveyardChannel0:
    tempo 110
	.redefine HI_VOL $4
	.redefine LO_VOL $2

; Measure 1
    duty $00
    octave 4
    vol HI_VOL
    env $0 $03
    vibrato $01
    beat g S1 g S2 g E2+E1 g E2
    beat g E1 g E2 g E1 g E2
; Measure 2
    beat f E1 r S3 od f S4 f Q+HF

ghostsNGoblinsGraveyardChannel0Measure3Loop:
    tempo 180
; Measure 3-7a
beginLoop 2
    vol $0
    beat gs3 Q
; Measure 3b
    octave 5
    env $1 $03
    vibrato $21
    vol HI_VOL
    beat f HF f Q
; Measure 4
    beat f HF f Q c Q
; Measure 5
    beat c Q r E1 c E2+E1 r E2 c Q r E1
; Measure 6a
    octaved
    beat c E2+E1 r E1 c Q r Q
breakOrLoop
; Measure 11-14
    octave 4
    env $1 $00
    beat cs W d W ds W e W 
; Measure 15
    env $1 $03
    goto ghostsNGoblinsGraveyardChannel0Measure15
    octave 4
    beat fs Q
; Measure 16
    goto ghostsNGoblinsGraveyardChannel0Measure15
    beat f Q
; Measure 17
    transpose c5-a4 ;3
    goto ghostsNGoblinsGraveyardChannel0Measure15
    beat g Q
; Measure 18
    beat fs W

; Measure 19
    ;transpose 3
    env $1 $00
    octave 4
    beat d HF+Q r Q+Q
; Measure 20b
    transpose as4-cs5
    goto ghostsNGoblinsGraveyardChannel0Measure20b
; Measure 21
    beat gs HF+Q r Q+Q
; Measure 22b
    transpose c5-cs5
    goto ghostsNGoblinsGraveyardChannel0Measure20b
; Measure 23
    beat g HF+Q r Q+Q
; Measure 24b
    transpose 0
    goto ghostsNGoblinsGraveyardChannel0Measure20b
; Measure 25
    env $1 $05
    octaveu
    beat c Q+E1 od c E2+Q ou c Q r E1
; Measure 26a
    beat c E2 c E1 c E2
    octaved
    beat a E1 a E2 ds E1 ds E2

    goto ghostsNGoblinsGraveyardChannel0Measure3Loop
    cmdff

ghostsNGoblinsGraveyardChannel0Measure15:
; Measure 15
    octave 4
    beat a E1 a E2 a Q r Q 
    endSec

ghostsNGoblinsGraveyardChannel0Measure20b:
; Measure 20b
    octave 5
    env $1 $03
    beat cs E1 cs E2 r E1
    beat cs E2 cs E1 r E2
    env $1 $00
    endSec

ghostsNGoblinsGraveyardChannel4:
    tempo 110
    .redefine ECHO $08
    .redefine HI_VOL $14
    .redefine LO_VOL $0f

; Measure 1
    transpose 0
    duty ECHO
    octave 3
    beat ds S1 ds S2 ds E2+E1 ds E2
    beat fs E1 g E2 gs E1 a E2
; Measure 2
    beat as E1 r S3 od as S4 as E1 r E2+HF

ghostsNGoblinsGraveyardChannel4Measure3Loop:
    tempo 180
beginLoop 2
; Measure 3-4,7-8
    duty HI_VOL
    goto ghostsNGoblinsGraveyardChannel4Measure3
    goto ghostsNGoblinsGraveyardChannel4Measure3
; Measure 5-6,9-10
    goto ghostsNGoblinsGraveyardChannel4Measure5
    goto ghostsNGoblinsGraveyardChannel4Measure5
breakOrLoop
; Measure 11
    octave 2
beginLoop 2
    beat as E1 ou cs E2 f E1 od f E2
breakOrLoop
; Measure 12
    octave 2
beginLoop 2
    beat as E1 ou ds E2 fs E1 od ds E2
breakOrLoop
; Measure 13
    octave 2
beginLoop 2
    beat as E1 ou fs E2 as E1 od ds E2
breakOrLoop
; Measure 14
    octave 2
beginLoop 2
    beat as E1 ou fs E2 as E1 od e E2
breakOrLoop

; Measure 15
    goto ghostsNGoblinsGraveyardChannel4Measure15
    octave 3
    beat f Q od a E1 r E2 f E1 r E2
; Measure 16
    goto ghostsNGoblinsGraveyardChannel4Measure15
    octaveu
    beat f Q od as E1 r E2 f E1 r E2
; Measure 17
    goto ghostsNGoblinsGraveyardChannel4Measure15
    octaveu
    beat f Q r Q
    goto ghostsNGoblinsGraveyardChannel4Measure15
; Measure 18
    octaved
    beat a E1 ou ds E2 d E1 cs E2
    beat c E1 od b E2 as E1 a E2 

; Measure 19
    beat as E1 r E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
    beat r E1 as E2 ou cs E1 f E2 
; Measure 20
    octaved
    beat as E1 r E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
    beat r E1 as E2 ou ds E1 f E2 
; Measure 21
    octaved
    beat a E1 r E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
    beat r E1 a E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
; Measure 22
    beat a E1 r E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
    beat r E1 a E2 ou e E1 f E2
; Measure 23-24
beginLoop 2
    octaved
    beat fs E1 r E2
    transpose d3-f3
    goto ghostsNGoblinsGraveyardChannel4Measure15
    transpose 0
    beat r E1 fs E2 as E1 ou cs E2
breakOrLoop
; Measure 25
    octaved
    beat a E1 r E2
    goto ghostsNGoblinsGraveyardChannel4Measure15
    beat r E1 a E2 ou ds E1 f E2
; Measure 26
    octave 3
    beat r E1 f E2 e E1 ds E2
    beat d E1 cs E2 c E1 od a E2
    goto ghostsNGoblinsGraveyardChannel4Measure3Loop
    cmdff

ghostsNGoblinsGraveyardChannel4Measure3:
; Measure 3
    octave 2
    beat as E1 ou cs E2 f E1 od f E2
    beat as E1 ou f S3 r S4 f E1 r E2
    endSec

ghostsNGoblinsGraveyardChannel4Measure5:
; Measure 5
    octave 3
    beat c E1 ds E2 f E1 od f E2
    octaveu
    beat c E1 f S3 r S4 f E1 r E2
    endSec

ghostsNGoblinsGraveyardChannel4Measure15:
; Measure 15
    octave 3
    beat f S1 r S2 f S3 r S4
    endSec 

ghostsNGoblinsGraveyardChannel6:
    cmdff