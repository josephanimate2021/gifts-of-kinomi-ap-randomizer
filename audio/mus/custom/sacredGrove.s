sacredGroveStart:
    tempo 128
sacredGroveChannel1:
    .redefine OCT 4
    .redefine HI_VOL $6
    .redefine LO_VOL $3

   ; goto sacredGroveChannel1Measure9Loop ;; temp
; Measure 1-8
    vol $0
beginLoop 4
    beat gs3 W+W
breakOrLoop

sacredGroveChannel1Measure9Loop:
; Measure 9-10
    vibrato $00
    env $0 $06
    duty $02
    goto sacredGroveChannel1Measure9
; Measure 11
    octave OCT+1
    beat b E1 g E2
    env $0 $00
    beat e Q+E1+T5
    vol LO_VOL
    beat e T6+S4+E1
    vol HI_VOL
    env $0 $06
    beat d E2
; Measure 12
    beat e E1 g E2
    goto sacredGroveChannel1Measure12b
; Measure 13-14
    goto sacredGroveChannel1Measure9
; Measure 15
    octave OCT+2
    beat e E1 od b E2
    env $0 $00
    beat g Q+E1+T5
    vol LO_VOL
    beat g T6+S4+E1
    vol HI_VOL
    env $0 $06
    beat b E2
; Measure 16
    beat g E1 d E2
    goto sacredGroveChannel1Measure12b

; Measure 17-18
    goto sacredGroveChannel1Measure17

; Measure 19
    octave OCT+1
    vol HI_VOL
    beat f E1 g E2 a E1 r S3
    vol LO_VOL
    beat a S4

    vol HI_VOL
    beat b E1 ou c E2 d E1 r S3
    vol LO_VOL
    beat d S4
; Measure 20
    vol HI_VOL
    beat e E1 f E2
    transpose g6-e5
    goto sacredGroveChannel1Measure12b
; Measure 21-22
    goto sacredGroveChannel1Measure17
; Measure 23
    octave OCT+1
    vol HI_VOL-1
    beat f E1 e E2 a E1 g E2
    beat b E1 a E2 ou c E1 od b E2
; Measure 24
    octaveu
    vol HI_VOL
    beat d E1 c E2 e E1 d E2
    beat f E1 e E2
    octaved
    vol HI_VOL+1
    beat b S1 ou c S2+S3 od a S4
; Measure 25-26
    env $0 $00
    beat b HF+Q
    vol LO_VOL
    beat b Q r W

    goto sacredGroveChannel1Measure9Loop
    cmdff

sacredGroveChannel1Measure9:
; Measure 9
    octave OCT+1
beginLoop 2
    vol HI_VOL
    beat f E1 a E2
    beat b E1 r S3
    vol LO_VOL 
    beat b S4
breakOrLoop
; Measure 10
    vol HI_VOL
    beat f E1 a E2 b E1 ou e E2
    beat d Q od b E1 ou c E2
    endSec

sacredGroveChannel1Measure17:
; Measure 17
    octave OCT+1
    transpose 0
    duty $03
    vol HI_VOL
    beat d E1 e E2 f E1 r S3
    vol LO_VOL
    beat f S4

    vol HI_VOL
    beat g E1 a E2 b E1 r S3
    vol LO_VOL
    beat b S4
; Measure 18
    vol HI_VOL
    octaveu
    beat c E1 od b E2

sacredGroveChannel1Measure12b:
    octave OCT+1
    env $0 $00
    beat e Q+E1+S3
    vol LO_VOL
    beat e S4+Q
    env $0 $06
    endSec   


sacredGroveChannel0:
.redefine HI_VOL $6 ;$6
.redefine LO_VOL $3 ;$3

    vibrato $00
    env $0 $05
    duty $02
; Measure 1-2,5-6
.rept 2
    goto sacredGroveChannel0Measure1ReptReset
beginLoop 3
    goto sacredGroveChannel0Measure1Reset
breakOrLoop
; Measure 3-4,7-8
    goto sacredGroveChannel0Measure3
beginLoop 3
    goto sacredGroveChannel0Measure1
breakOrLoop
.endr   

sacredGroveChannel0Measure9Loop:
; Measure 9-10,13-14
.rept 2
    goto sacredGroveChannel0Measure1ReptReset
beginLoop 3
    goto sacredGroveChannel0Measure1Reset
breakOrLoop
; Measure 11-12,15-16
    goto sacredGroveChannel0Measure3
beginLoop 3
    goto sacredGroveChannel0Measure1
breakOrLoop
.endr

beginLoop 3
; Measure 17,19,21
    transpose 0
    goto sacredGroveChannel0Measure17
    goto sacredGroveChannel0Measure17c
; Measure 18,20,22
    goto sacredGroveChannel0Measure3
    goto sacredGroveChannel0Measure1
breakOrLoop

; Measure 23
    transpose 0
    goto sacredGroveChannel0Measure17c
    goto sacredGroveChannel0Measure17c
; Measure 24
    goto sacredGroveChannel0Measure24
    goto sacredGroveChannel0Measure24

; Measure 25
    octave OCT-1
    vol HI_VOL
    beat b S1 
    vol LO_VOL
    octaveu
    beat b S2

    vol HI_VOL
    beat e S3
    vol LO_VOL
    octaved
    beat b S4
; Measure 25b
    vol HI_VOL
    octaveu
    beat a S1
    vol LO_VOL
    beat e S2

    vol HI_VOL
    beat b S3
    vol LO_VOL
    beat a S4
; Measure 25c
    octave OCT
    vol HI_VOL
    beat e S1 
    vol LO_VOL
    beat b S2

    vol HI_VOL
    beat a S3
    vol LO_VOL
    beat e S4
; Measure 25d
    vol HI_VOL
    beat b S1
    vol LO_VOL
    beat a S2

    vol HI_VOL
    octaveu
    beat e S3
    vol LO_VOL
    octaved
    beat b S4

; Measure 26
    octave OCT
    vol HI_VOL
    beat e S1 
    vol LO_VOL
    octaveu
    beat e S2

    vol HI_VOL
    octaved
    beat gs S3
    vol LO_VOL
    beat e S4
; Measure 25b
    vol HI_VOL
    beat b S1
    vol LO_VOL
    beat gs S2

    vol HI_VOL
    octaveu
    beat e S3
    vol LO_VOL
    octaved
    beat b S4
; Measure 25c
    octave OCT
    vol HI_VOL
    beat b S1 
    vol LO_VOL
    octaveu
    beat e S2

    vol HI_VOL
    octaved
    beat gs S3
    vol LO_VOL
    beat b S4
; Measure 25d
    vol HI_VOL
    beat e S1
    vol LO_VOL
    beat gs S2

    vol HI_VOL
    octaved
    beat b S3
    vol LO_VOL
    octaveu
    beat gs S4

    goto sacredGroveChannel0Measure9Loop
    cmdff

sacredGroveChannel0Measure1ReptReset:
    transpose 0
sacredGroveChannel0Measure1Rept:
    octave OCT
    vol HI_VOL
    beat e S1
    vol LO_VOL
    beat g S3
    jumpto sacredGroveChannel0Measure1a


sacredGroveChannel0Measure1Reset:
    transpose 0
sacredGroveChannel0Measure1:
; Measure 1
    octave OCT
    vol HI_VOL
    beat e S1
    vol LO_VOL
    octaveu
    beat c S2

sacredGroveChannel0Measure1a:
; Measure 1a
    vol HI_VOL
    octaved
    beat f S3
    vol LO_VOL
    beat e S4

    vol HI_VOL
    beat a S1
    vol LO_VOL
    beat f S2

    vol HI_VOL
    octaveu
    beat c S3
    vol LO_VOL
    octaved
    beat a S4

    endSec

sacredGroveChannel0Measure3:
; Measure 3
    transpose b3-e4
    jumpto sacredGroveChannel0Measure1Rept

sacredGroveChannel0Measure17:
; Measure 17
    transpose 0
    octave OCT
    vol HI_VOL
    beat c S1 
    vol LO_VOL
    beat g S2

    vol HI_VOL
    beat d S3
    vol LO_VOL
    beat c S4
; Measure 17b
    vol HI_VOL
    beat f S1
    vol LO_VOL
    beat d S2

    vol HI_VOL
    beat a S3
    vol LO_VOL
    beat f S4

    endSec

sacredGroveChannel0Measure17c:
; Measure 17c
    octave OCT-1
    vol HI_VOL
    beat b S1 
    vol LO_VOL
    octaveu
    beat a S2

    vol HI_VOL
    beat d S3
    vol LO_VOL
    octaved
    beat b S4
; Measure 17d
    vol HI_VOL
    octaveu
    beat f S1
    vol LO_VOL
    beat d S2

    vol HI_VOL
    beat a S3
    vol LO_VOL
    beat f S4   

    endSec   

sacredGroveChannel0Measure24:
; Measure 24
    octave OCT
    vol HI_VOL
    beat c S1 
    vol LO_VOL
    beat a S2

    vol HI_VOL
    beat e S3
    vol LO_VOL
    beat c S4
; Measure 24b
    vol HI_VOL
    beat g S1
    vol LO_VOL
    beat e S2

    vol HI_VOL
    beat b S3
    vol LO_VOL
    beat g S4   

    endSec  


sacredGroveChannel4:
.redefine HI_VOL $0e
.redefine LO_VOL $0f
.redefine ECHO $08
.redefine ECHO_OFFSET Q-S4 ; Q-T8

   ; goto sacredGroveChannel4Measure9Loop ;; temp

; Measure 1-8
    octave OCT-1
    duty LO_VOL
beginLoop 2
    beat a Q r Q+HF+W
    beat e Q r Q+HF+W
breakOrLoop

; Measure 9-10
    beat r ECHO_OFFSET
sacredGroveChannel4Measure9Loop:
    duty ECHO
    goto sacredGroveChannel4Measure9b
; Measure 11b
    octave OCT+1
    beat b E1 g E2
    beat e Q+E1+T5 r T6+S4+E1
    beat d E2
; Measure 12b
    beat e E1 g E2
    beat e Q+E1+S3 r S4+Q
; Measure 13b-14
    goto sacredGroveChannel4Measure9b
; Measure 15b
    octave OCT+2
    beat e E1 od b E2
    beat g Q+E1+T5 r T6+S4+E1
    beat b E2
; Measure 16b
    beat g E1 d E2
    beat e Q+E1+S3 r S4+Q-ECHO_OFFSET 

; Measure 17b-18
    octave OCT-1
    duty LO_VOL
    beat a Q r Q+HF+W

; Measure 19
    octave OCT+1
    duty ECHO
    beat d E1 e E2 f E1 r E2
    beat g E1 a E2 b E1 r E2
; Measure 20
    octaveu
    beat c E1 d E2
    beat e Q+E1+S3 r S4+Q
; Measure 21-22
    octave OCT-1
    duty LO_VOL
    beat a Q r Q+HF+W
; Measure 23
    octave OCT+1
    duty ECHO
    beat d E1 c E2 f E1 e E2
    beat g E1 f E2 a E1 g E2
; Measure 24
    beat b E1 a E2 ou c E1 od b E2
    octaveu
    beat d E1 c E2
    octaved
    beat e S1 f S2+S3 d S4
; Measure 25-26
    beat e HF+Q r Q+W+ECHO_OFFSET

    goto sacredGroveChannel4Measure9Loop
    cmdff


sacredGroveChannel4Measure9b:
; Measure b
    octave OCT+1
beginLoop 2
    beat f E1 a E2
    beat b E1 r E2
breakOrLoop
; Measure 10
    beat f E1 a E2 b E1 ou e E2
    beat d Q od b E1 ou c E2
    endSec

/*
sacredGroveChannel4Measure17b:
; Measure 17
    octave OCT+1
    transpose 0
    vol HI_VOL
    beat d E1 e E2 f E1 r S3
    vol LO_VOL
    beat f S4

    vol HI_VOL
    beat g E1 a E2 b E1 r S3
    vol LO_VOL
    beat b S4
; Measure 18
    vol HI_VOL
    octaveu
    beat c E1 od b E2

    octaveu
    beat e Q+E1+S3
    vol LO_VOL
    beat e S4+Q
    endSec  
*/

sacredGroveChannel6:
    cmdff

