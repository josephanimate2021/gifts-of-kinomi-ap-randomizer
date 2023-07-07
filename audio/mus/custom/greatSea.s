greatSeaStart:
	tempo 140

greatSeaChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $4

; Measure 1-3
    duty $02
beginLoop 3
    goto greatSeaChannel1WholeNote
breakOrLoop
; Measure 4
    transpose g4-a4
    goto greatSeaChannel1WholeNote
; Measure 5
    transpose 0
    goto greatSeaChannel1WholeNote
; Measure 6
    transpose e4-a4
    goto greatSeaChannel1WholeNote
; Measure 7
    transpose 0
    goto greatSeaChannel1WholeNote
; Measure 8
    transpose g4-a4
    goto greatSeaChannel1WholeNote

greatSeaChannel1Measure9Loop:
; Measure 9
    octave 4
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure10b
; Measure 11
    goto greatSeaChannel1WholeNote
; Measure 12
    goto greatSeaChannel1Measure12
; Measure 13
    transpose g4-a4
    goto greatSeaChannel1WholeNote
; Measure 14
    goto greatSeaChannel1HalfNote
    octave 4
    beat a HF
; Measure 15
    transpose e4-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel1Measure15c
; Measure 16
    goto greatSeaChannel1WholeNote
; Measure 17
    goto greatSeaChannel1Measure17
    goto greatSeaChannel1WholeNoteD4
; Measure 18b
    goto greatSeaChannel1HalfNote
; Measure 18d
    goto greatSeaChannel1Measure18d
; Measure 19
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
    vol HI_VOL
    vibrato $00
    transpose 0
    beat e Q
; Measure 20
    goto greatSeaChannel1WholeNoteD4
; Measure 21
    transpose 0
    vibrato $00
    octave 3
    vol HI_VOL
    beat b S1 r S2 b S3 ou cs S4 
    goto greatSeaChannel1WholeNoteD4
    goto greatSeaChannel1HalfNote
; Measure 22d
    octave 4
    vol HI_VOL
    vibrato $00
    beat b Q
; Measure 23
    goto greatSeaChannel1WholeNote
; Measure 24
    transpose e4-a4
    goto greatSeaChannel1WholeNote

; Measure 25 (M9)
    octave 4
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure10b
; Measure 27 (M11)
    goto greatSeaChannel1WholeNote
; Measure 28 (M12)
    goto greatSeaChannel1Measure12
; Measure 29
    transpose g4-cs4
    goto greatSeaChannel0DotHalfNote
    vol HI_VOL
    vibrato $00
    beat ds E1 cs S3 c S4
; Measure 30 (M13)
    transpose g4-a4
    goto greatSeaChannel1WholeNote
; Measure 31 (M15)
    transpose e4-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel1Measure15c
; Measure 32 (M16)
    goto greatSeaChannel1WholeNote
; Measure 33 (M17)
    goto greatSeaChannel1Measure17
    goto greatSeaChannel1WholeNoteD4
; Measure 34b (M18b)
    goto greatSeaChannel1HalfNote
; Measure 34d (M18d)
    goto greatSeaChannel1Measure18d
; Measure 35-36
    transpose fs4-a4
    beat f HF
    goto greatSeaChannel1WholeNote
; Measure 36c
    goto greatSeaChannel1HalfNote
    goto greatSeaChannel1Measure37
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure38b
    goto greatSeaChannel0DotHalfNote
; Measure 40
    transpose g4-a4
    goto greatSeaChannel1WholeNote

; Measure 41
    transpose fs4-a4
    goto greatSeaChannel1WholeNote
; Measure 42
    transpose gs4-a4
    goto greatSeaChannel1WholeNote
; Measure 43-45
    transpose 0
beginLoop 3
    goto greatSeaChannel1WholeNote
breakOrLoop
; Measure 46
    transpose gs4-a4
    goto greatSeaChannel1WholeNote
; Measure 47
    transpose 0
    goto greatSeaChannel1WholeNote
; Measure 48
    goto greatSeaChannel1WholeNote

; Measure 49-50
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure50b
; Measure 51b-52
    transpose e4-a4
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
    goto greatSeaChannel1Measure52d
; Measure 53-56
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote

    goto greatSeaChannel1Measure54b
    goto greatSeaChannel1WholeNote
    vol $0
    beat gs2 HF
; Measure 57
    transpose b4-fs4
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNoteD4
; Measure 58b
    goto greatSeaChannel1Measure50b
; Measure 59b-60
    transpose 0
    goto greatSeaChannel1WholeNote
    beat a Q+HF
; Measure 61-62
    transpose d4-b3
    goto greatSeaChannel1Measure38
    transpose fs4-a4
    goto greatSeaChannel1WholeNote
    octave 4
    beat a Q+HF
; Measure 63
    transpose d4-b3
    goto greatSeaChannel1Measure38
    transpose fs4-cs4
    goto greatSeaChannel0DotHalfNote
; Measure 64
    transpose e4-a4
    goto greatSeaChannel1WholeNote

; Measure 49-50
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure50b
; Measure 51b-52
    transpose e4-a4
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
    goto greatSeaChannel1Measure52d
; Measure 53-56
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote

    goto greatSeaChannel1Measure54b
    goto greatSeaChannel1WholeNote
    vol $0
    beat gs2 HF
; Measure 57
    transpose b4-fs4
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNoteD4
; Measure 58b
    goto greatSeaChannel1Measure50b

; Measure 65b
    transpose 0
    env $0 $00
    octave 4
    beat a HF+E1 ou d E2
; Measure 66
    goto greatSeaChannel1WholeNoteD4
; Measure 67-69
    goto greatSeaChannel1Measure37
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure38b
    goto greatSeaChannel0DotHalfNote
; Measure 70
    transpose g4-a4
    goto greatSeaChannel1WholeNote

; Measure 71
    transpose fs4-a4
    goto greatSeaChannel1WholeNote
; Measure 72
    transpose gs4-a4
    goto greatSeaChannel1WholeNote
; Measure 73-75
beginLoop 3
    transpose 0
    goto greatSeaChannel1WholeNote
breakOrLoop
; Measure 76
    transpose gs4-a4
    goto greatSeaChannel1WholeNote
; Measure 77
    transpose 0
    goto greatSeaChannel1WholeNote
; Measure 78
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure9Loop
    cmdff

greatSeaChannel1WholeNoteD4:
    transpose d4-a4
greatSeaChannel1WholeNote:
; Measure 1
    vol HI_VOL
    env $0 $00
    vibrato $e1
    octave 4
    beat a HF+E1
    vol LO_VOL
    vibrato $01
    beat a E2+E1
    vol LO_VOL-1
    beat a E2
    endSec

greatSeaChannel0DotHalfNote:
; Measure 2
    vol HI_VOL
    env $0 $00
    vibrato $e1
    octave 4
    beat cs Q+E1
    vol LO_VOL
    vibrato $01
    beat cs E2+E1
    vol LO_VOL-1
    beat cs E2
    endSec

greatSeaChannel1Measure9:
; Measure 9,25
    vibrato $00
    vol HI_VOL
    duty $03
    beat fs S1 r S2+S3 d S4
    transpose a3-a4
    endSec

greatSeaChannel1Measure10b:
; Measure10b,26b
    beat a Q+E1 r E2
; Measure 10d,26d
    octave 4
    vibrato $00
    env $0 $03
    vol HI_VOL
    transpose 0
    beat d S1 od a S2 ou d S3 fs S4
    endSec

greatSeaChannel1Measure12:
; Measure 12,28
    octave 4
    beat a HF+E1 r E2
    vol HI_VOL
    vibrato $00
    beat a E1 g S3 fs S4
    endSec

greatSeaChannel1Measure15c:
; Measure 15c,31c
    octave 4
    transpose 0
    env $0 $03
    vibrato $00
    vol HI_VOL
    beat a R1 a R2 a R3
    endSec

greatSeaChannel1Measure17:
; Measure 17,33
    transpose 0
greatSeaChannel1Measure38:
; Measure 38
    vibrato $00
    vol HI_VOL
    octave 3
    beat b S1 r S2 b S3 ou cs S4
    endSec

greatSeaChannel1Measure18d:
; Measure 18d
    octave 4
    vol HI_VOL
    vibrato $00
    beat b Q
    endSec

greatSeaChannel1Measure37:
; Measure 37 
    vol HI_VOL
    vibrato $00
    transpose f4-a4
    octave 4
    beat fs S1 r S2 fs S3 gs S4
    endSec

greatSeaChannel1Measure38b:
; Measure 38b
    beat a Q+HF
; Measure 39
    vol HI_VOL
    vibrato $00
    octave 4
    beat fs S1 r S2 fs S3 gs S4
    transpose f4-cs4
    endSec


greatSeaChannel1Measure50b:
; Measure 50b
    vol $0
    beat gs2 HF
    octave 5 ;transpose 0
    vol HI_VOL
    vibrato $00
    env $0 $07
    beat d E1 fs E2
; Measure 51
    beat fs E1 e S3 ds S4
    endSec

greatSeaChannel1Measure52d:
; Measure 52d
    vol $0
    beat gs2 E1
    octave 4 
    vol HI_VOL
    beat g E2
    endSec

greatSeaChannel1Measure54b:
; Measure 54b
    vol $0
    beat gs2 Q+E1
; Measure 54c
    transpose 0
    env $0 $03
    vibrato $00
    vol HI_VOL
    beat d E2 
    beat d S1 e S2 fs S3 g S4
; Measure 55-56
    env $0 $00
    beat a Q+E1 g S3 fs S4
    transpose g4-a4
    endSec

.redefine HI_VOL $4
.redefine LO_VOL $2
greatSeaChannel1HalfNote:
; Measure 14
    vol HI_VOL
    env $0 $00
    vibrato $01
    octave 4
    beat a Q+E1
    vol LO_VOL
    beat a S3
    vol LO_VOL-1
    beat a S4
    endSec

greatSeaChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 1
    duty $01
    goto greatSeaChannel1WholeNoteD4
; Measure 2
    transpose 0
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 3
    transpose c4-a4
    goto greatSeaChannel1WholeNote
; Measure 4
    transpose b3-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 5
    goto greatSeaChannel1WholeNoteD4
; Measure 6
    transpose 0
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 7
    transpose as3-a4
    goto greatSeaChannel1WholeNote
; Measure 8
    transpose c4-a4
    goto greatSeaChannel1WholeNote

greatSeaChannel0Measure9Loop:
; Measure 9
    goto greatSeaChannel0Measure9
    goto greatSeaChannel1WholeNote
; Measure 10b
    octave 4
    beat a Q+E1 r E2+Q
; Measure 11
    transpose e4-a4
    goto greatSeaChannel1WholeNote
; Measure 12
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
    beat r Q
; Measure 13
    transpose b3-a4
    goto greatSeaChannel1WholeNote
; Measure 14
    goto greatSeaChannel1HalfNote
    octave 4
    beat a HF
; Measure 15
    goto greatSeaChannel1WholeNoteD4
; Measure 16
    transpose cs4-a4
    goto greatSeaChannel1WholeNote
; Measure 17
    vol $0
    beat gs2 W
; Measure 18-19
    goto greatSeaChannel1Measure17
    octave 4
    beat d HF r Q+W
; Masure 20
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 21
    vol $0
    beat gs2 W
; Measure 22-23
    goto greatSeaChannel1Measure17
    octave 4
    beat d HF r Q+W
; Measure 24
    transpose cs4-a4
    goto greatSeaChannel1WholeNote

; Measure 25 (M9)
    goto greatSeaChannel0Measure9
    goto greatSeaChannel1WholeNote
; Measure 26b (M10b)
    goto greatSeaChannel1HalfNote
    beat r Q
; Measure 27 (M11)
    transpose e4-a4
    goto greatSeaChannel1WholeNote
; Measure 28 (M12)
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
    beat r Q
; Measure 29 (M13)
    transpose b3-a4
    goto greatSeaChannel1WholeNote
; Measure 30 (M14)
    goto greatSeaChannel1WholeNote
; Measure 31 (M15)
    goto greatSeaChannel1WholeNoteD4
; Measure 32 (M16)
    transpose cs4-a4
    goto greatSeaChannel1WholeNote
; Measure 33 (M17)
    vol $0
    beat gs2 W
; Measure 34 (M18)
    goto greatSeaChannel1Measure17
    octave 4
    beat d HF r Q+HF+Q
; Measure 35d 
    vol HI_VOL
    beat e Q
; Measure 36
    goto greatSeaChannel1WholeNoteD4
; Measure 37
    vol $0
    beat gs2 W
; Measure 38-39
beginLoop 2
    vol HI_VOL
    transpose as3-b3
    goto greatSeaChannel1Measure38
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
breakOrLoop
; Measure 40
    transpose e4-a4
    goto greatSeaChannel1WholeNote

; Measure 41
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 42
    transpose b3-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 43
    goto greatSeaChannel1WholeNoteD4
; Measure 44
    transpose 0
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 45
    goto greatSeaChannel1WholeNoteD4
; Measure 46
    transpose b3-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 47
    goto greatSeaChannel1WholeNoteD4
; Measure 48
    transpose cs4-a4
    goto greatSeaChannel1WholeNote

; Measure 49
    vol $0
    beat gs2 W
; Measure 50-51
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure50b
; Measure 51b-53
    transpose e4-a4
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
    goto greatSeaChannel1Measure52d
; Measure 54-57
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote

    goto greatSeaChannel1Measure54b
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
; Measure 58
    transpose b4-fs4
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNoteD4
; Measure 59b
    goto greatSeaChannel1HalfNote
    beat r E1
    vol HI_VOL
    octaveu
    beat cs E2
; Measure 60
    goto greatSeaChannel1WholeNote
; Measure 61
    vol $0
    beat gs2 Q
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
; Measure 62-63
beginLoop 2
    goto greatSeaChannel1Measure17
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
breakOrLoop
; Measure 64
    transpose cs4-a4
    goto greatSeaChannel1WholeNote

; skip to M49
; Measure 49
    vol $0
    beat gs2 W
; Measure 50-51
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1Measure50b
; Measure 51b-53
    transpose e4-a4
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
    goto greatSeaChannel1Measure52d
; Measure 54-57
    transpose 0
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNote

    goto greatSeaChannel1Measure54b
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel1HalfNote
; Measure 58
    transpose b4-fs4
    goto greatSeaChannel1Measure9
    goto greatSeaChannel1WholeNoteD4
; Measure 59b
    goto greatSeaChannel1HalfNote 
    beat r Q

; skip to M66
; Measure 66
    transpose 0
    goto greatSeaChannel1WholeNote
; Measure 67
    vol $0
    beat gs2 W
; Measure 68-69
beginLoop 2
    transpose as3-b3
    goto greatSeaChannel1Measure38
    transpose d4-cs4
    goto greatSeaChannel0DotHalfNote
breakOrLoop
; Measure 70
    transpose e4-a4
    goto greatSeaChannel1WholeNote

; Measure 71
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 72
    transpose b3-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d
; Measure 73
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 74
    transpose 0
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d    
; Measure 75
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 76
    transpose b3-cs4
    goto greatSeaChannel0DotHalfNote
    goto greatSeaChannel0Measure2d  
; Measure 77
    transpose a3-a4
    goto greatSeaChannel1WholeNote
; Measure 78
    transpose cs4-a4
    goto greatSeaChannel1WholeNote
    goto greatSeaChannel0Measure9Loop
    cmdff

greatSeaChannel0Measure2d:
    transpose 0
    octave 3
    vol HI_VOL
    beat a S1 r S2+S3 a S4
    endSec

greatSeaChannel0Measure9:
; Measure 9,25
    octave 4
    transpose 0
    vibrato $00
    vol HI_VOL
    duty $01
    beat d S1 r S2+S3 od a S4
    transpose fs3-a4
    endSec

greatSeaChannel4:
	.redefine HI_VOL $0a
	.redefine LO_VOL $0e

; Measure 1-8
    goto greatSeaChannel4Measure1

greatSeaChannel4Measure9Loop:
	.redefine HI_VOL $0e
	.redefine LO_VOL $0f
; Measure 9-10
    goto greatSeaChannel4Measure9
; Measure 11-12
    goto greatSeaChannel4Measure11
; Measure 13-14
    goto greatSeaChannel4Measure9G2
; Measure 15-16
    transpose a2-d2
    goto greatSeaChannel4Measure9
; Measure 17-18
    goto greatSeaChannel4Measure9G2
; Measure 19-20
    transpose 0
    goto greatSeaChannel4Measure11
; Measure 21-22
    transpose e2-d2
    goto greatSeaChannel4Measure9
; Measure 23-24
    transpose a2-d2
    goto greatSeaChannel4Measure9

; Measure 25-26
    transpose 0
    goto greatSeaChannel4Measure9
; Measure 27-28
    goto greatSeaChannel4Measure11
; Measure 29-30
    goto greatSeaChannel4Measure9G2
; Measure 31-32
    transpose a2-d2
    goto greatSeaChannel4Measure9
; Measure 33-34
    goto greatSeaChannel4Measure9G2
; Measure 35-36
    goto greatSeaChannel4Measure35
; Measure 37-38
    transpose as2-d2
    goto greatSeaChannel4Measure9
; Measure 39-40
    transpose c3-d2
    goto greatSeaChannel4Measure9

; Measure 41-48
    goto greatSeaChannel4Measure1

; Measure 49-50
    goto greatSeaChannel4Measure9
; Measure 51-52
    transpose cs2-fs2
    goto greatSeaChannel4Measure11
; Measure 53-54
    goto greatSeaChannel4Measure53 
; Measure 55-56
    transpose b1-fs2
    goto greatSeaChannel4Measure11
; Measure 57-58
    goto greatSeaChannel4Measure9G2

; Measure 59-60
    goto greatSeaChannel4Measure35
; Measure 61-62
    transpose e2-d2
    goto greatSeaChannel4Measure9
; Measure 63-64
    transpose a2-d2
    goto greatSeaChannel4Measure9

; Measure 49-50
    transpose 0
    goto greatSeaChannel4Measure9
; Measure 51-52
    transpose cs2-fs2
    goto greatSeaChannel4Measure11
; Measure 53-54
    goto greatSeaChannel4Measure53
; Measure 55-56
    transpose b1-fs2
    goto greatSeaChannel4Measure11
; Measure 57-58
    goto greatSeaChannel4Measure9G2

; Measure 65-66
    goto greatSeaChannel4Measure35
; Measure 67-68
    transpose as2-d2
    goto greatSeaChannel4Measure9
; Measure 69-70
    transpose c3-d2
    goto greatSeaChannel4Measure9

; Measure 71-78
    goto greatSeaChannel4Measure1
    goto greatSeaChannel4Measure9Loop
    cmdff


	.redefine HI_VOL $0a
	.redefine LO_VOL $0e
greatSeaChannel4Measure1:
; Measure 1-8
    transpose 0
beginLoop 8
    octave 2
    duty HI_VOL
    beat d E1 a E2 ou d E1 e E2+E1
    beat d E2+E1 od a E2
breakOrLoop
    endSec

	.redefine HI_VOL $0e
	.redefine LO_VOL $0f
greatSeaChannel4Measure9G2:
    transpose g2-d2
greatSeaChannel4Measure9:
; Measure 9-10
beginLoop 2
    octave 2
    duty HI_VOL
    beat d Q
    duty LO_VOL
    beat d E1
    duty HI_VOL

    octaveu
    beat d E2
    duty LO_VOL
    beat d E1
    duty HI_VOL
    beat d Y1+Y2 r Y3
    beat d E1 od a E2
breakOrLoop
    endSec
greatSeaChannel4Measure11:
; Measure 11-12
beginLoop 2
    octave 2
    duty HI_VOL
    beat fs Q
    duty LO_VOL
    beat fs E1
    duty HI_VOL

    octaveu
    beat fs E2
    duty LO_VOL
    beat fs E1
    duty HI_VOL
    beat fs Y1+Y2 r Y3
    beat fs E1 d E2
breakOrLoop
    endSec

greatSeaChannel4Measure35:
    transpose 0
; Measure 35
    octave 2
    duty HI_VOL
    beat fs Q
    duty LO_VOL
    beat fs E1
    duty HI_VOL

    octaveu
    beat fs E2
    duty LO_VOL
    beat fs E1
    duty HI_VOL
    beat fs Y1+Y2 r Y3
    beat fs E1 d E2
; Measure 36
    octave 2
    duty HI_VOL
    beat b Q
    duty LO_VOL
    beat b E1
    duty HI_VOL

    octaveu
    beat b E2
    duty LO_VOL
    beat b E1
    duty HI_VOL
    beat b Y1+Y2 r Y3
    beat b E1 d E2
    endSec

greatSeaChannel4Measure53:
; Measure 53-54
transpose 0
beginLoop 2
    octave 2
    duty HI_VOL
    beat c Q
    duty LO_VOL
    beat c E1
    duty HI_VOL

    octaveu
    beat c E2
    duty LO_VOL
    beat c E1
    duty HI_VOL
    beat c Y1+Y2 r Y3
    beat c E1 od a E2
breakOrLoop  
    endSec

greatSeaChannel6:
    cmdff