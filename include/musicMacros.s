.enum $0
	c1: db	; $00
	cs1: db ; $01
	d1: db	; $02
	ds1: db	; $03
	e1: db	; $04
	f1: db	; $05
	fs1: db	; $06
	g1: db	; $07
	gs1: db ; $08
	a1: db	; $09
	as1: db ; $0a
	b1: db	; $0b
	c2: db	; $0c
	cs2: db	; $0d
	d2: db	; $0e
	ds2: db	; $0f
	e2: db	; $10
	f2: db	; $11
	fs2: db	; $12
	g2: db	; $13
	gs2: db	; $14
	a2: db	; $15
	as2: db ; $16
	b2: db  ; $17
	c3: db  ; $18
	cs3: db ; $19
	d3: db  ; $1a
	ds3: db ; $1b
	e3: db  ; $1c
	f3: db  ; $1d
	fs3: db ; $1e
	g3: db  ; $1f
	gs3: db	; $20
	a3: db	; $21
	as3: db	; $22
	b3: db	; $23
	c4: db	; $24
	cs4: db	; $25
	d4: db	; $26
	ds4: db	; $27
	e4: db	; $28
	f4: db	; $29
	fs4: db	; $2a
	g4: db	; $2b
	gs4: db	; $2c
	a4: db	; $2d
	as4: db	; $2e
	b4: db	; $2f
	c5: db	; $30
	cs5: db	; $31
	d5: db	; $32
	ds5: db	; $33
	e5: db	; $34
	f5: db	; $35
	fs5: db	; $36
	g5: db	; $37
	gs5: db	; $38
	a5: db	; $39
	as5: db	; $3a
	b5: db	; $3b
	c6: db	; $3c
	cs6: db	; $3d
	d6: db	; $3e
	ds6: db	; $3f
	e6: db	; $40
	f6: db	; $41
	fs6: db	; $42
	g6: db	; $43
	gs6: db	; $44
	a6: db	; $45
	as6: db	; $46
	b6: db	; $47
	c7: db	; $48
	cs7: db	; $49
	d7: db	; $4a
	ds7: db	; $4b
	e7: db	; $4c
	f7: db	; $4d
	fs7: db	; $4e
	g7: db	; $4f
	gs7: db	; $50
	a7: db	; $51
	as7: db	; $52
	b7: db	; $53
	c8: db	; $54
	cs8: db	; $55
	d8: db	; $56
	ds8: db	; $57
	e8: db	; $58
	f8: db	; $59
	fs8: db	; $5a
	g8: db	; $5b
	gs8: db	; $5c
	a8: db	; $5d
	as8: db	; $5e
	b8: db	; $5f
.ende

.macro tempo
	.redefine Q (150*24 - (150*24) # \1) / \1

	.if ((150*24) # \1) >= 0.5*\1
		.redefine Q Q+1
	.endif

	.redefine T1 (Q - (Q # 8))/8
	.redefine T2 (Q * 2 - ((Q * 2) # 8))/8 - T1
	.redefine T3 (Q * 3 - ((Q * 3) # 8))/8 - (T1+T2)
	.redefine T4 (Q * 4 - ((Q * 4) # 8))/8 - (T1+T2+T3)
	.redefine T5 (Q * 5 - ((Q * 5) # 8))/8 - (T1+T2+T3+T4)
	.redefine T6 (Q * 6 - ((Q * 6) # 8))/8 - (T1+T2+T3+T4+T5)
	.redefine T7 (Q * 7 - ((Q * 7) # 8))/8 - (T1+T2+T3+T4+T5+T6)
	.redefine T8 (Q * 8 - ((Q * 8) # 8))/8 - (T1+T2+T3+T4+T5+T6+T7)

	.redefine S1 T1+T2
	.redefine S2 T3+T4
	.redefine S3 T5+T6
	.redefine S4 T7+T8
	.redefine E1 S1+S2
	.redefine E2 S3+S4
	.redefine HF Q*2
	.redefine W Q*4
	.redefine BEAT 1

	.redefine W1 (Q - (Q # 12))/12
	.redefine W2 (Q * 2 - ((Q * 2) # 12))/12 - W1
	.redefine W3 (Q * 3 - ((Q * 3) # 12))/12 - (W1+W2)
	.redefine W4 (Q * 4 - ((Q * 4) # 12))/12 - (W1+W2+W3)
	.redefine W5 (Q * 5 - ((Q * 5) # 12))/12 - (W1+W2+W3+W4)
	.redefine W6 (Q * 6 - ((Q * 6) # 12))/12 - (W1+W2+W3+W4+W5)
	.redefine W7 (Q * 7 - ((Q * 7) # 12))/12 - (W1+W2+W3+W4+W5+W6)
	.redefine W8 (Q * 8 - ((Q * 8) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7)
	.redefine W9 (Q * 9 - ((Q * 9) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8)
	.redefine W10 (Q * 10 - ((Q * 10) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9)
	.redefine W11 (Q * 11 - ((Q * 11) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9+W10)
	.redefine W12 (Q * 12 - ((Q * 12) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9+W10+W11)

	.redefine Y1 W1+W2
	.redefine Y2 W3+W4
	.redefine Y3 W5+W6
	.redefine Y4 W7+W8
	.redefine Y5 W9+W10
	.redefine Y6 W11+W12
	.redefine R1 Y1+Y2
	.redefine R2 Y3+Y4
	.redefine R3 Y5+Y6
.endm

.macro noteLen
	.redefine X1 (Q - (Q # \1))/\1
	.redefine X2 (Q * 2 - ((Q * 2) # \1))/\1 - X1
	.redefine X3 (Q * 3 - ((Q * 3) # \1))/\1 - (X1+X2)
	.redefine X4 (Q * 4 - ((Q * 4) # \1))/\1 - (X1+X2+X3)
	.redefine X5 (Q * 5 - ((Q * 5) # \1))/\1 - (X1+X2+X3+X4)
	.redefine X6 (Q * 6 - ((Q * 6) # \1))/\1 - (X1+X2+X3+X4+X5)
	.redefine X7 (Q * 7 - ((Q * 7) # \1))/\1 - (X1+X2+X3+X4+X5+X6)
	.redefine X8 (Q * 8 - ((Q * 8) # \1))/\1 - (X1+X2+X3+X4+X5+X6+X7)
	.redefine X9 (Q * 9 - ((Q * 9) # \1))/\1 - (X1+X2+X3+X4+X5+X6+X7+X8)
	.redefine X10 (Q * 10 - ((Q * 10) # \1))/\1 - (X1+X2+X3+X4+X5+X6+X7+X8+X9)
	.redefine X11 (Q * 11 - ((Q * 11) # \1))/\1 - (X1+X2+X3+X4+X5+X6+X7+X8+X9+X10)
	.redefine X12 (Q * 12 - ((Q * 12) # \1))/\1 - (X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11)
.endm	

.redefine od (-1)
.redefine ou (-2)
.redefine r (-3)

.macro octave
	.redefine OCTAVE \1
	.redefine OFFSET (-$c)

	.redefine c 12*\1+0 + OFFSET
	.redefine cs 12*\1+1 + OFFSET
	.redefine d 12*\1+2 + OFFSET
	.redefine ds 12*\1+3 + OFFSET
	.redefine e 12*\1+4 + OFFSET
	.redefine f 12*\1+5 + OFFSET
	.redefine fs 12*\1+6 + OFFSET
	.redefine g 12*\1+7 + OFFSET
	.redefine gs 12*\1+8 + OFFSET
	.redefine a 12*\1+9 + OFFSET
	.redefine as 12*\1+10 + OFFSET
	.redefine b 12*\1+11 + OFFSET
.endm

.macro octaved
	octave OCTAVE-1
.endm
.macro octaveu
	octave OCTAVE+1
.endm

.macro m_soundPointer
	.db :\1Start - :b39_initSound
	.dw \1
.endm

; Byte 1: frequency
; Byte 2: length
;
; Frequencies for noise:
; 22,23,24,26,27,28,29,2a,2e,2f,30,32,52
.macro note
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		wait1 \2
		.shift
		.shift
	.else
	.if \1 >= 0
		.db \1+offset
		.db \2

		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm

; This is NOT used by the base game; it's an attempt to provide a more sane way to define music
; (multiple notes per line). Each pair of arguments is a note followed by a length. Can define
; "NOTE_END_WAIT" to set a certain amount of a note to be "rest" instead of being actually played.
.macro beat
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		wait1 \2*BEAT
		.shift
		.shift
	.else
	.if \1 >= 0
		.db \1+offset

		.ifndef NOTE_END_WAIT
			.define NOTE_END_WAIT 0
		.endif

		.if NOTE_END_WAIT != 0
			.db \2*BEAT - NOTE_END_WAIT
			wait1 NOTE_END_WAIT
		.else
			.db \2*BEAT
		.endif

		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm

; A variation of the "beat" macro that includes a common functionality of the
; volume adjustments in the music. 
;	volbeat a 2
;	
;	vol $6
;	beat a 1
;	vol $3
;	beat a 1
.macro volbeat
		.ifndef HI_VOL
			.define HI_VOL 0
		.endif	

		.ifndef LO_VOL
			.define LO_VOL 0
		.endif
			
		.ifndef NO_FIRST_VOL
			.define NO_FIRST_VOL 0
		.endif

		.ifndef REST
			.define REST 0
		.endif
		.redefine REST 0

		.ifndef CHANNEL
			.define CHANNEL 0
		.endif
		.ifndef NOTE_MID_WAIT
			.define NOTE_MID_WAIT 0
		.endif

		.ifndef NOTE_END_WAIT
			.define NOTE_END_WAIT 0
		.endif

	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		wait1 \2*BEAT
		.shift
		.shift
	.else
	.if \1 >= 0
		;First volume change
		.if NO_FIRST_VOL == 0
			.if CHANNEL == 4
				duty HI_VOL
			.else
				vol HI_VOL
			.endif
			;revert NO_FIRST_VOL after initial use (unused)
			;.redefine NO_FIRST_VOL 0
		.endif

		;First note
		.db \1+offset

		.redefine LO_LENGTH ((\2*BEAT)-((\2*BEAT)#(1/LO_VOL_RATIO)))*LO_VOL_RATIO
		.if ((\2*BEAT)#(1/LO_VOL_RATIO)) >= 0.5/LO_VOL_RATIO
			.redefine LO_LENGTH LO_LENGTH + 1
		.endif
		.redefine HI_LENGTH (\2*BEAT)-LO_LENGTH	

		.if NOTE_MID_WAIT != 0
			.db HI_LENGTH - NOTE_MID_WAIT
			wait1 NOTE_MID_WAIT
		.else
			.db HI_LENGTH
		.endif

		;Second volume change
		.if CHANNEL == 4
			duty LO_VOL
		.else
			vol LO_VOL
		.endif

		;Second note
		.db \1+offset

		.if NARGS >= 4
			.if \3 == r
				.redefine REST \4*BEAT
			.endif
		.endif


		.if NOTE_END_WAIT != 0	
			.db LO_LENGTH - (NOTE_END_WAIT + REST)
			wait1 NOTE_END_WAIT + REST
		.else
			.db LO_LENGTH
		.endif

		.if NARGS >= 4
			.if \3 == r
				.if NOTE_END_WAIT == 0
					wait1 REST
				.endif
				.shift
				.shift
			.endif
		.endif

		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm


.macro volbeat2
		.ifndef HI_VOL
			.define HI_VOL 0
		.endif	

		.ifndef LO_VOL
			.define LO_VOL 0
		.endif
			
		.ifndef NO_FIRST_VOL
			.define NO_FIRST_VOL 0
		.endif

		.ifndef REST
			.define REST 0
		.endif
		.redefine REST 0

		.ifndef CHANNEL
			.define CHANNEL 0
		.endif
		.ifndef NOTE_MID_WAIT
			.define NOTE_MID_WAIT 0
		.endif

		.ifndef NOTE_END_WAIT
			.define NOTE_END_WAIT 0
		.endif
; Octaves
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif
; Rests
	.if NARGS >= 2
	.if \1 == r
		wait1 \2*BEAT
		.shift
		.shift
	.else
; Notes		
	.if \1 >= 0
		;First volume change
		.if NO_FIRST_VOL == 0
			.if CHANNEL == 4
				duty HI_VOL
			.else
				vol HI_VOL
			.endif
		.endif










; A variation of the "beat" macro that includes a common functionality of the
; volume adjustments in the music. 
;	volbeat a 2
;	
;	vol $6
;	beat a 1
;	vol $3
;	beat a 1
.macro volbeat3

		.ifndef HI_VOL
			.define HI_VOL 0
		.endif	

		.ifndef LO_VOL
			.define LO_VOL 0
		.endif
			
		.ifndef NO_FIRST_VOL
			.define NO_FIRST_VOL 0
		.endif

		.ifndef REST
			.define REST 0
		.endif
		.redefine REST 0

		.ifndef CHANNEL
			.define CHANNEL 0
		.endif
		.ifndef NOTE_MID_WAIT
			.define NOTE_MID_WAIT 0
		.endif

	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 != r
	.if \1 >= 0
		;First volume change
		.if NO_FIRST_VOL == 0
			.if CHANNEL == 4
				duty HI_VOL
			.else
				vol HI_VOL
			.endif
		.endif

		;First note
		.db \1+offset

		.if NOTE_MID_WAIT != 0
			.db \2*BEAT*(1-LO_VOL_RATIO) - NOTE_MID_WAIT
			wait1 NOTE_MID_WAIT
		.else
			.db \2*BEAT*(1-LO_VOL_RATIO)
		.endif

		;Second volume change
		.if CHANNEL == 4
			duty LO_VOL
		.else
			vol LO_VOL
		.endif

		;Second note
		.db \1+offset

		.ifndef NOTE_END_WAIT
			.define NOTE_END_WAIT 0
		.endif

		.if NOTE_END_WAIT != 0
			.db \2*BEAT*LO_VOL_RATIO - (NOTE_END_WAIT + REST)
			wait1 NOTE_END_WAIT + REST
		.else
			.db \2*BEAT*LO_VOL_RATIO
		.endif
		.shift
		.shift
	.else
		.if NOTE_END_WAIT != 0
			.define REST \2
			.shift
			.shift	
		.else
			wait1 \2*BEAT
			.shift
			.shift
		.endif
	.endif
	.endif
	.endif
	.endr
.endm


;; Used in Tarm Ruins music
;	tarmbeat a 24 b 24 c 24
;
;	vol HI_VOL
;	beat a 12
;	wait1 12
;
;	beat b 12
;	vol LO_VOL
;	beat a 12
;
;	vol HI_VOL
;	beat c 12
;	vol LO_VOL
;	beat b 12
;
;
.macro tarmbeat
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		wait1 \2*BEAT
		.shift
		.shift
	.else
	.if \1 >= 0


		.ifndef HI_VOL
			.define HI_VOL 0
		.endif	

		.ifndef LO_VOL
			.define LO_VOL 0
		.endif
			
		.ifndef NO_FIRST_VOL
			.define NO_FIRST_VOL 0
		.endif	

		.ifndef CHANNEL
			.define CHANNEL 0
		.endif
			
		.ifndef TARM_NOTE
			.define TARM_NOTE 0
		.endif

		;First volume change
		.if NO_FIRST_VOL == 0
			.if CHANNEL == 4
				duty HI_VOL
			.else
				vol HI_VOL
			.endif
		.endif
		;First note
		.db \1+offset
		.db \2*BEAT*(1-LO_VOL_RATIO)

		;Second volume change
		.if TARM_NOTE != 0
			.if CHANNEL == 4
				duty LO_VOL
			.else
				vol LO_VOL
			.endif

		;Second note
			.db TARM_NOTE
			.db \2*BEAT*LO_VOL_RATIO
			.redefine NO_FIRST_VOL 0
		.else
			wait1 \2*BEAT*LO_VOL_RATIO
			.redefine NO_FIRST_VOL 1
		.endif

			.redefine TARM_NOTE \1+offset


		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm

.macro rest
	.rept (\1 - (\1#$100))/$100
		wait1 $00
	.endr
	wait1 \1 # $100
.endm

; 60/61: set wait counters.

.macro wait1
	.db $60 \1
.endm

.macro wait2
	.db $61 \1
.endm

; d0-df: set volume
.macro vol
	.if \1 > $f
		.fail
	.endif
	.db $d0 | \1
.endm

; e0-e7: set envelopes
.macro env
	.if \1 > $7
		.fail
	.endif
	.if \2 > $7
		.fail
	.endif
	.db $e0 | \1
	.db \2
.endm

; e8-ef: same as e0-e7

; f0: unknown
; Sometimes sets wc039
.macro cmdf0
	.db $f0 \1
.endm

; f1-f3: does nothing
.macro gotoCond
	.db $f1
	.db \1
	.dw \2
.endm
.macro cmdf2
	.db $f2
.endm
; increases wCoda
.macro incCoda
	.db $f3
.endm

; f4-f5: duplicates of ff?
; sets Coda back to zero
.macro resetCoda
	.db $f4
.endm
.macro cmdf5
	.db $f5
.endm

; f6: sets wChannelDutyCycles
; Channels other than 4 and 5 are modulated by $03
.macro duty
	.db $f6 \1
.endm

; f7: duplicate of ff?

; f8: sets wc03f (for channels 0-5)
.macro cmdf8
	.db $f8 \1
.endm

; f9: sets wChannelVibratos.
; Upper nibble is time to wait until vibrato starts.
; Lower nibble is intensity of vibrato.
.macro vibrato
	.db $f9 \1
.endm

; fa-fc: duplicates of ff?

; fd: sets wc033
; Shifts pitch
.macro cmdfd
	.db $fd \1
.endm

; fe: jump to the given address
.macro goto
	.db $fe
	.dw \1
.endm

; ff: might mute the channel?
.macro cmdff
	.db $ff
.endm
