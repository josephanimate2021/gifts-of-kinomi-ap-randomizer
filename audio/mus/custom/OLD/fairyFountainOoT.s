fairyFountainStart:
; BPM = 75, B = 48, M = 192
fairyFountainChannel1:
.redefine BEAT 1
.redefine CHANNEL 1
; Measure 1
; B = 34
	vol $0
	beat g3 4

	octave 3
	vol $6
	duty $02
	beat g 4 as 4 ou d 22	;4+18
; B = 32
	vol $3
	beat d 4

	vol $6
	octaved
	beat as 4 ou d 4 e 20	;4+16
; B = 30
	vol $3
	beat e 4

	vol $6
	beat d 4 e 4 g 18		;4+14
; B = 28
.redefine HI_VOL $6
.redefine LO_VOL $3
.redefine NO_FIRST_VOL 1
.redefine LO_VOL_RATIO 3/22
	vol $3
	beat g 3

	vol $6
	beat e 3 g 3
	volbeat as 22

	vol $6
	beat g 3 as 3
	volbeat ou d 22

	vol $6
	beat od as 3 ou d 3 e 19

fileSelectStart:
	duty $02
fileSelectChannel1:
fairyFountainChannel1Measure2Reset:
	resetCoda
	.redefine BEAT 12
; Measure 2
; B = 48
	vol $3
	beat e 1
fairyFountainChannel1Measure2:
	incCoda
; Measure 2a,6a
	octave 3
	vol $6
	env $0 $05
	beat as 1 ou d 1
.redefine NO_FIRST_VOL 0
.redefine LO_VOL_RATIO 1/6
	env $0 $00
	vibrato $82
	volbeat a 6

	vol $6
	vibrato $00
	env $0 $05
	beat d 1 a 1 g 1
	beat ou c 1 od a 1 g 1 d 1
; Measure 3
	vol $3
	beat d 1

	vol $6
	octaved
	beat a 1 ou c 1

	gotoCond 2 fairyFountainChannel1Measure7a
	env $0 $00
	vibrato $82
	volbeat g 6

	vol $6
	vibrato $00
	env $0 $05
	octaved
	beat a 1 ou g 1 f 1
	beat ou c 1 od g 1 f 1 c 1
; Measure 4
	vol $3
	beat c 1

	vol $6
	octaved
	beat g 1 as 1
	env $0 $00
	vibrato $82
	volbeat ou f 6

	vol $6
	vibrato $00
	env $0 $05
	octaved
	beat g 1 ou f 1 e 1
	beat g 1 e 1 c 1 od as 1
; Measure 5
	vol $3
	beat as 1

	vol $6
	beat f 1 a 1
	env $0 $00
	vibrato $82
	volbeat ou e 6

	vol $6
	vibrato $00
	env $0 $05
	octaved
	beat a 1 ou e 1 d 1
	beat g 1 f 1 ou c 1 od as 1
; Measure 6
	vol $3
	beat as 1

	goto fairyFountainChannel1Measure2
	
fairyFountainChannel1Measure7a:
; Measure 7a
	octave 5
	env $0 $00
	vibrato $82
	volbeat c 6

	vol $6
	vibrato $00
	env $0 $05
	octaved
	beat d 1 ou c 1 od a 1
	beat ou ds 1 d 1 c 1 od a 1
; Measure 8
	vol $3
	beat a 1

	vol $6
	octaved
	beat as 1 ou d 1
	env $0 $00
	vibrato $82
	volbeat as 6

	vol $6
	vibrato $00
	env $0 $05
	octaved
	beat as 1 ou as 1 a 1
	beat ou c 1 od as 1 g 1 d 1
; Measure 9
	vol $3
	beat d 1

	vol $6
	beat c 1 g 1
	env $0 $00
	vibrato $82
	volbeat as 6

	vol $6
	vibrato $00
	env $0 $05
	beat c 1 as 1 g 1
	beat ou e 1 d 1 g 1 e 1

	goto fairyFountainChannel1Measure2Reset
    cmdff



fairyFountainChannel0:
.redefine BEAT 1
.redefine CHANNEL 0
; Measure 1
; B = 34
    octave 3
    duty $02
	vol $6
    beat e 26
	vol $3
	beat e 8
; B = 32	
	vol $6
	beat g 24
	vol $3
	beat g 8
; B = 30
	vol $6
	beat as 22
	vol $3
	beat as 8
; B = 28
.redefine HI_VOL $6
.redefine LO_VOL $3
.redefine LO_VOL_RATIO 1/4
.redefine NO_FIRST_VOL 0
	octaveu
    volbeat d 28 e 28 g 28

fileSelectChannel0:
    duty $02
; Measure 2
; B = 48
.redefine BEAT 6
.redefine HI_VOL $5
.redefine LO_VOL $1
.redefine LO_VOL_RATIO 1/2
.redefine TARM_NOTE 0
    octave 6
	vol $5
	beat a 1 r 1
fairyFountainChannel0Measure2Reset:
    resetCoda
fairyFountainChannel0Measure2:
    incCoda
.redefine BEAT 12
; Measure 2,6
.redefine TARM_NOTE a6
	vol $5
    tarmbeat d 1 od as 1 g 1
    octaveu
    tarmbeat g 1 d 1 od as 1 g 1
    octaveu
    tarmbeat fs 1 d 1 od as 1 g 1
    octaveu
    tarmbeat g 1 d 1 od as 1 g 1

	gotoCond 2 fairyFountainChannel0Measure7
; Measure 3
    octaveu
    tarmbeat g 1 c 1 od a 1 f 1
    octaveu
    tarmbeat f 1 c 1 od a 1 f 1
    octaveu
    tarmbeat e 1 c 1 od a 1 f 1
    octaveu
    tarmbeat f 1 c 1 od a 1 f 1
; Measure 4
    octaveu
    tarmbeat f 1 od as 1 g 1 e 1	
    octaveu
    tarmbeat e 1 od as 1 g 1 e 1
    octaveu
    tarmbeat ds 1 od as 1 g 1 e 1
    octaveu
    tarmbeat e 1 od as 1 g 1 e 1
; Measure 5
    octaveu
    tarmbeat e 1 od a 1 f 1 d 1
    octaveu
    tarmbeat d 1 od a 1 f 1 d 1
    octaveu
    tarmbeat cs 1 od a 1 f 1 d 1
    octaveu
    tarmbeat d 1 od a 1 f 1 d 1
    octaveu
	tarmbeat a 1
	goto fairyFountainChannel0Measure2


fairyFountainChannel0Measure7:
	.redefine TARM_NOTE g5
; Measure 7
    tarmbeat as 1 ds 1 c 1 od fs 1
    octaveu
    tarmbeat a 1 ds 1 c 1 od fs 1
    octaveu
    tarmbeat gs 1 ds 1 c 1 od fs 1
    octaveu
    tarmbeat a 1 ds 1 c 1 od fs 1
; Measure 8
    octaveu
    tarmbeat ou c 1 od d 1 od as 1 g 1
    octaveu
    tarmbeat as 1 d 1 od as 1 g 1
    octaveu
    tarmbeat a 1 d 1 od as 1 g 1
    octaveu
    tarmbeat as 1 d 1 od as 1 g 1
; Measure 9
    octaveu
    tarmbeat a 1 od as 1 g 1 e 1
    octaveu
    tarmbeat g 1 od as 1 g 1 e 1
    octaveu
    tarmbeat f 1 od as 1 g 1 e 1
    octaveu
    tarmbeat e 1 od as 1 g 1 e 1
    octaveu
	tarmbeat a 1

	goto fairyFountainChannel0Measure2Reset
    cmdff

fairyFountainChannel4:
.redefine BEAT 1
.redefine CHANNEL 4
; Measure 1
; B = 34
    octave 3
    duty $0e
    beat c 26
	duty $0f
	beat c 8
; B = 32	
    duty $0e
	beat e 24
	duty $0f
	beat e 8
; B = 30
    duty $0e
	beat g 22
	duty $0f
	beat g 8
; B = 28
.redefine HI_VOL $0e
.redefine LO_VOL $0f
.redefine LO_VOL_RATIO 1/4
.redefine NO_FIRST_VOL 0
    volbeat as 28 ou d 28 e 28

fileSelectChannel4:
fairyFountainChannel4Measure2:
	.redefine BEAT 96
; Measure 2
; B = 48
.redefine LO_VOL_RATIO 3/16
	octave 2
	volbeat as 2
; Measure 3
.redefine LO_VOL_RATIO 1/8
	volbeat a 1 a 1
; Measure 4
	volbeat g 1 g 1
; Measure 5
	volbeat f 1 f 1
; Measure 6
	volbeat as 1 as 1
; Measure 7
	volbeat a 1 ou d 1
; Measure 8
	octaved
	volbeat g 1 g 1
; Measure 9
	octaveu
	volbeat c 1 c 1

	goto fairyFountainChannel4Measure2
    cmdff

.define fileSelectChannel6 MUSIC_CHANNEL_FALLBACK EXPORT 
.define fairyFountainChannel6 MUSIC_CHANNEL_FALLBACK EXPORT
