dragonRoostIslandStart:
.redefine TEMPO_1 120
.redefine TEMPO_2 TEMPO_1*3/2
	tempo TEMPO_1

dragonRoostIslandChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $4
	.redefine VIBRATO $e1
	; Measure 1-4
		transpose 0
		tempo TEMPO_1
		octave 4
		vol LO_VOL
		duty $02
		env $0 $04
	
		beat d R1 d Y3 d Y4 d R3
		beat d Q+HF r W

; Measure 5-6
	transpose 17
	goto dragonRoostIslandChannel0WholeStepDown
; Measure 7
	transpose 10
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 8-24a
	goto dragonRoostIslandChannel1Measure8
	goto dragonRoostIslandChannel1Measure8b
; Measure 24a
	tempo TEMPO_1
	octave 5
	beat ds R3 ds R1 ds R2 ds R3
; Measure 25-26
	transpose 5
	goto dragonRoostIslandChannel0ThirdDown

dragonRoostIslandChannel1Loop:
; Measure 27-28
	transpose 17
	goto dragonRoostIslandChannel0WholeStepDown
; Measure 29
	transpose 10
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 30-46a
	goto dragonRoostIslandChannel1Measure8
	goto dragonRoostIslandChannel1Measure8b
; Measure 46a
	tempo TEMPO_1
	octave 5
	beat ds Y5 ds Y6
	beat ds R1 d R2 d R3
; Measure 47
	transpose 3
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 48
	transpose 0
	octave 5
	beat c R1 c Y3 c Y4 c Y5 c Y6
	beat c R1 c R2
; Melody 
	env $1 $00
	vol HI_VOL
	beat f R3
; Measure 49
	beat as Y1
	vibrato VIBRATO
	beat g Y2+R2+R3+R1
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat g R2+R3
	vol LO_VOL-2
	beat g R1+R2

	vibrato $00
	env $0 $04
	vol LO_VOL
	beat g R3 g R1+R2 g R3
; Measure 50-56
	transpose 17
beginLoop 3
	goto dragonRoostIslandChannel0WholeStepDown
breakOrLoop
; Measure 57
	transpose 10
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 58
	goto dragonRoostIslandChannel1Measure8
; Measure 58b-63b
	goto dragonRoostIslandChannel1Measure58b
; Measure 63b-64
	octave 6
	env $0 $00
	beat c Y6
	vol LO_VOL
	beat c Q
	vol LO_VOL-2
	beat c R1+R2

	vol HI_VOL
	env $1 $00
	vibrato VIBRATO
	beat od as R3
; Measure 65-66b
	beat ou c HF
	vibrato $01
	env $0 $00
	vol LO_VOL	
	beat c R1+R2
	vol LO_VOL-2	
	beat c R3+R1 r R2
; Measure 66b-71b
	goto dragonRoostIslandChannel1Measure58b
	octave 6
	vibrato VIBRATO
	beat d Y6
; Measure 72
	beat c Q
	vibrato $01
	vol LO_VOL	
	beat c R1+R2
	
	vol HI_VOL
	env $1 $00
	vibrato VIBRATO
	beat od as R3 
; Measure 73-74
	beat ou c Q
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat c Q
	vol LO_VOL-2	
	beat c R1+R2

	vibrato $00
	env $0 $04
	vol LO_VOL
	octaved
	beat g R3 g R1+R2 g R3
; Measire 75-76
	transpose 10
	goto dragonRoostIslandChannel0TwoSixteenth
	goto dragonRoostIslandChannel0FourSixteenth
	
	goto dragonRoostIslandChannel1Loop

dragonRoostIslandChannel1Measure8:
; Measure 8
	octave 5
	transpose 0
	beat f R1 f R2 f R3
	beat f Y1 f Y2 f R2

	vol HI_VOL
	env $1 $00
	;duty $02

	endSec

dragonRoostIslandChannel1Measure8b:
; Measure 8d
; Melody
	beat d R3
; Measure 9
	beat a Y1 as Y2+R2+R3
	beat a R1 as R2 g Y1 r Y2
; Measure 10
	beat ou c Q od a Q
; Measure 11
	beat a Y1

	vibrato VIBRATO
	beat g Y2+R2+R3
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat g R1+R2
	vol LO_VOL-2
	beat g R3
; Measure 12
	vol HI_VOL
	vibrato VIBRATO
	env $1 $00
	beat d Q
	vol LO_VOL
	vibrato $01
	env $0 $00
	beat d R1
	
	vol HI_VOL
	vibrato $00
	env $1 $00
	beat f R2 d Y5 r Y6
; Measure 13
	beat a Y1 as Y2+R2+R3
	beat a R1 as R2 g Y1 r Y2
; Measure 14
	beat as Y1 ou c Y2+R2+R3 f Q
; Measure 15-16
	vibrato VIBRATO
	beat d HF
	vibrato $01
	env $0 $00
	vol LO_VOL	
	beat d R1+R2
	vol LO_VOL-2	
	beat d R3+R1
	
	vol HI_VOL
	vibrato $00
	env $1 $00	
	beat od as R2 as R3
; Measure 17-18
	beat ou c R1+R2+Y5 d Y6

	vibrato VIBRATO
	beat c Q
	vibrato $01
	env $0 $00
	vol LO_VOL	
	beat c R1+R2
	vol LO_VOL-2
	beat c R3+R1
	
	vol HI_VOL
	vibrato $00
	env $1 $00	
	beat od gs R2 ou c Y5 r Y6
; Measure 19-20
	beat od as Q

	vibrato VIBRATO
	beat g Q+Y1
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat g Y2+R2
	vol LO_VOL-2	
	beat g R3+Y1 r Y2

	vol HI_VOL
	vibrato $00
	env $1 $00		
	beat g R2 as Y5 r Y6
; Measure 21-22
	beat ou c R1+R2+Y5 d Y6

	vibrato VIBRATO
	beat c Q+R1+R2
	vibrato $01
	env $0 $00
	vol LO_VOL	
	beat c R3+R1
	vol LO_VOL-2
	beat c R2
	
	vol HI_VOL
	vibrato $00
	env $1 $00	
	beat od as R3
; Measure 23-24a
	vibrato VIBRATO
	beat g Q+R1
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat g R2+R3
	vol LO_VOL-2	
	beat g R1+R2

	vibrato $00
	env $0 $04
	vol LO_VOL
	endSec

dragonRoostIslandChannel1Measure58b:
; Measure 58b
	tempo TEMPO_1
	octave 6
	vibrato VIBRATO
	env $1 $00
	vol HI_VOL
	beat d R3 
; Measure 59-60
	vibrato VIBRATO
	beat g Q f Q d Q od as Q
; Measure 61-62
	beat ou c Q+R1
	vibrato $01
	env $0 $00
	vol LO_VOL
	beat c R2+R3+R1
	vol LO_VOL-2
	beat c R2+R3

	vol HI_VOL
	env $1 $00
	beat d R1 od g R2 as R3
; Measure 63
	beat ou c Q+R1+R2+Y5

	endSec

	cmdff

dragonRoostIslandChannel0:
.redefine HI_VOL $4
.redefine LO_VOL $2
; Measure 1-4
	transpose 0
	tempo TEMPO_1
	octave 3
	vol HI_VOL
	duty $02
	env $0 $04

	beat a R1 a Y3 a Y4 a R3
	beat a Q+HF r W
; Measure 5-8
.rept 2
	goto dragonRoostIslandChannel0WholeStepDown
.endr
; Measure 9-14
	goto dragonRoostIslandChannel0HalfStepDown
	goto dragonRoostIslandChannel0WholeStepUp
	goto dragonRoostIslandChannel0HalfStepDown
; Measure 15-16
	goto dragonRoostIslandChannel0ThirdDown
; Measure 17
	transpose 12
	goto dragonRoostIslandChannel0NoSixteenth
; Measure 18-19
	transpose 10
	goto dragonRoostIslandChannel0WholeStepDown
; Measure 20-21
	transpose 12
	goto dragonRoostIslandChannel0WholeStepDown
; Measure 22-23
	transpose 7
	goto dragonRoostIslandChannel0WholeStepDown
; Measure 24-26
	transpose 1
beginLoop 3
	goto dragonRoostIslandChannel0TwoSixteenth
breakOrLoop

dragonRoostIslandChannel0Loop:
; Measure 27-32
	transpose 0
beginLoop 3
	goto dragonRoostIslandChannel0HalfStepDown
breakOrLoop
; Measure 33-38
	goto dragonRoostIslandChannel0WholeStepUp
	goto dragonRoostIslandChannel0HalfStepDown
	goto dragonRoostIslandChannel0ThirdDown
; Measure 39-40
	transpose 12
.rept 2
	goto dragonRoostIslandChannel0NoSixteenth
.endr
; Measure 41-42
	transpose 0
.rept 2
	goto dragonRoostIslandChannel0QuarterBeat
.endr
; Measure 43-44
.rept 2
	goto dragonRoostIslandChannel0TwoSixteenth
.endr
; Measure 45
	transpose -2
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 46
	transpose 1
	goto dragonRoostIslandChannel0FourSixteenth
; Measure 47-48
	transpose -5
	goto dragonRoostIslandChannel0TwoSixteenth
	goto dragonRoostIslandChannel0FourSixteenth
; Measure 49-50
	transpose 2
.rept 2
	goto dragonRoostIslandChannel0QuarterBeat
.endr
; Measure 51-58
	transpose 0
beginLoop 4
	goto dragonRoostIslandChannel0HalfStepDown
breakOrLoop
; Measure 59
	transpose 5
	goto dragonRoostIslandChannel0QuarterBeat
; Measure 60-61
	goto dragonRoostIslandChannel0HalfStepDown
; Measure 62
	goto dragonRoostIslandChannel0FourSixteenth
; Measure 63-64
	goto dragonRoostIslandChannel0ThirdDown
; Measure 65
	transpose 17
	goto dragonRoostIslandChannel0NoSixteenth
; Measure 66
	transpose 0
	goto dragonRoostIslandChannel0TwoSixteenth
; Measure 67
	transpose 5
	goto dragonRoostIslandChannel0ThirdDown
; Measure 69-70
beginLoop 2
	goto dragonRoostIslandChannel0TwoSixteenth
	goto dragonRoostIslandChannel0FourSixteenth
; Measure 71-72
	transpose 7
breakOrLoop
; Measure 73-74
	transpose 5
	goto dragonRoostIslandChannel0ThirdDown
; Measure 75-76
	transpose -1
	goto dragonRoostIslandChannel0TwoSixteenth
	goto dragonRoostIslandChannel0FourSixteenth

	goto dragonRoostIslandChannel0Loop

dragonRoostIslandChannel0HalfStepDown:
	tempo TEMPO_1
	octave 4
.rept 2
	beat as R1 as R2 as R3
.endr

dragonRoostIslandChannel0TwoSixteenth:
	beat a R1 a Y3 a Y4 a R3
	beat a R1 a R2 a R3

	endSec

dragonRoostIslandChannel0WholeStepUp:
	tempo TEMPO_1
	octave 4
	beat g R1 g R2 g R3
	beat g Y1 g Y2 g R2 g R3

dragonRoostIslandChannel0FourSixteenth:
	beat a R1 a Y3 a Y4 a Y5 a Y6
	beat a R1 a R2 a R3

	endSec

dragonRoostIslandChannel0WholeStepDown:
	tempo TEMPO_1
	octave 4
	beat d R1 d R2 d R3
	beat d Y1 d Y2 d R2 d R3

dragonRoostIslandChannel0NoSixteenth:	
.rept 2
	beat c R1 c R2 c R3
.endr

	endSec

dragonRoostIslandChannel0ThirdDown:
	tempo TEMPO_1
	octave 5
	beat d R1 d R2 d R3
	beat d Y1 d Y2 d R2 d R3

dragonRoostIslandChannel0QuarterBeat:
	octaved
	beat as R1 as R2+R3
	beat as R1 as R2 as R3

	endSec


	cmdff

dragonRoostIslandChannel4:
.redefine HI_VOL $0e
.redefine LO_VOL $0f

	tempo TEMPO_2
; Measure 1
	transpose 0
	octave 3
	duty HI_VOL
	beat d E1+S3
	duty LO_VOL
	beat d S4

	duty HI_VOL
	beat d Q+E1
	duty LO_VOL
	beat d E2
; Measure 2-4
	beat r 3*(HF+Q)
; Measure 5-14
beginLoop 5	
	transpose 0
	goto dragonRoostIslandChannel4Measure5
	transpose -2
	goto dragonRoostIslandChannel4Measure6
breakOrLoop
; Measure 15-18
	transpose 3
beginLoop 2
	goto dragonRoostIslandChannel4Measure5
	goto dragonRoostIslandChannel4Measure6
	transpose 1
breakOrLoop
; Measure 19-22
	transpose 0
beginLoop 2
	goto dragonRoostIslandChannel4Measure5
	goto dragonRoostIslandChannel4Measure6
	transpose -2
breakOrLoop
; Measure 23-25
	transpose -4
	goto dragonRoostIslandChannel4Measure5
	goto dragonRoostIslandChannel4Measure6
	goto dragonRoostIslandChannel4Measure5

; Measure 26
	tempo TEMPO_2
	octave 3
	transpose 0
	duty HI_VOL
	beat f S1 g S2+E2 ds Q

	octaved
	beat as S1 r S2 f S3 r S4

dragonRoostIslandChannel4Loop:
	transpose 0
; Measure 27-34
beginLoop 2
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure28
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure30
breakOrLoop	
; Measure 35-36
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure28
; Measure 37-38
	transpose -2
	goto dragonRoostIslandChannel4Measure27
; Measure 38
	tempo TEMPO_2
	octave 3
	duty HI_VOL
	beat c S1
	duty LO_VOL
	beat c S2

	duty HI_VOL
	beat c S3 r S4

	beat c E1
	duty LO_VOL
	beat c E2	

	duty HI_VOL
	beat g E1
	duty LO_VOL
	beat g E2
; Measure 39-42
	transpose 1
	goto dragonRoostIslandChannel4Measure27
	transpose 3
	goto dragonRoostIslandChannel4Measure28
	transpose 0
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure42
; Measure 43-45
	transpose -2
	goto dragonRoostIslandChannel4Measure27
	transpose 0
	goto dragonRoostIslandChannel4Measure28
	transpose -4
	goto dragonRoostIslandChannel4Measure27
; Measure 46
	tempo TEMPO_1
	octave 3
	duty HI_VOL
	beat a R1 g R2 fs Y5 r Y6
	beat g R1 fs R2+Y5 r Y6
; Measure 47-50
	transpose 5
	goto dragonRoostIslandChannel4Measure27
	transpose 0
	goto dragonRoostIslandChannel4Measure48
; Measure 51-58
beginLoop 2
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure28
	goto dragonRoostIslandChannel4Measure27
	goto dragonRoostIslandChannel4Measure30
breakOrLoop	
; Measure 59-60
	goto dragonRoostIslandChannel4Measure59
	goto dragonRoostIslandChannel4Measure60
; Measure 61-62
	transpose -1
	goto dragonRoostIslandChannel4Measure59
	transpose 0
	goto dragonRoostIslandChannel4Measure30
; Measure 63-65
	transpose -3
	goto dragonRoostIslandChannel4Measure59
	transpose 5
	goto dragonRoostIslandChannel4Measure42
; Measure 65-66
	transpose -1
	goto dragonRoostIslandChannel4Measure59
	transpose 0
	goto dragonRoostIslandChannel4Measure30
; Measure 67-68
	goto dragonRoostIslandChannel4Measure59
	goto dragonRoostIslandChannel4Measure60
; Measure 69-70
	transpose -1
	goto dragonRoostIslandChannel4Measure59
	transpose 0
	goto dragonRoostIslandChannel4Measure30
; Measure 71
	transpose 5
	goto dragonRoostIslandChannel4Measure27
; Measure 72-74
	transpose 0
	goto dragonRoostIslandChannel4Measure48
; Measure 75
	tempo TEMPO_1
	octave 2
	duty HI_VOL
	beat gs R1 
	duty LO_VOL
	beat gs R2

	duty HI_VOL
	beat gs Y5
	beat LO_VOL
	beat gs Y6

	octaveu
	duty HI_VOL
	beat ds R1
	duty LO_VOL
	beat ds R2

	octaved
	duty HI_VOL
	beat gs R3

; Measure 76
	transpose 1
	goto dragonRoostIslandChannel4Measure42

	goto dragonRoostIslandChannel4Loop

dragonRoostIslandChannel4Measure5:
; Measure 5
	tempo TEMPO_1
	octave 2
	duty HI_VOL
	beat g Y1
	duty LO_VOL
	beat g Y2 r R2+R3

	octaveu
	duty HI_VOL
	beat d Y1
	duty LO_VOL
	beat d Y2 r R2

	duty HI_VOL
	beat g Y5
	duty LO_VOL
	beat g Y6

	endSec

dragonRoostIslandChannel4Measure6:
; Measure 6
	tempo TEMPO_2
	octaved
	duty HI_VOL
	beat g S1
	duty LO_VOL
	beat g S2 r E2

	octaveu
	duty HI_VOL
	beat d S1
	duty LO_VOL
	beat d S2 r E2

	duty HI_VOL
	beat g S1
	duty LO_VOL
	beat g S2 r E2
	
	endSec

dragonRoostIslandChannel4Measure27:
; Measure 27
	tempo TEMPO_1
	octave 2
	duty HI_VOL
	beat g R1 
	duty LO_VOL
	beat g Y3 r Y4

	duty HI_VOL
	beat g Y5
	beat LO_VOL
	beat g Y6

	octaveu
	duty HI_VOL
	beat d R1
	duty LO_VOL
	beat g Y3 r Y4
	duty HI_VOL
	beat g R3

	endSec

dragonRoostIslandChannel4Measure28:
	tempo TEMPO_2
	octave 2
	duty HI_VOL
	beat f E1
	duty LO_VOL
	beat f E2
	
	octaveu
	duty HI_VOL
	beat c E1
	duty LO_VOL
	beat c E2	

	duty HI_VOL
	beat f E1
	duty LO_VOL
	beat f E2

	endSec
	
dragonRoostIslandChannel4Measure30:
; Measure 30
	tempo TEMPO_2
	octave 3
	duty HI_VOL
	beat d S1
	duty LO_VOL
	beat d S2

	duty HI_VOL
	beat d S3 r S4

	beat a E1
	duty LO_VOL
	beat a E2	

	duty HI_VOL
	beat d E1
	duty LO_VOL
	beat d E2

	endSec

dragonRoostIslandChannel4Measure42:
; Measure 42
	tempo TEMPO_2
	octave 2
	duty HI_VOL
	beat g E1
	duty LO_VOL
	beat g E2

	octaveu
	duty HI_VOL
	beat d E1
	duty LO_VOL
	beat d E2	

	octaved
	duty HI_VOL
	beat g E1
	duty LO_VOL
	beat g E2

	endSec

dragonRoostIslandChannel4Measure48:
; Measure 48
	tempo TEMPO_1
	octave 4
	duty HI_VOL
	beat d R1 c R2 od g Y5 r Y6
	beat c R1 ou c R2 od c R3
; Measure 49
	tempo TEMPO_2
	octaved
	beat b E1 r E2 b S1 r S2
	beat ou ds E2 r E1 gs S3 r S4	
; Measure 50
	tempo TEMPO_1
	beat as R1 gs R2 od gs Y5 r Y6
	beat gs R1 ou gs R2 od gs R3

	endSec

dragonRoostIslandChannel4Measure59:
; Measure 59
	tempo TEMPO_1
	octave 3
	duty HI_VOL
	beat ds R1 
	duty LO_VOL
	beat ds Y3 r Y4

	duty HI_VOL
	beat ds Y5
	beat LO_VOL
	beat ds Y6

	duty HI_VOL
	beat as R1
	duty LO_VOL
	beat as Y3 r Y4

	octaved
	duty HI_VOL
	beat as R3

	endSec

dragonRoostIslandChannel4Measure60:
; Measure 60
	tempo TEMPO_2
	octave 3
	beat ds E1
	duty LO_VOL
	beat ds E2	

	duty HI_VOL
	beat as S1
	duty LO_VOL
	beat as S2

	duty HI_VOL
	beat as S3 r S4	

	octaved
	duty HI_VOL
	beat as E1
	duty LO_VOL
	beat as E2

	endSec

	cmdff


dragonRoostIslandChannel6:
	.redefine HI_VOL $4
	.redefine LO_VOL $2
	.define HIT     $27

beginLoop 6
	goto dragonRoostIslandChannel6Measure1
breakOrLoop
	goto dragonRoostIslandChannel6Measure25
dragonRoostIslandChannel6Loop:
beginLoop 12
	goto dragonRoostIslandChannel6Measure1
breakOrLoop
	goto dragonRoostIslandChannel6Measure25

	goto dragonRoostIslandChannel6Loop


dragonRoostIslandChannel6Measure1:
; Measure 1
	tempo TEMPO_1
.rept 2
   	vol HI_VOL
   	beat HIT R1
   	vol LO_VOL
   	beat HIT R2
	beat HIT R3
.endr

; Measure 2
tempo TEMPO_2
.rept 3
	vol HI_VOL
	beat HIT E1
	vol LO_VOL
	beat HIT E2
.endr

dragonRoostIslandChannel6Measure25:
; Measure 3
tempo TEMPO_1
.rept 2
   	vol HI_VOL
   	beat HIT R1
   	vol LO_VOL
   	beat HIT R2
	beat HIT R3
.endr
; Measure 4
tempo TEMPO_2
	vol HI_VOL
	beat HIT E1
.rept 2
	vol LO_VOL
	beat HIT S3 HIT S4
	vol HI_VOL
	beat HIT E1
.endr
	vol LO_VOL
	beat HIT E2

	endSec

	cmdff