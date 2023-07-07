floroCavernsStart:
; BPM = 132, B = 27, M = 108
floroCavernsChannel1:
.redefine BEAT 1
.redefine CHANNEL 1
; Measure 1
    vol $0
	beat g3 108
; Measure 2
    octave 2
    vol $5
    duty $03
    env $2 $06
    beat cs 14 fs 13 ou ds 14 f 13
    beat ou c 14 f 13 ou c 14 f 27
; Measure 3a
    beat cs 13 od gs 14 ou cs 13
    beat od cs 54
; Measure 4
    octave 3
    beat cs 14 fs 13 as 14
    beat ou f 27 gs 27 ou f 13
; Measure 5
    beat fs 54
    octave 2
    beat a 14 ou cs 13 fs 14 a 13
; Measure 6
    octaved
    beat b 14 ou ds 13 fs 14 a 13
    beat ou d 14 fs 13
    
    octaveu
    env $0 $00
    vol $6
    beat cs 14
    vol $7
    beat od b 13

floroCavernsChannel1Measure7Reset:
    resetCoda
; Measure 7
    octave 5
    vol $8
    vibrato $e2
    beat cs 54 d 14 r 40
; Measure 8
    beat cs 54 e 14 r 13
    vol $6
    env $0 $06
    vibrato $00
    beat d 14 e 13

floroCavernsChannel1Measure9:
; Coda == 0,1
    incCoda
; Measure 9,13
    beat fs 14 r 13 fs 14 r 13
    beat fs 27 r 27
; Measure 10,14
    beat fs 14 gs 13 a 14 gs 13
    beat fs 14 r 13 e 14 d 13
; Measure 11,15
    beat cs 14 r 13 cs 14 r 13
    beat cs 27 r 27
; Measure 12,16
    beat cs 14 d 13 e 14 d 13
    beat cs 14 r 13
    gotoCond 0+2 floroCavernsChannel1Measure16d
    beat cs 14 ds 13

    goto floroCavernsChannel1Measure9

floroCavernsChannel1Measure16d:
; Coda == 2
; Measure 16d
    octave 4
    beat gs 27
; Measure 17
    vol $4
    duty $02
    env $0 $00
    vibrato $e2
    beat f 108
; Measure 18
    octaveu
    vol $6
    duty $01
    env $1 $06
    vibrato $00
    beat cs 14 ds 13 e 14 fs 13
    beat gs 27 b 27
; Measure 19
    env $1 $00
    vibrato $e1
    beat a 108
; Measure 20
    beat fs 54 r 27
    beat e 14 fs 13
; Measure 21-22
    beat gs 135
    vibrato $01
    vol $5
    env $0 $00
    beat gs 54
    vol $4
    beat gs 27
; Measure 23
    octave 6
    vibrato $00
    env $0 $06
    duty $03
    beat cs 14 r 13 cs 14 r 13
    beat cs 14 r 13 cs 14 od b 13
; Measure 24
    octave 5
    beat cs 14 r 13 cs 14 r 13
    vol $8
    beat ds 14 od b 6 ou ds 7
    beat cs 14 od b 13

floroCavernsChannel1Measure25:
; Coda == 2
; Measure 25,51
    octave 4
    vol $8
    duty $02
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 54
; Measure 26a,52a
    beat cs 13 r 14 od b 13
    beat ou cs 14 r 13
    env $0 $00
    beat e 27
; Measure 27,53
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 40
; Measure 28,54
    beat cs 14 r 27 od b 13
    beat ou cs 14 od b 13
    env $0 $00
    beat ou e 27

    gotoCond 4 floroCavernsChannel1Measure7Reset

floroCavernsChannel1Measure29:
; Coda == 2
    incCoda
; Measure 29,33
    octave 5
    vol $7
    duty $03
    env $0 $06
    beat cs 27 cs 14 ds 13
    beat e 14 ds 4 e 4 ds 5
    beat cs 14 od b 13
; Measure 30,34
    beat as 7 b 7 ou cs 13
    beat od as 14
    gotoCond 2+2 floroCavernsChannel1Measure34b
    beat fs 4 gs 4 fs 5
    beat e 14 cs 13 e 14 gs 13

floroCavernsChannel1Measure31:
; Measure 31,35
    beat ou cs 27
    octave 4
    duty $01
    env $0 $04
    beat cs 14 ds 13
    beat e 14 fs 13 gs 14 as 13
; Measure 32,36
    beat b 27
    beat as 4 b 5 as 5 fs 13
    beat gs 14 fs 13    
    gotoCond 2+2 floroCavernsChannel1Measure36d
    beat gs 27

    goto floroCavernsChannel1Measure29

floroCavernsChannel1Measure34b:
; Measure 34b
    octave 5
    beat cs 13
    beat e 14 gs 13 fs 14 e 13
    goto floroCavernsChannel1Measure31

floroCavernsChannel1Measure36d:
; Coda == 4
; Measure 36d
    octave 4
    beat gs 14 od b 13
; Measure 37-38c
    vol $5
    env $0 $00
    vibrato $e1
    beat ou cs 108
    vibrato $01
    vol $4
    beat cs 54
    vol $3
    beat cs 27
; Measure 38d
    octave 4
    vol $6
    duty $03
    env $2 $06
    beat gs 14 gs 13
; Measure 39
    beat gs 14 od gs 13 ou cs 14 e 13
    beat fs 14 r 27
    vol $4
    octaveu
    beat ds 13
; Measure 40
    vibrato $e2
    env $2 $00
    beat a 108
; Measure 41
    env $2 $06
    vibrato $00
    vol $5
    octaved
    beat a 41 gs 13
    beat a 27 ou cs 14 fs 13
; Measure 42
    beat b 41 r 6 a 4 b 3
    env $2 $00
    vibrato $82
    beat a 54

; Measure 43
    octave 5
    vibrato $00
    vol $6
    env $0 $06
    duty $03
.rept 2
    beat cs 14 r 13 cs 14 d 13
.endr
; Measure 44
    beat e 14 d 13 cs 14 od b 27
    beat r 13 a 14 ou cs 13
; Measure 45
    beat od b 14 a 13 gs 14 fs 13
    beat gs 14 r 13 f 14 fs 13
; Measure 46
    beat gs 27 b 14 fs 13
    beat gs 27 r 27
; Measure 47
.rept 2
    beat gs 14 r 13 gs 14 a 13
.endr
; Measure 48
    beat b 14 a 13 gs 14 gs 27
    beat r 13 fs 14 a 13
; Measure 49
    beat gs 14 fs 13 f 14 ds 13
    beat f 14 r 13 cs 14 d 13
; Measure 50
    beat f 27 gs 14 ds 13
    beat f 27 gs 14 fs 13

    goto floroCavernsChannel1Measure25
    cmdff




floroCavernsChannel0:
.redefine BEAT 108
.redefine CHANNEL 0
; Measure 1-2
    octave 3
    vol $3
    duty $03
    beat cs 1 f 1
    resetCoda

floroCavernsChannel0Measure3:
.redefine BEAT 1
; Coda == 0
    incCoda
; Measure 3-6
    octave 4
    vol $4
    env $0 $06
    duty $03
.rept 3
    beat cs 14 r 13
.endr
    beat cs 14
    gotoCond 0+4 floroCavernsChannel0Measure6d  
    beat ds 13

    goto floroCavernsChannel0Measure3

floroCavernsChannel0Measure6d:
; Coda == 4
; Measure 6d
    beat od b 13

floroCavernsChannel0Measure7Reset:
    resetCoda
; Coda == 0
; Measure 7
    octave 4
    vol $8
    duty $03
    vibrato $e2
    env $0 $00
    beat cs 54 d 14 r 40
; Measure 8
    beat cs 54
    beat e 14 r 13 d 14 r 13   

floroCavernsChannel0Measure9:
; Coda == 0,1
    incCoda
; Measure 9,13
    octave 5
    vol $6
    env $0 $06
    vibrato $00
    beat cs 14 r 13 cs 14 r 13
    beat cs 27 r 27
; Measure 10,14
    beat cs 14 ds 13 e 14 ds 13
    beat cs 14 r 13 od b 14 a 13
; Measure 11,15
    beat gs 14 r 13 gs 14 r 13
    beat gs 27 r 27
; Measure 12,16
    beat gs 14 a 13 b 14 a 13
    beat gs 14 r 13
    gotoCond 0+2 floroCavernsChannel0Measure16d
    beat r 27

    goto floroCavernsChannel0Measure9

floroCavernsChannel0Measure16d:
; Coda == 2
; Measure 16d
    octave 4
    beat cs 27
; Measure 17
    octaved
    beat gs 27
    vol $4
    duty $01
    env $0 $04
    octave 5
    beat cs 14 ds 13
    beat e 14 ds 13 cs 14 od b 13
; Measure 18
    vol $6
    duty $03
    env $0 $06   
    beat gs 14 b 13 ou cs 14 ds 13
    beat f 27 gs 27
; Measure 19
    beat fs 27
    vol $4
    duty $01
    env $0 $04    
    beat fs 14 gs 13
    beat a 14 gs 13 fs 14 e 13
; Measure 20
    beat ds 14 od a 13 ou ds 14 e 13
    beat fs 27 r 27
; Measure 21
    vol $6
    duty $03
    env $0 $00 
    vibrato $e2  
    beat cs 135
; Measure 22b
    octave 6 
    vibrato $00
    env $0 $06
    vol $3
    beat ds 14 e 13
    beat fs 14 r 13 od a 14 r 13
; Measure 23
    octave 5
    env $0 $06
    vol $6
    beat cs 14 r 13 cs 14 r 13
    beat cs 14 r 13 od fs 14 gs 13
; Measure 24
    beat a 14 r 13 fs 14 r 13
    vol $8
    beat ds 14 od b 6 ou ds 7
    beat cs 14 od b 13 

floroCavernsChannel0Measure25:
; Coda == 2
; Measure 25
    octave 3
    vol $8
    duty $02
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 54
; Measure 26a
    beat cs 13 r 14 od b 13
    beat ou cs 14 r 13
    env $0 $00
    beat e 27
; Measure 27
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 40
; Measure 28
    beat cs 14 r 27 od b 13
    beat ou cs 14 od b 13
    env $0 $00
    beat ou e 27

floraCavernsChannel0Measure29:
; Coda == 2
    incCoda
; Measure 29,33
    vol $7
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 54
; Measure 30,34
    beat cs 13 r 14 od b 13
    beat ou cs 14 r 13
    env $0 $00
    beat od b 27
; Measure 31,35
    env $0 $05
    octaveu
    beat cs 14 r 27 cs 13
    beat r 14 od b 6 ou cs 7
    beat od b 14 gs 13
; Measure 32,36
    beat ou cs 14 r 27 cs 13
    beat r 14 od b 6 ou cs 7
    beat e 14
    gotoCond 2+2 floraCavernsChannel0Measure36d
    beat fs 13

    goto floraCavernsChannel0Measure29

floraCavernsChannel0Measure36d:
; Coda == 4
; Measure 36d
    beat f 13
; Measure 37
    beat r 14
    vol $4
    duty $03
    env $2 $06
.rept 2
    beat f 27    
.endr
    vol $5
.rept 2
    beat f 27    
.endr
; Measure 38a
    vol $6
    beat f 27
    vol $7
    beat f 27 r 13
    vol $8
    beat f 14 f 13
; Measure 39
    vol $6
    beat e 14 gs 54 ds 40
; Measure 40
    beat r 41 e 13
    beat fs 14 ds 13 a 14 ou ds 13
; Measure 41-42
    beat r 14 od c 13
    beat cs 41 ds 148

; Measure 43
    octave 4
    duty $03
    env $0 $06
.rept 2
    beat gs 14 r 13 gs 14 a 13
.endr
; Measure 44
    beat b 14 a 13 gs 14 gs 27
    beat r 13 fs 14 a 13
; Measure 45
    beat gs 14 fs 13 f 14 ds 13
    beat f 14 r 13 cs 14 d 13
; Measure 46
    beat f 27 gs 14 ds 13
    beat f 27 r 27
; Measure 47
    octaveu
.rept 2
    beat cs 14 r 13 cs 14 d 13
.endr
; Measure 48
    beat e 14 d 13 cs 14 od b 27
    beat r 13 a 14 ou cs 13
; Measure 49
    beat od b 14 a 13 gs 14 fs 13
    beat gs 14 r 13 f 14 fs 13
; Measure 50
    beat gs 27 b 14 fs 13
    beat gs 27 ou cs 14 od b 13
; Measure 51
    octave 3
    vol $8
    duty $02
    env $0 $05
    beat cs 14 r 27 od b 13
    beat ou cs 14 r 27 cs 13 
; Measure 52
    beat od b 14 ou cs 13 r 14 od b 13
    beat ou cs 14 r 27 od b 13
; Measure 53
    beat ou cs 14 r 27 od b 13
    beat ou cs 14 r 27 cs 13 
; Measure 54
    beat od b 14 ou cs 13 r 14 od b 13
    beat ou cs 14 od b 13
    env $0 $00
    beat e 27

    goto floroCavernsChannel0Measure7Reset
    cmdff




floroCavernsChannel4:
.redefine BEAT 54
.redefine CHANNEL 4
; Measure 1-3
    octave 2
    duty $06
    beat f 2 ds 2 gs 2
; Measure 4-6
    beat fs 2 a 2 b 1 ou d 1

floroCavernsChannel4Measure7:
; Measure 7
.redefine BEAT 1
    octave 3
    duty $0e
    vibrato $e2
    beat cs 54 d 14 r 40
; Measure 8
    beat cs 54
    beat e 14 r 13 d 14 r 13

; Measure 9
    octave 2
    beat fs 14 r 27 fs 13
    beat r 14 cs 13
    beat fs 7 r 7 e 6 r 7
; Measure 10
    beat fs 14 r 13 fs 14 gs 13
    beat a 14 gs 4 a 4 gs 5
    beat fs 14 cs 6 r 7
; Measure 11
    beat fs 14 ou f 13 cs 14 od gs 13
    beat r 14 gs 13 ou cs 14 od b 13
; Measure 12
    beat gs 14 a 4 b 4 a 5
    beat gs 14 fs 13
    beat r 14 gs 13 ou cs 14 e 13

; Measure 13 (R of M9)
    octaved
    beat fs 14 r 27 fs 13
    beat r 14 cs 13
    beat fs 7 r 7 e 6 r 7  
; Measure 14
    beat a 14 gs 13 fs 14 b 13
    beat a 14 gs 4 a 4 gs 5
    beat fs 14 b 13
; Measure 15
    octaveu
    beat cs 14 r 27 cs 13
    beat r 14 od gs 13 ou cs 14 od b 13
; Measure 16
    beat gs 14 a 4 b 4 a 5
    beat gs 14 fs 13
    beat r 14 gs 13 ou cs 14 od b 13    

; Measure 17
    octaveu
    beat cs 68
    duty $0f
    beat cs 40
; Measure 18
.redefine HI_VOL $0e
.redefine LO_VOL $0f
.redefine LO_VOL_RATIO 1/3
    volbeat cs 42 cs 66
; Measure 19
    volbeat od b 39 b 15 b 27 b 27     ;b 41 b 13 b 27 b 27
; Measure 20
    volbeat gs 42 gs 39 gs 27
; Measure 21
    volbeat as 108
; Measure 22
    volbeat as 42 as 66
; Measure 23
    volbeat b 42 b 66
; Measure 24
    volbeat gs 42 gs 66

; Measure 25-28
.redefine HI_VOL $05
.redefine LO_VOL $06
.redefine BEAT 216
    octave 3
    volbeat a 1 gs 1
; Measure 29-36
    volbeat gs 1 fs 1 gs 1 fs 1

; Measure 37-42
.redefine BEAT 1
    duty $06
    beat cs 255 cs 255 cs 138

; Measure 43
    duty $0e
    beat cs 14 r 27 cs 13 r 54
; Measure 44
    beat cs 14 r 27 cs 13
    beat r 14 gs 13 fs 14 ds 13
; Measure 45
    beat cs 14 r 27 cs 13 r 54
; Measure 46
    beat cs 14 r 27 cs 13
    beat od b 14 ou ds 13 e 14 d 13
; Measure 47
    beat cs 14 r 27 cs 13 r 54
; Measure 48
    beat cs 14 r 27 cs 13
    beat a 14 gs 13 f 14 d 13
; Measure 49
    beat cs 14 r 27 cs 13
    beat r 14 od gs 13 ou cs 14 od b 13
; Measure 50
    beat ou cs 14 r 54 od gs 13
    beat ou cs 7 r 7 od b 6 r 7
; Measure 51-54
    volbeat gs 216 cs 216
    
    goto floroCavernsChannel4Measure7
    cmdff

.define floroCavernsChannel6 MUSIC_CHANNEL_FALLBACK EXPORT