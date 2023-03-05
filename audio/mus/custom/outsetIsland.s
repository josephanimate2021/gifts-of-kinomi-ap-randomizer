outsetIslandStart:
	tempo 120

outsetIslandChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $4

outsetIslandChannel1Measure4Loop:
; Measure 4-8
	vol $0
	beat gs3 W+HF+Q+E1
	goto outsetIslandChannel1Measure5d
; Measure 8c
	octave 5
	beat gs Q+E1 fs E2
; Measure 9
	beat f Q+E1 cs E2 ds Q+E1
	goto outsetIslandChannel1Measure5d
; Measure 12c
	octave 6
	beat cs Q+E1 cs E2
; Measure 13
	octaved
	beat gs Q+E1 as E2 gs Q fs Q
; Measure 14
	beat cs HF
	octaved
	beat as Q+E1 ou ds E2
; Measure 15
	beat cs HF
	octaved
	beat gs Q+E1
	beat gs S3 as S4
; Measure 16-17
	beat gs W
	vol LO_VOL
	vibrato $01
	beat gs W
; Measure 18
	octave 5
	vol HI_VOL
	vibrato $e1
	beat f HF
	beat ds Q+E1 fs E2
; Measure 19
	beat f HF
	beat cs Q+E1
	beat ds S3 f S4
; Measure 20
	beat ds HF
	goto outsetIslandChannel1Measure20c
; Measure 25
	beat gs3 E2+Q
	duty $02
	env $1 $00
	vol LO_VOL-1
	vibrato $e1
	beat gs Q
; Measure 26
	beat f HF+Q ds Q
; Measure 27
	beat f HF+Q gs Q
; Measure 28
	beat f HF+Q ds Q
; Measure 29-31
	beat f W 
	beat r W+W

	;goto outsetIslandChannel1Measure4Loop

; Measure 32
	goto outsetIslandChannel1Measure32
	octave 5
	beat f Q ds E1 r E2
; Measure 34
	beat gs E1 gs E2 gs E1 as E2
	beat cs E1 r E2+E1
	beat cs S3 ds S4
; Measure 35
	beat f E1 f E2 f E1 fs E2
	beat f Q ds E1 r E2
; Measure 36
	goto outsetIslandChannel1Measure32
	beat f T1 fs T2 f S2+E2
	beat ds E1 r E2
; Measure 38
	beat gs E1 as E2 gs E1 f E2
	beat cs E1 r E2+E1
	beat f S3 fs S4
; Measure 39
	beat gs E1 gs E2 gs E1 as E2
	beat gs Q fs E1 r E2
; Measure 40-43
	vol LO_VOL
	octave 4
	duty $03
beginLoop 2
	beat gs E1 gs E2 gs E1 gs E2
	beat r HF+W
breakOrLoop
; Measure 44
	octave 5
	vol HI_VOL
	duty $02
	beat gs E1 ou cs E2 od gs E1 f E2
	beat ds E1+S3 f S4+E1 fs E2
; Measure 45
	beat gs T1 as T2 gs S2+E2+E1
	beat fs T4 gs T5 fs S4+Q
	beat f E1 ds E2
; Measure 46
	beat f E1 cs E2+Q
	goto outsetIslandChannel1Measure20c
; Measure 51b
	beat gs3 E2+E1
	vol HI_VOL
	octave 5
	beat fs E2 fs E1 r E2
; Measure 52-55
	vol LO_VOL
	env $1 $00
	vibrato $e1
	octave 4
	beat cs W c W od as W ou c W

	goto outsetIslandChannel1Measure4Loop
	cmdff
	
outsetIslandChannel1Measure5d:
; Measure 5d
	transpose 0
	vol HI_VOL
	octave 5
	duty $02
	env $1 $05
	vibrato $00
	beat gs E2
; Measure 6-7
beginLoop 2
	beat f E1 r E2+E1 ds E2
	beat f E1 r E2+E1 gs E1
breakOrLoop
; Measure 8
	env $1 $00
	vibrato $e1
	octaveu
	beat c Q+E1 od as E2
	endSec

outsetIslandChannel1Measure20c
; Measure 20c
	vol LO_VOL
	env $0 $00
	vibrato $01
	duty $03
	octave 4
	beat cs E1 c E2 cs E1 f E2
; Measure 21
	beat ds Q+E1 od gs E2+HF r E1
; Measure 22a
	vol HI_VOL
	env $1 $05
	vibrato $00
	duty $02
	octave 6
	beat ds E2 ds E1 r E2+E1
	beat c E2 c E1 r E2+E1
; Measure 23a
	octave 6
	beat cs E2 cs E1 r E2+E1
	octaved
	beat as E2 as E1 r E2+E1
; Measure 24a
	octaveu
	beat c E2 c E1 r E2+E1
	octaved
	beat gs E2 gs E1 r E2+E1
; Measure 25a
	beat as E2 as E1
	vol $0
	endSec

outsetIslandChannel1Measure32:
; Measure 32
	vol HI_VOL
	env $1 $05
	vibrato $00
	octave 5
	beat gs E1 ou cs E2 od gs E1 f E2
	beat cs E1 r E2+E1
	beat cs S3 ds S4
; Measure 33
	beat f E1 cs E2 cs E1 ds E2
	endSec

outsetIslandChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

outsetIslandChannel0Measure4Loop:
; Measure 4-8
	vol $0
	beat gs3 W+W+E1
	goto outsetIslandChannel0Measure6a
; Measure 8c
	octave 5
	beat c E1 od f E2 f E1 as E2
; Measure 9
	beat gs E1 fs E2 fs E1 fs E2
	beat f Q ds Q r E1
	goto outsetIslandChannel0Measure6a
; Measure 12c
	octave 5
	beat f E1 od f E2 f E1 ou f E2
; Measure 13
	octaved
	beat gs E1 fs E2 fs E1 r E2
	octaveu
	beat c Q od as Q r HF
	goto outsetIslandChannel0Measure14c
; Measure 16
	vol $0
	beat gs3 HF
	goto outsetIslandChannel0Measure14c
; Measure 18
	octave 4
	beat cs E1 fs E2 fs E1 r E2
	octaved
	beat as E1 ou as E2 as E1 ds E2
; Measure 19
	beat cs E1 as E2 as E1 r E2
	octaved
	beat gs E1 ou ou c E2 c E1
	octaved 
	octaved
	beat gs S3 as S4
; Measure 20
	beat gs E1 ou ou cs E2 cs E1 r E2
	octaved
	octaved
	beat as E1 ou as E2 as E1 cs E2
; Measure 21
	beat c E1 ou c E2 c E1 r E2
	beat f Q ds E1 r E2+E1
; Measure 22a
	octaved
	beat gs E2 gs E1 r E2+E1
	beat f E2 f E1 r E2+E1
; Measure 23a
	beat fs E2 fs E1 r E2+E1
	beat ds E2 ds E1 r E2+E1
; Measure 24a
	beat f E2 f E1 r E2+E1
	beat cs E2 cs E1 r E2+E1
; Measure 25a
	beat ds E2 ds E1 r E2+E1
	beat c E2 c E1
	env $1 $00
	vibrato $e1
	beat gs S3 fs S4
; Measure 26
	beat f Q
	beat gs T1 as T2 gs S2+E2+E1
	beat fs T5 gs T6 fs S4+Q
; Measure 27
	beat f T1 gs T2 f S2+E2+E1
	beat ds E2
	beat cs E1 c E2 cs E1 ds E2
; Measure 28
	beat cs Q+E1 od gs E2+HF
; Measure 29
	beat gs W

	goto outsetIslandChannel0Measure4Loop
	cmdff

outsetIslandChannel0Measure6a:
; Measure 6a
	transpose 0
	vol HI_VOL
	octave 4
	duty $03
	env $1 $05
	vibrato $00
	beat f E2 f E1 r E2+E1
	beat gs E2 gs E1 r E2+E1
; Measure 7a
	beat as E2 as E1 r E2+E1
	octaveu
	beat c E2 c E1 c E2
; Measure 8
	beat ds E1 od gs E2 gs E1 ou cs E2
	endSec

outsetIslandChannel0Measure14c:
; Measure 14c
	env $0 $00
	octave 5
	vol HI_VOL
	beat gs T1 r T2+S2

	beat gs T5
	vol LO_VOL
	octave 4
	beat cs T6+S4

	vol HI_VOL
	octave 5
	beat gs T1
	vol LO_VOL
	octave 4
	beat gs T2+S2

	vol HI_VOL
	octave 5
	beat gs T5
	vol LO_VOL
	octave 5
	beat cs T6+S4
; Measure 15
	vol HI_VOL
	octave 5
	beat gs T1
	vol LO_VOL
	octave 5
	beat f T2+S2+T5 cs T6+S4+T1
	beat od gs T2+S2+T5 f T6+S4 r HF
	vol HI_VOL
	env $1 $05
	endSec	

outsetIslandChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $0f

outsetIslandChannel4Measure4Loop:
; Measure 4-5
	transpose 0
beginLoop 2
	goto outsetIslandChannel4Measure4
breakOrLoop
; Measure 6
	goto outsetIslandChannel4Measure6
	goto outsetIslandChannel4Measure8
; Measure 7
	transpose 5
	goto outsetIslandChannel4Measure6
	transpose 0
	octave 2
	beat as E1 ou as E2 r E1 fs E2
; Measure 8
	goto outsetIslandChannel4Measure8
	goto outsetIslandChannel4Measure8c
; Measure 9
	transpose -7
	goto outsetIslandChannel4Measure8c
	transpose -2
	goto outsetIslandChannel4Measure8c
; Measure 10
	transpose 0
	goto outsetIslandChannel4Measure6
	goto outsetIslandChannel4Measure8
; Measure 11
	transpose 5
	goto outsetIslandChannel4Measure6
	transpose 0
	octave 2
	beat as E1 ou as E2 r E1 f E2
; Measure 12
	transpose -5
	goto outsetIslandChannel4Measure8c
	transpose 9
	goto outsetIslandChannel4Measure6
; Measure 13
	transpose 2
	goto outsetIslandChannel4Measure6
	transpose -2
	goto outsetIslandChannel4Measure8c
; Measure 14
	transpose 5
	goto outsetIslandChannel4Measure4
; Measure 15
	transpose -2
	goto outsetIslandChannel4Measure4
; Measure 16
	transpose 0
beginLoop 2
	goto outsetIslandChannel4Measure8
breakOrLoop
; Measure 17
	transpose -3
	goto outsetIslandChannel4Measure4
; Measure 18-19
	transpose 2
beginLoop 2
	goto outsetIslandChannel4Measure4
breakOrLoop
; Measure 20
	transpose 7
	goto outsetIslandChannel4Measure4
; Measure 21
	transpose -5
	goto outsetIslandChannel4Measure6
	transpose -14
	goto outsetIslandChannel4Measure8c
; Measure 22-29
	transpose 0
beginLoop 8
	goto outsetIslandChannel4Measure4
breakOrLoop

	goto outsetIslandChannel4Measure4Loop
	cmdff

outsetIslandChannel4Measure4:
; Measure 4
	octave 2
	duty HI_VOL
.rept 2
	beat cs E1 ou cs E2 r E1 od gs E2
.endr
	endSec

outsetIslandChannel4Measure6:
; Measure 4
	octave 2
	beat cs E1 ou cs E2 r E1 od gs E2
	endSec

outsetIslandChannel4Measure8:
; Measure 8
	octave 2
	beat f E1 ou f E2 r E1 cs E2
	endSec

outsetIslandChannel4Measure8c:
; Measure 8c
	octave 2
	beat as E1 ou as E2 r E1 od as E2
	endSec


outsetIslandChannel6:
	;.redefine NOISE_3 $2a
	;.redefine NOISE_5 $2a
	;.redefine HI_VOL $4
	;.redefine LO_VOL $3

	cmdff
