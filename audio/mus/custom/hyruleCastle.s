hyruleCastleStart:

hyruleCastleChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $4
; Measure 1
	tempo 105
	vol $0
	beat gs3 E2+E1+Y4
; Measure 2
	vol HI_VOL
	octave 5
	env $0 $03
	duty $01
	beat d Y5 d Y6
	beat d E1 c E2
	env $0 $00
	beat d Q ds E1+S3 fs S4
; Measure 3
	vibrato $82
	beat d HF+Q+E1 r E2
; Mesure 4-6
	tempo 135
	vol $0
	beat gs3 W+W+E1

hyruleCastleChannel1Measure6a:
; Measure 6a
	octave 3
	duty $02
	env $0 $03 ; staccato
	vibrato $82
	vol LO_VOL-2
	beat g E2+E1 g E2 f Q 
	vol LO_VOL
	beat f E1 g E2+E1
; Measure 7a
	vol LO_VOL+1
	beat g E2 g E1 g S3 g S4
	vol HI_VOL
	beat g E1 g E2 gs E1 fs E2

; Measure 8
	;vol HI_VOL
beginLoop 2
; Measure 12
	octave 4
	duty $02
	env $0 $00
	beat g Q+E1 fs T5 f T6 e T7 ds T8
	vibrato $82
	beat d HF+Q+E1
; Measure 9b,13b
	vibrato $00
	beat g E2 gs E1 as E2+R1 fs R2 as R3
; Measure 10,14
	beat g Q+E1 fs T5 f T6 e T7 ds T8
	vibrato $82
	beat d HF+Q+E1
; Measure 11b,15b
	octaveu
	vibrato $00
	env $0 $03
	duty $01
	beat d S3 d S4 f E1 f E2
	beat ds S1 d S2 cs S3 c S4
breakOrLoop
; Measure 16
	octave 5
	duty $02
	env $0 $00
	beat c Q+E1 od b T5 as T6 a T7 gs T8
	vibrato $82
	beat g HF+Q+E1
; Measure 17b
	octaveu
	vibrato $00
	beat c E2 f R1+R2 ds R3+R1 cs R2 od b R3
; Measure 18
	octaveu
	beat c Q+E1 od b T5 as T6 a T7 gs T8
	vibrato $82
	beat g HF+Q+E1
; Measure 19b
	octave 5
	vibrato $00
	duty $01
	env $0 $03
	beat g S3 g S4 as E1 as E2
	beat gs S1 g S2 fs S3 f S4
; Measure 20
	octave 4
	duty $02
	env $0 $00
	beat g Q+E1 fs T5 f T6 e T7 ds T8
	vibrato $82
	beat d HF+Q+E1
; Measure 21b
	vibrato $00
	beat g E2 gs E1 as E2+R1 fs R2 as R3
; Measure 22
	beat g Q+E1 fs T5 f T6 e T7 ds T8
	vibrato $82
	beat d HF+Q+E1
; Measure 23b
	octaveu
	vibrato $00
	duty $01
	env $0 $03
	beat d S3 d S4 f E1 f E2
	beat ds S1 d S2 cs S3 c S4	

	env $0 $00
	duty $02
beginLoop 2
; Measure 24,26
	octave 4
	beat f Q+R1 ds R2 d R3
	beat c E1 ds E2 f E1 ou c E2
; Measure 25,27
	octaved
	vibrato $82
	beat g HF+Q+E1 r E2
breakOrLoop
; Measure 28
	vol LO_VOL
	octave 4
	beat f Q+R1 ds R2 d R3
	beat c E1 d E2 f E1 g E2
; Measure 29
	vol LO_VOL+1
	beat as Q+R1 gs R2 g R3
	beat f E1 g E2 gs E1 as E2
; Measure 30
	vol HI_VOL
	octaveu
	beat c Q+R1 od as R2 a R3
	beat g E1 a E2 as E1 ou c E2
; Measure 31
	vol HI_VOL+1
	beat d HF+Q+E1 r E2

; Measure 32
	octave 3
	vibrato $e2
	vol HI_VOL
	beat g HF r E1 a E2 as E1 ou d E2
; Measure 33
	beat cs HF od a HF
; Measure 34
	octaveu
	beat c HF od as R1+R2 fs R3+R1 as R2+R3
; Measure 35
	beat g HF+E1+S3
	vibrato $02
	vol LO_VOL
	beat g S4+Q
; Measure 36
	octave 4
	vibrato $e2
	vol HI_VOL
	beat g HF r E1 a E2 as E1 ou d E2
; Measure 37
	beat cs HF od a HF
; Measure 38
	octaveu
	beat c HF od as R1+R2 fs R3+R1 as R2+R3
; Measure 39
	beat g HF+E1+S3
	vibrato $02
	vol LO_VOL
	beat g S4+Q

; Measure 40
	octave 5
	duty $01
	vibrato $31
	vol HI_VOL
	beat ds Q+E1 
	env $0 $04
	beat ds S3 ds S4
	beat ds E1 c E2 od g E1 ou ds E2
; Measure 41
	env $0 $00
	beat d HF+Q+E1 r E2
; Measure 42
	beat c Q+E1
	env $0 $04
	beat c S3 c S4
	beat c E1 od g E2 ds E1 ou c E2
; Measure 43
	octaved
	env $0 $00
	beat as HF+Q+E1 r E2
; Measure 44
	octave 5
	beat ds Q+E1
	env $0 $04
	beat ds S3 ds S4
	beat ds E1 c E2 od g E1 ou ds E2
; Measure 45
	env $0 $00
	beat d Q+E1
	env $0 $04
	beat d S3 d S4
	beat d E1 od as E2 g E1 ou d E2
; Measure 46
	env $0 $00
	beat c Q+E1
	env $0 $04
	beat c S3 c S4
	beat c E1 od fs E2 ds E1 ou c E2
; Measure 47-49a
	octaved
	env $0 $00
	vibrato $e2
	beat as HF+Q
	vol HI_VOL-1
	vibrato $02
	beat as Q+E1
	vol LO_VOL
	beat as E2+Q r HF+E1
	
	goto hyruleCastleChannel1Measure6a
	cmdff


hyruleCastleChannel0:
	.redefine HI_VOL $6
	.redefine LO_VOL $4
; Measure 1
	tempo 105
	vol $0
	beat gs3 E2+E1+Y4
; Measure 2
	vol HI_VOL
	octave 4
	env $0 $03
	duty $03
	beat g Y5 g Y6
	beat g E1 f E2
	env $0 $00
	beat g Q gs E1+S3 b S4
; Measure 3
	vibrato $82
	beat g HF+Q+E1 r E2

; Measure 4a
	.redefine HI_VOL $5
	.redefine LO_VOL $3

	tempo 135
	vol $0
	beat gs3 E1
	octave 3
	env $0 $03
	duty $03
	vibrato $82
	vol LO_VOL
	beat d E2+E1
hyruleCastleChannel0Measure4b:
	;duty $03
	env $0 $03
	beat d E2 c E1+E2 c E1 d E2+E1
; Measure 5a
	vol LO_VOL+1
	beat d E2 d E1 d S3 d S4
	beat d E1 d E2 ds E1 cs E2+E1
; Measure 6a
	vol HI_VOL
	beat d E2+E1 d E2
	beat c E1+E2 c E1 d E2+E1
; Measure 7a
	vol HI_VOL+1
	beat d E2 d E1 d S3 d S4
	beat d E1 d E2 ds E1 cs E2+E1
	vol HI_VOL
beginLoop 2
; Measure 8a,12a
	beat d E2+E1 d E2
	beat c E1+E2 c E1 d E2+E1
; Measure 9a,13a
	vol HI_VOL+1
	beat d E2 d E1 d S3 d S4
	beat d E1 d E2 ds E1 cs E2+E1
; Measure 10a,14a
	vol HI_VOL
	beat d E2+E1 d E2 c E1+Y4+Y5
	octave 4
	duty $01
	beat g Y6 a Y1 b Y2 ou c Y3 d E2+E1
; Measure 11a,15a
	beat d E2 d E1 
	octave 3
	duty $03
	beat d S3 d S4
	beat d E1 d E2 ds E1 cs E2+E1
breakOrLoop
; Measure 16a
	;vol HI_VOL
	beat g E2+E1 g E2 f E1+E2 f E1 g E2+E1
; Measure 17a
	vol HI_VOL+1
	beat g E2 g E1 g S3 g S4
	beat g E1 g E2 gs E1 fs E2+E1
; Measure 18a
	beat g E2+E1 g E2 f E1+Y4+Y5
	octave 5
	duty $01
	beat c Y6 d Y1 ds Y2 f Y3
	env $0 $00
	beat g E2+Q r E1

; Measure 19b
	vol HI_VOL
	octave 3
	env $0 $03
	duty $03
	beat g S3 g S4
	beat g E1 g E2 gs E1 fs E2+E1
; Measure 20a
	beat d E2+E1 d E2
	beat c E1+E2 c E1 d E2+E1
; Measure 21a
	vol HI_VOL+1
	beat d E2 d E1 d S3 d S4
	beat d E1 d E2 ds E1 cs E2+E1
; Measure 22a
	vol HI_VOL
	beat d E2+E1 d E2 c E1+Y4+Y5
	octave 4
	duty $01
	beat g Y6 a Y1 b Y2 ou c Y3 d E2+E1
; Measure 23a-25
	beat d E2 d E1 
	octave 3
	duty $03
	beat d S3 d S4
	beat d E1 d E2 ds E1 cs E2+W+Q

; Measure 25b-27
	octave 5
	beat d Y1 d Y2 d R2 d R3
	beat d E1 ds E2
	beat f R1 ds R2 d R3+W+Q
; Measure 27b
	beat d Y1 d Y2 d R2 d R3
	beat d E1 ds E2
	beat f R1 ds R2 d R3+HF+R1+R2
; Measure 28c	
	beat f Y5 f Y6
	beat f R1 f R2 f R3
; Measure 29-30
beginLoop 2
	env $0 $00
	vibrato $82
	beat g HF r R1+R2
	env $0 $03
	vibrato $00
	beat g Y5 g Y6
	beat g R1 g R2 g R3
breakOrLoop
; Measure 31
	vol LO_VOL
	env $0 $00
	vibrato $82
	beat g HF fs HF
; Measure 32
	octaved
	env $0 $06
	vibrato $00
	beat as E1 d E2
	beat as R1 as R2 as R3
	beat as E1 d E2 as E1 d E2
; Measure 33
	octaveu
	beat cs E1 od e E2
	octaveu
	beat cs R1 cs R2 cs R3
	beat cs E1 od e E2 ou cs E1 od e E2
; Measure 34
	octaveu
	beat c E1 od ds E2
	octaveu
	beat c R1 c R2 c R3
	beat c E1 od ds E2 ou c E1 od ds E2
; Measure 35
	beat as E1 d E2
	beat as R1 as R2 as R3
	beat as E1 d E2 as E1 d E2
; Measure 36
	beat as E1 d E2
	beat as R1 as R2 as R3
	beat as E1 d E2 as E1 d E2
; Measure 37
	octaveu
	beat cs E1 od e E2
	octaveu
	beat cs R1 cs R2 cs R3
	beat cs E1 od e E2 ou cs E1 od e E2
; Measure 38
	octaveu
	beat c E1 od ds E2
	octaveu
	beat c R1 c R2 c R3
	beat c E1 od ds E2 ou c E1 od ds E2
; Measure 39
	beat as E1 d E2
	beat as R1 as R2 as R3
	octaveu
	beat d E1
	octave 3
	duty $01
	env $0 $00
	beat g Y4 ou c Y5 d Y6
	vol LO_VOL+1
	beat ds Y1 f Y2 a Y3
	vol LO_VOL+2
	beat as Y4 ou c Y5 d Y6
; Measure 40
	octave 5
	vol LO_VOL
	duty $03
	env $0 $06
	beat c E1 od ds E2
	octaveu
	beat c R1 c R2 c R3
	beat c E1 od ds E2 ou c E1 od ds E2
; Measure 41
	beat as E1 d E2
	beat as R1 as R2 as R3
	beat as E1 d E2 as E1 d E2	
; Measure 42
	beat g E1 c E2
	beat g R1 g R2 g R3
	beat g E1 c E2 g E1 c E2
; Measure 43
	beat g E1 od as E2
	octaveu
	beat g R1 g R2 g R3
	beat g E1 od as E2 ou g E1 od as E2	
; Measure 44
	octave 4
	env $0 $06
	duty $03
	vol HI_VOL
	beat g Q+E1 g S3 g S4
	beat g E1 ds E2 c E1 g E2
; Measure 45
	beat f Q+E1 f S3 f S4
	beat f E1 d E2 od as E1 ou f E2
; Measure 46
	beat ds Q+E1 ds S3 ds S4
	beat ds E1 c E2 od a E1 ou ds E2	
; Measure 47
	beat d Q+E1

	goto hyruleCastleChannel0Measure4b
	cmdff

hyruleCastleChannel4:
	.redefine HI_VOL $0a
	.redefine LO_VOL $0e
; Measure 1
	tempo 105
	duty HI_VOL
	octave 2
	beat r Y4 g W9 r W10 g W11 r W12
; Measure 2
	;duty HI_VOL
	beat g HF+E1+S3
	duty LO_VOL
	beat g S4
	duty HI_VOL
	beat gs E1+S3
	duty LO_VOL
	beat gs S4
; Measure 3
	duty HI_VOL
	beat g HF+E1+S3
	duty LO_VOL
	beat g S4+E1 r E2

hyruleCastleChannel4Measure4:
	.redefine HI_VOL $09
	.redefine LO_VOL $08
	tempo 135
	duty HI_VOL
beginLoop 6
; Measure 4,6,8,10,12,14
	beat g HF f HF
; Measure 5,7,9,11,13,15
	beat g HF gs Q fs Q
breakOrLoop
beginLoop 2
; Measure 16,18
	octaveu
	beat c HF od as HF
; Measure 17,19
	octaveu
	beat c HF cs Q od b Q
breakOrLoop
beginLoop 2
; Measure 20,22
	beat g HF f HF
; Measure 21,23
	beat g HF gs Q fs Q
breakOrLoop

	.redefine HI_VOL $0e
	.redefine LO_VOL $09
	duty LO_VOL
beginLoop 2
; Measure 24,26
	octave 2
	beat gs Q+R1 ou ds R2 gs R3 
	octaveu
	beat ds E1 r E2+E1 od od gs S3 r S4
; Measure 25,27
	beat g Q+R1 ou d R2 g R3 
	octaveu
	beat d Q+R1 od od g Y3+W7 r W8 g Y5+W11 r W12
breakOrLoop
; Measue 28
	duty HI_VOL
	beat as Q+R1 ou ds R2 f R3
	beat as Q+E1 od as E2
; Measure 29
	beat gs Q+R1 ou d R2 ds R3
	beat gs Q+R1 od gs Y3+W7 r W8 gs Y3+W11 r W12
; Measure 30
	duty $0a
	beat a Q+R1 ou ds R2 g R3
	beat a Q+E1 od a S3 r S4
; Measure 31
	octaveu
	beat d Q+R1 a R2 ou c R3
	beat d Q+R1 od d Y3+W7 r W8 d Y5+W11 r W12
beginLoop 2

	.redefine HI_VOL $09
	.redefine LO_VOL $08
; Measure 32,36
	octave 2
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 32b
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 32c
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 32d
	duty HI_VOL
	beat g Y1 
	duty LO_VOL
	beat g W3 r W4	

	duty HI_VOL
	beat g Y3
	duty LO_VOL
	beat g W7 r W8

	duty HI_VOL
	beat g Y5 
	duty LO_VOL
	beat g W11 r W12
; Measure 33,37	
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 33b
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 33c
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 33d
	duty HI_VOL
	beat a Y1 
	duty LO_VOL
	beat a W3 r W4	

	duty HI_VOL
	beat a Y3
	duty LO_VOL
	beat a W7 r W8

	duty HI_VOL
	beat a Y5 
	duty LO_VOL
	beat a W11 r W12
; Measure 34,38
	duty HI_VOL
	beat fs S1 
	duty LO_VOL
	beat fs T3 r T4

	duty HI_VOL
	beat fs S3 
	duty LO_VOL
	beat fs T7 r T8
; 34b
	duty HI_VOL
	beat fs S1 
	duty LO_VOL
	beat fs T3 r T4

	duty HI_VOL
	beat fs S3 
	duty LO_VOL
	beat fs T7 r T8
; 34c
	duty HI_VOL
	beat fs S1 
	duty LO_VOL
	beat fs T3 r T4

	duty HI_VOL
	beat fs S3 
	duty LO_VOL
	beat fs T7 r T8
; 34d
	duty HI_VOL
	beat fs Y1 
	duty LO_VOL
	beat fs W3 r W4	

	duty HI_VOL
	beat fs Y3
	duty LO_VOL
	beat fs W7 r W8

	duty HI_VOL
	beat fs Y5 
	duty LO_VOL
	beat fs W11 r W12
; Measure 35,39
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 35b
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 35c
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 35d
	duty HI_VOL
	beat g Y1 
	duty LO_VOL
	beat g W3 r W4	

	duty HI_VOL
	beat g Y3
	duty LO_VOL
	beat g W7 r W8

	duty HI_VOL
	beat g Y5 
	duty LO_VOL
	beat g W11 r W12
breakOrLoop
; Measure 40
	octave 3
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 40b
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 40c
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 40d
	duty HI_VOL
	beat c Y1 
	duty LO_VOL
	beat c W3 r W4	

	duty HI_VOL
	beat c Y3
	duty LO_VOL
	beat c W7 r W8

	duty HI_VOL
	beat c Y5 
	duty LO_VOL
	beat c W11 r W12
; Measure 41
	octave 2
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 41b
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 41c
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 41d
	duty HI_VOL
	beat as Y1 
	duty LO_VOL
	beat as W3 r W4	

	duty HI_VOL
	beat as Y3
	duty LO_VOL
	beat as W7 r W8

	duty HI_VOL
	beat as Y5 
	duty LO_VOL
	beat as W11 r W12	
; Measure 42
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 42b
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 42c
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 42d
	duty HI_VOL
	beat a Y1 
	duty LO_VOL
	beat a W3 r W4	

	duty HI_VOL
	beat a Y3
	duty LO_VOL
	beat a W7 r W8

	duty HI_VOL
	beat a Y5 
	duty LO_VOL
	beat a W11 r W12
; Measure 43
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 43b
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 43c
	duty HI_VOL
	beat g S1 
	duty LO_VOL
	beat g T3 r T4

	duty HI_VOL
	beat g S3 
	duty LO_VOL
	beat g T7 r T8
; 43d
	duty HI_VOL
	beat g Y1 
	duty LO_VOL
	beat g W3 r W4	

	duty HI_VOL
	beat g Y3
	duty LO_VOL
	beat g W7 r W8

	duty HI_VOL
	beat g Y5 
	duty LO_VOL
	beat g W11 r W12
; Measure 44
	octave 3
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 44b
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 44c
	duty HI_VOL
	beat c S1 
	duty LO_VOL
	beat c T3 r T4

	duty HI_VOL
	beat c S3 
	duty LO_VOL
	beat c T7 r T8
; 44d
	duty HI_VOL
	beat c Y1 
	duty LO_VOL
	beat c W3 r W4	

	duty HI_VOL
	beat c Y3
	duty LO_VOL
	beat c W7 r W8

	duty HI_VOL
	beat c Y5 
	duty LO_VOL
	beat c W11 r W12
; Measure 45
	octave 2
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 45b
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 45c
	duty HI_VOL
	beat as S1 
	duty LO_VOL
	beat as T3 r T4

	duty HI_VOL
	beat as S3 
	duty LO_VOL
	beat as T7 r T8
; 45d
	duty HI_VOL
	beat as Y1 
	duty LO_VOL
	beat as W3 r W4	

	duty HI_VOL
	beat as Y3
	duty LO_VOL
	beat as W7 r W8

	duty HI_VOL
	beat as Y5 
	duty LO_VOL
	beat as W11 r W12	
; Measure 46
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 46b
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 46c
	duty HI_VOL
	beat a S1 
	duty LO_VOL
	beat a T3 r T4

	duty HI_VOL
	beat a S3 
	duty LO_VOL
	beat a T7 r T8
; 46d
	duty HI_VOL
	beat a Y1 
	duty LO_VOL
	beat a W3 r W4	

	duty HI_VOL
	beat a Y3
	duty LO_VOL
	beat a W7 r W8

	duty HI_VOL
	beat a Y5 
	duty LO_VOL
	beat a W11 r W12

	goto hyruleCastleChannel4Measure4
	cmdff

hyruleCastleChannel6:
	.redefine HI_VOL $6
	.redefine LO_VOL $4
	.redefine HIT $2a
	.redefine CRASH $52

	tempo 105
; Measure 1
	vol $0
	beat HIT Y4
	vol HI_VOL
	beat HIT Y5 HIT Y6
; Measure 2
	beat CRASH HF+Q
	beat HIT Y1 HIT Y2 HIT Y3 HIT Y4 HIT R3
; Measure 3
	beat HIT Y1 HIT Y2 HIT Y3 HIT Y4 HIT Y5 HIT Y6
	beat HIT Y1 HIT Y2 HIT Y3 HIT Y4 HIT Y5 HIT Y6
	beat HIT Y1 HIT Y2 HIT Y3 HIT Y4 HIT Y5 HIT Y6
	beat HIT R1 HIT R2+R3

; cannot use loops as it can break by Link using stairs
hyruleCastleChannel6Measure4Loop:
	tempo 135
	vol LO_VOL
; Measure 4-23
.rept 10
	goto hyruleCastleChannel6Measure4
.endr

; Measure 24-27
.rept 2
	goto hyruleCastleChannel6Measure24
.endr
; Measure 28-31
	vol HI_VOL
.rept 2
	goto hyruleCastleChannel6Measure24
.endr
; Measure 32-35
	vol LO_VOL
.rept 4
	goto hyruleCastleChannel6Measure32
.endr
; Measure 36-39
	vol HI_VOL
.rept 4
	goto hyruleCastleChannel6Measure32
.endr
; Measure 40-43
	vol HI_VOL+1
.rept 4
	goto hyruleCastleChannel6Measure40
.endr
; Measure 44-45
.rept 3
	goto hyruleCastleChannel6Measure44
.endr

	goto hyruleCastleChannel6Measure4Loop
	cmdff


hyruleCastleChannel6Measure4:
; Measure 4,6,8,10,12,14,16,18,20,22
	beat HIT E1 HIT E2+E1 HIT E2
	beat HIT Q+E1 HIT E2+E1
; Measure 5a,7a,9a,11a,13a,15a,17a,19a,21a,23a
	beat HIT E2 HIT E1 HIT S3 HIT S4
	beat HIT E1 HIT E2 HIT E1 HIT E2

	endSec

hyruleCastleChannel6Measure24:
; Measure 24,26,28,30
	beat HIT HF
	beat HIT E1 HIT E2 HIT E1 HIT E2
; Measure 25,27,29,31
	beat HIT Q+R1 HIT R2 HIT R3
	beat HIT E1 HIT E2
	beat HIT R1 HIT R2 HIT R3

	endSec

hyruleCastleChannel6Measure32:
; Measure 32-35
	beat HIT HF+Q+E1 HIT S3 HIT S4
	endSec

hyruleCastleChannel6Measure40:
; Measure 40-43
	beat HIT Q HIT R1 HIT R2 HIT R3
	beat HIT Q+E1 HIT S3 HIT S4
	endSec

hyruleCastleChannel6Measure44:
; Measure 44-45
	beat HIT Q HIT E1 HIT S3 HIT S4
	beat HIT E1 HIT E2
	beat HIT R1 HIT R2 HIT R3
	endSec