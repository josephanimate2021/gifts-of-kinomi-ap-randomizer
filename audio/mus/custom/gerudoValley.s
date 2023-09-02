gerudoValleyStart
; BPM = 129 B = 28
	tempo 129 ;129
gerudoValleyChannel1:
	.redefine HI_VOL $08
	.redefine LO_VOL $06

; Measures 1-3
	vol $0
	beat r S1
	vol HI_VOL-1
	duty $01
	env $0 $04
	octave 3

	beat d S2 gs S3
	beat b S4+S1 ou d S2+S3 fs S4+S1
	beat f S2 gs S3 b S4

	beat ou cs Q+W+W

	;.redefine NOTE_END_WAIT 3/7
; Measures 4-5
beginLoop 4
	goto gerudoValleyChannel1Measure4
breakOrLoop
; Measure 6
	transpose e4-fs4
beginLoop 2
	goto gerudoValleyChannel1Measure4
breakOrLoop
; Measure 7
	transpose f4-fs4
beginLoop 2
	goto gerudoValleyChannel1Measure4
breakOrLoop

gerudoValleyChannel1Measure8Loop:
; Measure 8-11
	octave 4
	transpose 0
	goto gerudoValleyChannel1Measure8
	beat fs S2 gs S3 fs S4 f Q+HF
; Measure 12-15
	vol $0
	duty $02
	env $0 $00
	vibrato $01

	goto gerudoValleyChannel1Measure8

	octave 4
	beat a S2 b S3 a S4
	vibrato $82
	beat gs Q+HF

; Measure 16
	beat r E1
	goto gerudoValleyChannel1Measure16
	beat r E2+E1
; Measure 18
	octave 3
	beat b E2+S1 ou gs S2+E2 fs E1+S3 e S4+E1 d E2
; Measure 19
	goto gerudoValleyChannel1Measure19

; Measure 20-21
	goto gerudoValleyChannel1Measure16

; Measure 21d
	octave 4
	env $0 $00
	vibrato $01
	beat d E2
; Measures 22-23
	vibrato $82
	beat e Q+E1 fs E2 e Q+E1 d E2
	vibrato $e2
	beat cs W r E1
	vibrato $00
; Measure 24
	env $0 $04
	beat a E2+S1 gs S2+E2 a E1+S3 gs S4+E1 cs E2
; Measure 25
	beat e Q+S1 d S2 cs S3 d S4+HF+E1
; Measure 26
	beat gs E2+S1 fs S2+E2 gs E1+S3 e S4+E1 d E2
; Measure 27
	goto gerudoValleyChannel1Measure19

; Measure 28a
	octave 3
	beat fs S3 gs S4 a S1 ou cs S2+E2
	octaved
	beat fs S1 gs S2 a S3 ou cs S4+Q+E1
; Measure 29a
	octaved
	beat fs S3 gs S4 a S1 ou d S2+E2
	octaved
	beat fs S1 gs S2 a S3 ou d S4+E1
	env $0 $00
	vibrato $01
	beat d E2
; Measures 30-31
	vibrato $82
	octaved
	beat b Q+E1 ou gs E2 fs Q+E1 od b E2
	vibrato $e2
	beat ou cs W
	vibrato $01

; Measure 32-33
	goto gerudoValleyChannel1Measure32

; Measure 34
	beat gs S1 fs S2
	vibrato $82
	beat gs E2+Q+E1
	vibrato $01
	beat e S3 fs S4
	beat gs S1 a S2 gs S3 fs S4
; Measure 35
	beat gs S1 fs S2
	vibrato $e2
	beat f E2+Q+Q+E1 r E2
	vibrato $01

	goto gerudoValleyChannel1Measure32

; Measure 38
	octave 4
	beat b S1 a S2
	vibrato $82
	beat b E2+Q+E1
	vibrato $01
	beat gs S3 a S4
	beat b S1 ou cs S2 d S3 e S4
; Measure 39
	beat cs S1 d S2
	vibrato $e2
	beat cs E2+Q+Q+E1 r E2
	vibrato $00

; Measure 40
	octave 4
	duty $01
	env $0 $04

beginLoop 2
	beat fs E1
	goto gerudoValleyChannel1Measure40a
breakOrLoop
; Measure 41-42
beginLoop 2
	goto gerudoValleyChannel1Measure41
	goto gerudoValleyChannel1Measure41
	transpose e4-d4
breakOrLoop
; Measure 43
	;transpose e4-d4
	octaveu
	beat c S1 d S2 c S3 od b S4+Q+HF

	goto gerudoValleyChannel1Measure8Loop
	cmdff


gerudoValleyChannel1Measure4:
; Measure 4
	octave 4
	env $0 $05
	vol HI_VOL
	beat fs S1
	vol LO_VOL
	beat fs S2 fs S3
	beat fs S4+S1 fs S2+S3 fs S4
	endSec

gerudoValleyChannel1Measure8:
; Measure 8
	octave 4
	vol $0
	beat r S1
	vol HI_VOL
	beat cs S2 fs S3 gs S4
	beat a E1+S3 cs S4 fs S1 gs S2
	beat a E2+Q
; Measure 9
	beat r S1 d S2 fs S3 gs S4
	beat a E1+S3 d S4 fs S1 gs S2
	beat a E2+Q	
; Measure 10
	octaved
	beat r S1 b S2 ou e S3 fs S4
	beat gs E1+S3 od b S4 ou e S1 fs S2
	beat gs E2+Q
; Measure 11
	beat r S1
	endSec

gerudoValleyChannel1Measure16:
; Measure 16a
	vibrato $00
	duty $01
	env $0 $04
	octave 4
	vol HI_VOL
; Measure 16a
	beat cs E2+S1 a S2+E2 gs E1+S3 fs S4+E1 cs E2
; Measure 17
	beat e Q e S1 fs S2 e S3 d S4+Q+E1
	endSec

gerudoValleyChannel1Measure19:
; Measure 19
	octave 4
	beat cs Q d S1 e S2 d S3 cs S4+HF+E1
	endSec

gerudoValleyChannel1Measure32:
; Measure 32
	octave 4
	duty $02
	beat a S1 gs S2
	vibrato $82
	beat a E2+Q+E1
	vibrato $01
	beat fs S3 gs S4
	beat a S1 b S2 a S3 gs S4
; Measure 33
	beat a S1 gs S2
	vibrato $e2
	beat a E2+Q+Q+E1 r E2
	vibrato $01
	endSec

gerudoValleyChannel1Measure41:
	octave 4
	beat d E1
gerudoValleyChannel1Measure40a:
; Measure 40a
	octave 4
	beat a S3 gs S4+E1 a E2
	endSec

gerudoValleyChannel0:
	.redefine HI_VOL $8
	.redefine LO_VOL $6
; Measures 1-3
	duty $01
	env $0 $04
	vol HI_VOL-1
	octave 3
	beat cs HF+S1

	beat gs S2 ds S3 d S4
	beat cs Q+W+W

; Measure 4
	goto gerudoValleyChannel0Measure4
; Measure 5
	transpose d5-a4
	goto gerudoValleyChannel0Measure4
; Measure 6
	goto gerudoValleyChannel0Measure6
; Measure 7
	transpose cs5-a4
	goto gerudoValleyChannel0Measure4

gerudoValleyChannel0Measure8Loop:
; Measure 8
	goto gerudoValleyChannel0Measure4Reset
; Measure 9
	goto gerudoValleyChannel0Measure9
; Measure 10
	goto gerudoValleyChannel0Measure10
; Measure 11
	goto gerudoValleyChannel0Measure11
; Measure 12
	goto gerudoValleyChannel0Measure4Reset
; Measure 13
	goto gerudoValleyChannel0Measure9
; Measure 14
	goto gerudoValleyChannel0Measure10
; Measure 15
	goto gerudoValleyChannel0Measure6
; Measure 16
	goto gerudoValleyChannel0Measure4Reset
; Measure 17
	goto gerudoValleyChannel0Measure9
; Measure 18
	goto gerudoValleyChannel0Measure10
; Measure 19
	goto gerudoValleyChannel0Measure11
; Measure 20
	goto gerudoValleyChannel0Measure4Reset
; Measure 21
	goto gerudoValleyChannel0Measure21
; Measure 22
	octave 3
	beat b Q+S1 r S2 b S3 r S4
	beat b Q+E1 gs E2	
; Measure 23
	goto gerudoValleyChannel0Measure11
; Measure 24
	goto gerudoValleyChannel0Measure4Reset
; Measure 25
	goto gerudoValleyChannel0Measure9
; Measure 26
	goto gerudoValleyChannel0Measure10
; Measure 27
	goto gerudoValleyChannel0Measure11
; Measure 28
	transpose cs4-a4
	goto gerudoValleyChannel0Measure4
; Measure 29
	goto gerudoValleyChannel0Measure29
; resets transpose in call
; Measure 30
	octave 3
	beat gs Q+E1 ou e E2 d Q+E1 od gs E2	
; Measure 31
	goto gerudoValleyChannel0Measure11
; Measure 32
	goto gerudoValleyChannel0Measure4Reset
; Measure 33
	goto gerudoValleyChannel0Measure9
; Measure 34
	goto gerudoValleyChannel0Measure10
; Measure 35
	goto gerudoValleyChannel0Measure11

; Measure 36	
	octave 4
	transpose 0
	env $0 $00
	beat cs S1 od b S2
	vibrato $81
	octaveu
	beat cs E2+Q+E1
	vibrato $00
	octaved
	beat a S3 b S4
	octaveu
	beat cs S1 d S2 cs S3 od b S4
; Measure 37
	octaveu
	beat cs S1 od b S2
	vibrato $82
	octaveu
	beat cs E2+Q+E1+S3
	vibrato $00

	env $0 $04
	vol LO_VOL
	octaved
	beat fs S4+S1 fs S2+S3 fs S4
	vol HI_VOL
; Measure 38
	octave 4
	env $0 $00
	beat d S1 cs S2
	vibrato $81
	beat d E2+Q+E1
	vibrato $00
	octaved
	beat b S3 ou c S4
	beat d S1 e S2 fs S3 gs S4
; Measure 39
	beat f S1 fs S2
	vibrato $82
	beat f E2+Q
	vibrato $00
	env $0 $04

	octave 3
	vol HI_VOL
	beat b S1
	vol LO_VOL
	beat b S2 b S3
	beat b S4+S1 b S2+S3 b S4
; Measure 40
	goto gerudoValleyChannel0Measure4
; Measure 41
	goto gerudoValleyChannel0Measure9
; Measure 42
	goto gerudoValleyChannel0Measure10
; Measure 43
	goto gerudoValleyChannel0Measure6
	goto gerudoValleyChannel0Measure8Loop
	cmdff

gerudoValleyChannel0Measure6:
	transpose b4-a4
	jumpto gerudoValleyChannel0Measure4

gerudoValleyChannel0Measure9:
	transpose fs4-a4
	jumpto gerudoValleyChannel0Measure4

gerudoValleyChannel0Measure10:
	transpose gs4-a4
	jumpto gerudoValleyChannel0Measure4

gerudoValleyChannel0Measure11:
	transpose f4-a4
	jumpto gerudoValleyChannel0Measure4

gerudoValleyChannel0Measure4Reset:
	transpose 0
gerudoValleyChannel0Measure4:
	octave 3
	vibrato $00
	env $0 $04
; Measure 4
beginLoop 2
	vol HI_VOL
	beat a S1
	vol LO_VOL
	beat a S2 a S3
	beat a S4+S1 a S2+S3 a S4
breakOrLoop
	endSec

gerudoValleyChannel0Measure29:
	transpose d4-fs4
gerudoValleyChannel0Measure21:
; Measure 21
	octave 3
	vol HI_VOL
	beat fs S1
	vol LO_VOL
	beat fs S2 fs S3
	beat fs S4+S1 fs S2+S3 fs S4

	vol HI_VOL
	beat fs S1
	vol LO_VOL
	beat fs S2 fs S3
	beat fs S4+S1 fs S2 

	transpose 0
	vol HI_VOL
	env $0 $00
	octave 3
	beat a E2
	vibrato $81
	endSec

gerudoValleyChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $0f
; Measures 1-3
	beat r W+W r W

gerudoValleyChannel4Measure4Loop:
; Measure 4
	transpose 0
	goto gerudoValleyChannel4Measure4
; Measure 5
	transpose d2-fs2
	goto gerudoValleyChannel4Measure4
; Measure 6
	transpose e2-fs2
	goto gerudoValleyChannel4Measure4
; Measure 7
	transpose cs3-fs2
	goto gerudoValleyChannel4Measure4

	goto gerudoValleyChannel4Measure4Loop
	cmdff

gerudoValleyChannel4Measure4:
; Measure 4
	octave 2
	duty HI_VOL
beginLoop 2
	beat fs E1+S3 r S4
	beat fs E1 r E2
breakOrLoop
	endSec


gerudoValleyChannel6:
	.redefine HI_VOL $7
	.redefine LO_VOL $5
	.redefine CLAP $24

; Measure 1
	beat r W
gerudoValleyChannel6Measure2:
; Measures 2-7
	vol HI_VOL
	beat CLAP S1
	vol LO_VOL
	beat CLAP S2 CLAP S3

	vol HI_VOL
	beat CLAP S4
	vol LO_VOL
	beat CLAP S1 CLAP S2

	vol HI_VOL
	beat CLAP S3
	vol LO_VOL
	beat CLAP S4

beginLoop 2
	vol HI_VOL
	beat CLAP S1
	vol LO_VOL
	beat CLAP S2 CLAP S3
	vol HI_VOL
	beat CLAP S4
breakOrLoop

	goto gerudoValleyChannel6Measure2
	cmdff