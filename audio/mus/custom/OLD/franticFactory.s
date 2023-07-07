franticFactoryStart:
; BPM = 112.5, B = 32, M = 128
franticFactoryChannel1:
franticFactoryChannel1Measure1:
    resetCoda
.redefine BEAT 16       ;eighth
.redefine CHANNEL 1
; Measure 1
    octave 6
    vol $3
    duty $03
    vibrato $00
    env $0 $06
.rept 2
    beat c 1 od gs 1 g 1 gs 1
    octaveu
.endr
; Measure 2-3
    octaved
.rept 4
    beat b 1 gs 1 g 1 gs 1
.endr 
; Measure 4
    octaveu
    beat c 1 od gs 1 g 1 gs 1
    beat ou c 4

; Measure 5
.rept 2
    beat c 1 od gs 1 g 1 gs 1
    octaveu
.endr 
; Measure 6
.rept 2
    beat d 1 od a 1 ou d 1 c 1
.endr
; Measure 7
    beat d 1 c 1 od gs 1 ou c 1
    beat d 1 c 1 od gs 1 ou c 0.5 r 0.5
; Measure 8
    beat c 1 od gs 1 g 1 gs 1
    beat ou c 4

franticFactoryChannel1Measure9:
; Measure 9-11
.redefine HI_VOL $3
.redefine LO_VOL $1
.redefine NO_FIRST_VOL 0
.redefine LO_VOL_RATIO 1/2
    incCoda
    octave 3
    duty $02
    volbeat ds 1 c 1

    gotoCond 0+12 franticFactoryChannel1Measure12
    goto franticFactoryChannel1Measure9

franticFactoryChannel1Measure12:
; Measure 12-13
    incCoda
    volbeat d 1 od b 1

    gotoCond 12+8 franticFactoryChannel1Measure14
    goto franticFactoryChannel1Measure12

franticFactoryChannel1Measure14:
; Measure 14
    incCoda
    volbeat ou e 1 c 1

    gotoCond 20+4 franticFactoryChannel1Measure15
    goto franticFactoryChannel1Measure14

franticFactoryChannel1Measure15:
; Measure 15
    incCoda
    volbeat f 1 c 1

    gotoCond 24+4 franticFactoryChannel1Measure16
    goto franticFactoryChannel1Measure15

franticFactoryChannel1Measure16:
; Measure 16
    incCoda
    volbeat f 1 d 1

    gotoCond 28+4 franticFactoryChannel1Measure17
    goto franticFactoryChannel1Measure16

franticFactoryChannel1Measure17:
; Measure 17
    octave 4
    vol $6
    vibrato $01
    env $0 $00
    beat c 3 d 2 ds 2 g 1
; Measure 18
.redefine HI_VOL $6
.redefine LO_VOL $3
    volbeat c 2 r 6
; Measure 19
    vol $6
    beat c 3 d 2 ds 2 g 1
; Measure 20
    volbeat fs 2 r 6

; Measure 21
    vol $6
    beat od b 3 ou cs 1 d 2 od b 2
; Measure 22
    beat a 2 ou c 4 od a 2
; Measure 23
    beat gs 4 ou c 2 f 2
; Measure 24   
    beat g 3 f 1 ds 2 d 2
; Measure 25
    volbeat c 2 r 6

.redefine BEAT 8    ;sixteenth
; Measure 26
    octave 4
    vol $6
    vibrato $02
    duty $01
    beat c 4 r 2 d 2 ds 4 g 4
; Measure 27
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4
; Measure 28
    beat f 4 r 2 g 1 gs 1
    beat ds 4 r 2 f 1 g 1
; Measure 29
    beat cs 4 r 2 ds 1 f 1
    beat g 4 od g 4

; Measure 30
    octaveu
     beat c 4 r 2 d 2 ds 4 g 4
; Measure 31
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4 
; Measure 32
    beat fs 4 as 4 fs 4 cs 4
; Measure 33
    beat c 4 g 4 c 4 r 4


.redefine BEAT 64   ;half
; Measure 34
    octave 3  
    duty $02
    vibrato $01
    vol $3

    beat c 2
; Measure 35
    beat ds 1 g 1
; Measure 36
    beat c 1 ds 1
; Measure 37
    beat cs 1 d 1
; Measure 38
    beat c 2
; Measure 39
    beat ds 1 g 1
; Measure 40
    beat fs 2
; Measure 41
    beat c 2

; Measure 42
.redefine BEAT 16   ;eighth
    octave 4
    vibrato $00

    beat f 2 gs 1 g 1
    beat gs 2 ou c 2
; Measure 43
    beat od b 2 b 1 ou c 1
    beat d 1 c 1 od b 2
; Measure 44
    beat as 2 as 1 ou c 1
    beat cs 2 od as 2
; Measure 45
    beat b 1 g 1 d 1 g 1
    beat b 3 r 1
; Measure 46
    beat as 3 ou c 1
    beat cs 2 c 1 od as 1
; Measure 47
    beat b 2 g 2 b 2 ou d 2
; Measure 48
    beat f 2 cs 2 od as 2 f 2
; Measure 49
    beat g 2 b 2 ou d 2 g 2

.redefine BEAT 8    ;sixteenth
; Measure 50
    octave 5
    vol $8
    vibrato $01
    env $0 $00
    beat c 4 r 2 d 2 ds 4 g 4
; Measure 51
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4
; Measure 52
    beat f 4 r 2 g 1 gs 1
    beat ds 4 r 2 f 1 g 1
; Measure 53
    beat cs 4 r 2 ds 1 f 1
    beat g 4 od g 4

; Measure 54
    octaveu
     beat c 4 r 2 d 2 ds 4 g 4
; Measure 55
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4 
; Measure 56
    beat fs 4 as 4 fs 4 cs 4
; Measure 57
    beat c 4 g 4 c 4 r 4

    goto franticFactoryChannel1Measure1
    cmdff


franticFactoryChannel0:
franticFactoryChannel0Measure1:
    resetCoda
.redefine BEAT 16       ;eighth
.redefine CHANNEL 0
; Measure 1
    octave 5
    vol $3
    duty $02
    vibrato $00
    env $0 $06
.rept 2
    beat c 1 gs 1 ds 1 gs 1
.endr
; Measure 2
.rept 2
    beat d 1 gs 1 f 1 gs 1
.endr
; Measure 3
    octaved
    beat b 1 ou gs 1 f 1 gs 1
    beat f 1 gs 1 d 1 gs 1
; Measure 4
    beat c 1 gs 1 ds 1 gs 1
    beat c 4

; Measure 5
.rept 2
    beat c 1 gs 1 ds 1 gs 1
.endr
; Measure 6
    beat c 1 a 1 d 1 ou c 1
    beat od fs 1 a 1 d 1 ou c 1
; Measure 7
    beat od c 1 ou c 1 od d 1 ou c 1
    beat od f 1 ou c 1 od d 1 ou c 1
; Measure 8
    octaved
    beat c 1 gs 1 ds 1 gs 1
    beat c 4

franticFactoryChannel0Measure9:
; Measure 9-11,16
.redefine HI_VOL $3
.redefine LO_VOL $1
.redefine NO_FIRST_VOL 0
.redefine LO_VOL_RATIO 1/2
    incCoda
    octave 3
    duty $02
    env $0 $00
    volbeat g 1 r 1

    gotoCond 0+12 franticFactoryChannel0Measure12
    gotoCond 28+4 franticFactoryChannel0Measure17
    goto franticFactoryChannel0Measure9

franticFactoryChannel0Measure12:
; Measure 12-13
    incCoda
    volbeat fs 1 r 1

    gotoCond 12+8 franticFactoryChannel0Measure14
    goto franticFactoryChannel0Measure12

franticFactoryChannel0Measure14:
; Measure 14
    incCoda
    volbeat a 1 r 1

    gotoCond 20+4 franticFactoryChannel0Measure15
    goto franticFactoryChannel0Measure14

franticFactoryChannel0Measure15:
; Measure 15
    incCoda
    volbeat gs 1 r 1

    gotoCond 24+4 franticFactoryChannel0Measure9
    goto franticFactoryChannel0Measure15


franticFactoryChannel0Measure17:
.redefine HI_VOL $5
.redefine LO_VOL $2
; Measure 17-19
    incCoda
    volbeat c 1 r 2 od g 1

    gotoCond 32+6 franticFactoryChannel0Measure20
    goto franticFactoryChannel0Measure17

franticFactoryChannel0Measure20:
; Measure 20-21
    incCoda
    volbeat b 1 r 2 fs 1

    gotoCond 38+4 franticFactoryChannel0Measure22
    goto franticFactoryChannel0Measure20

franticFactoryChannel0Measure22:
; Measure 22
.rept 2
    volbeat a 1 r 2 e 1
.endr
; Measure 23
.rept 2
    volbeat f 1 r 2 ou c 1 
    octaved
.endr
; Measure 24
.rept 2
    volbeat g 1 r 2 ou d 1 
    octaved
.endr
; Measure 25-33
.redefine HI_VOL $6
.redefine LO_VOL $3
    volbeat c 1
.redefine BEAT 1
    beat r 255 r 255 r 255 r 255 r 116

; Measure 34
.redefine BEAT 16   ;eighth
    octave 5
    env $0 $06
    vol $4
.rept 2    
    beat c 1 g 1 ds 1 g 1
.endr
; Measure 35
    beat c 1 gs 1 ds 1 gs 1
    beat c 1 g 1 ds 1 g 1
; Measure 36
    beat c 1 gs 1 f 1 gs 1
    beat c 1 g 1 ds 1 g 1
; Measure 37
    beat cs 1 gs 1 f 1 gs 1
    beat d 1 g 1 f 1 d 1

; Measure 38
.rept 2    
    beat c 1 g 1 ds 1 g 1
.endr
; Measure 39
    beat c 1 gs 1 ds 1 gs 1
    beat c 1 g 1 ds 1 g 1
; Measure 40
.rept 2
    octaved
    beat as 1 ou fs 1 cs 1 fs 1
.endr
; Measure 41
.rept 2    
    beat c 1 g 1 ds 1 g 1
.endr

; Measure 42
    octave 3
.rept 2
    beat f 1 gs 1 ou c 1 od gs 1
.endr
; Measure 43
.rept 2
    beat g 1 b 1 ou d 1 od b 1
.endr

franticFactoryChannel0Measure44:
    incCoda
; Measure 44,46,48
.rept 2
    beat f 1 as 1 ou cs 1 od as 1
.endr
; Measure 45,47,49
    beat g 1 b 1 ou d 1 g 1
    beat d 1 od b 1 g 1 d 1

    gotoCond 42+3 franticFactoryChannel0Measure50
    goto franticFactoryChannel0Measure44

franticFactoryChannel0Measure50:
; Measure 50
    vibrato $01
.redefine BEAT 64   ;half
    octave 3
    beat g 2
; Measure 51
    beat gs 1 ds 1
; Measure 52
    beat f 1 g 1
; Measure 53
    beat gs 1 g 1
; Measure 54
    beat g 2
; Measure 55
    beat as 1 ds 1
; Measure 56
    beat cs 2
; Measure 57
    beat g 2

    goto franticFactoryChannel0Measure1
    cmdff


franticFactoryChannel4:
.redefine CHANNEL 4
; Measure 1-4
.redefine BEAT 1
    beat r 255 r 255 r 2

franticFactoryChannel4Measure5:
.redefine BEAT 16       ;eighth
    resetCoda
; Measure 5-6
    duty $0e
.rept 2
    beat c 1 r 5 c 1 r 1
.endr
; Measure 7
    beat c 1 r 3 od gs 1 r 3
; Measure 8
    beat ou c 1 r 7

; Measure 9
    octave 2
    beat c 3 d 2 ds 2 g 1
; Measure 10
    beat c 2 r 6
; Measure 11
    beat c 3 d 2 ds 2 g 1
; Measure 12
    beat fs 2 r 6

; Measure 13
    beat od b 3 ou cs 1 d 2 od b 2
; Measure 14
    beat a 2 ou c 4 od a 2
; Measure 15
    beat gs 4 ou c 2 f 2
; Measure 16   
    beat g 3 f 1 ds 2 d 2

; Measure 17-24
    beat c 2
.redefine BEAT 1
    beat r 255 r 255 r 255 r 227

franticFactoryChannel4Measure25:
.redefine BEAT 16   ;eighth
; Measure 25-31,33
    octave 6
.redefine HI_VOL $09
.redefine LO_VOL $08
.redefine NO_FIRST_VOL 0
.redefine LO_VOL_RATIO 1/2

    incCoda
    volbeat c 1 od c 1

    gotoCond 0+28 franticFactoryChannel4Measure32
    gotoCond 32+4 franticFactoryChannel4Measure34
    goto franticFactoryChannel4Measure25

franticFactoryChannel4Measure32:
; Measure 32
    incCoda
    volbeat ou cs 1 od cs 1

    gotoCond 28+4 franticFactoryChannel4Measure25
    goto franticFactoryChannel4Measure32

franticFactoryChannel4Measure34:
.redefine BEAT 8    ;sixteenth
; Measure 34
    octave 2
    duty $0e
    beat c 4 r 2 d 2 ds 4 g 4
; Measure 35
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4
; Measure 36
    beat f 4 r 2 g 1 gs 1
    beat ds 4 r 2 f 1 g 1
; Measure 37
    beat cs 4 r 2 ds 1 f 1
    beat g 4 od g 4

; Measure 38
    octaveu
     beat c 4 r 2 d 2 ds 4 g 4
; Measure 39
    beat gs 4 r 2 as 1 gs 1
    beat g 4 r 4 
; Measure 40
    beat fs 4 as 4 fs 4 cs 4
; Measure 41-49
    beat c 4 g 4 c 4
.redefine BEAT 1
    beat r 255 r 255 r 255 r 255 r 36

.redefine BEAT 64   ;half
; Measure 50
    octave 3
    beat c 2
; Measure 51
    beat ds 1 g 1
; Measure 52
    beat c 1 ds 1
; Measure 53
    beat cs 1 d 1
; Measure 54
    beat c 2
; Measure 55
    beat ds 1 g 1
; Measure 56
    beat fs 2
; Measure 57
    beat c 2

.redefine BEAT 16   ;eighth
; Measure 58
    octave 3
    beat c 1 r 5 c 1 r 1
; Measure 59
    octaved
    beat g 1 r 5 g 1 r 1
; Measure 60
    beat g 1 r 3 a 1 r 1 b 1 r 1
; Measure 61
    beat ou c 1 r 7

    goto franticFactoryChannel4Measure5
    cmdff


.define franticFactoryChannel6 MUSIC_CHANNEL_FALLBACK EXPORT