warpDestTable: ; $12f5b
	.dw group0WarpDestTable
	.dw group1WarpDestTable
	.dw group2WarpDestTable
	.dw group3WarpDestTable
	.dw group4WarpDestTable
	.dw group5WarpDestTable
	.dw group6WarpDestTable
	.dw group7WarpDestTable

; Explanation:
;
; Byte 0: Room index to warp to. (Group is implicitly known from which table
;   it's in.)
; Byte 1: Y/X position to spawn at.
; Param 2: Parameter. What this does depends on the transition type? (ie. walk
;   in from top or bottom of screen?)
; Param 3: Transition dest type (see constants/transitions.s).

group0WarpDestTable:
	m_WarpDest $48 $21 $0 $1
	m_WarpDest $01 $26 $0 $1
	m_WarpDest $ba $55 $0 $1
	m_WarpDest $03 $35 $0 $e
	m_WarpDest $0a $17 $0 $1
	m_WarpDest $48 $28 $0 $1
	m_WarpDest $87 $61 $0 $1
	m_WarpDest $38 $ff $9 $3
	m_WarpDest $16 $15 $0 $1
	m_WarpDest $02 $22 $0 $1
	m_WarpDest $04 $27 $0 $1
	m_WarpDest $06 $48 $0 $1
	m_WarpDest $12 $35 $0 $1
	m_WarpDest $14 $34 $0 $1
	m_WarpDest $60 $58 $0 $1
	m_WarpDest $40 $16 $0 $1
	m_WarpDest $09 $37 $0 $1
	m_WarpDest $70 $18 $0 $1
	m_WarpDest $51 $01 $0 $1
	m_WarpDest $0b $41 $0 $1
	m_WarpDest $0b $43 $0 $1
	m_WarpDest $0b $27 $0 $1
	m_WarpDest $0c $54 $0 $1
	m_WarpDest $0d $42 $0 $1
	m_WarpDest $0d $45 $0 $1
	m_WarpDest $18 $04 $0 $1
	m_WarpDest $27 $15 $0 $1
	m_WarpDest $1b $36 $0 $1
	m_WarpDest $1b $08 $0 $1
	m_WarpDest $1c $43 $0 $1
	m_WarpDest $1c $37 $0 $1
	m_WarpDest $1d $13 $0 $1
	m_WarpDest $1d $27 $0 $1
	m_WarpDest $27 $55 $0 $1
	m_WarpDest $57 $28 $0 $1
	m_WarpDest $2b $23 $0 $1
	m_WarpDest $37 $33 $0 $1
	m_WarpDest $38 $26 $0 $e
	m_WarpDest $38 $52 $0 $1
	m_WarpDest $38 $57 $0 $1
	m_WarpDest $39 $31 $0 $1
	m_WarpDest $3a $23 $0 $1
	m_WarpDest $3c $34 $0 $1
	m_WarpDest $3d $13 $0 $1
	m_WarpDest $3d $27 $0 $1
	m_WarpDest $45 $52 $0 $1
	m_WarpDest $47 $25 $0 $1
	m_WarpDest $47 $27 $0 $1
	m_WarpDest $00 $11 $0 $1
	m_WarpDest $53 $52 $0 $e
	m_WarpDest $4d $38 $0 $1
	m_WarpDest $02 $27 $0 $0
	m_WarpDest $55 $42 $0 $1
	m_WarpDest $02 $27 $0 $1
	m_WarpDest $15 $14 $0 $1
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $15 $14 $0 $1
	m_WarpDest $01 $41 $0 $1
	m_WarpDest $13 $37 $0 $1
	m_WarpDest $68 $25 $0 $1
	m_WarpDest $68 $27 $0 $1
	m_WarpDest $76 $45 $0 $e
	m_WarpDest $79 $11 $0 $1
	m_WarpDest $7c $35 $0 $1
	m_WarpDest $89 $45 $0 $1
	m_WarpDest $8d $61 $0 $1
	m_WarpDest $a0 $03 $0 $1
	m_WarpDest $a3 $32 $0 $1
	m_WarpDest $a5 $23 $0 $e
	m_WarpDest $bd $11 $0 $1
	m_WarpDest $c5 $33 $0 $1
	m_WarpDest $cd $52 $0 $1
	m_WarpDest $da $06 $0 $1
	m_WarpDest $dd $25 $0 $1
	m_WarpDest $e0 $46 $0 $1
	m_WarpDest $e1 $53 $0 $1
	m_WarpDest $e1 $26 $0 $1
	m_WarpDest $24 $55 $0 $1
	m_WarpDest $f1 $43 $0 $1
	m_WarpDest $56 $57 $0 $1
	m_WarpDest $26 $51 $0 $1
	m_WarpDest $55 $38 $0 $1
	m_WarpDest $44 $45 $0 $1
	m_WarpDest $77 $46 $0 $1
	m_WarpDest $77 $46 $0 $1
	m_WarpDest $77 $46 $0 $1
	m_WarpDest $77 $46 $0 $1
	m_WarpDest $56 $38 $0 $1
	m_WarpDest $66 $01 $0 $1
	m_WarpDest $78 $51 $0 $1
	m_WarpDest $36 $12 $0 $1
	m_WarpDest $03 $16 $0 $e
	m_WarpDest $26 $17 $0 $1
	m_WarpDest $26 $51 $0 $1
	m_WarpDest $54 $51 $0 $1
	m_WarpDest $74 $62 $0 $1
	m_WarpDest $54 $11 $0 $1
	m_WarpDest $74 $62 $0 $1
	m_WarpDest $45 $18 $0 $1
	m_WarpDest $67 $28 $0 $1
	m_WarpDest $23 $43 $0 $1
	m_WarpDest $78 $35 $9 $1
	m_WarpDest $13 $15 $0 $1
	m_WarpDest $06 $03 $0 $1
	m_WarpDest $57 $02 $0 $1
	m_WarpDest $68 $18 $0 $1
	m_WarpDest $68 $11 $0 $1
	m_WarpDest $13 $33 $0 $1
	m_WarpDest $28 $35 $0 $1
	m_WarpDest $08 $27 $0 $1
	m_WarpDest $84 $61 $0 $1
	m_WarpDest $86 $61 $0 $1
	m_WarpDest $85 $61 $0 $1
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $30 $47 $0 $1
	m_WarpDest $00 $00 $0 $4
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $70 $46 $0 $1
	m_WarpDest $40 $56 $0 $1
	m_WarpDest $00 $00 $0 $3
	m_WarpDest $3a $68 $0 $1
	m_WarpDest $60 $49 $0 $4
	m_WarpDest $63 $57 $0 $1
	m_WarpDest $52 $33 $0 $1
	m_WarpDest $70 $44 $0 $e
	m_WarpDest $40 $17 $0 $1
	m_WarpDest $30 $31 $0 $1
	m_WarpDest $73 $32 $0 $1
	m_WarpDest $33 $14 $0 $1
	m_WarpDest $20 $61 $0 $1

group1WarpDestTable:
	m_WarpDest $48 $21 $0 $1
	m_WarpDest $83 $25 $0 $1
	m_WarpDest $50 $17 $0 $1
	m_WarpDest $02 $07 $0 $1
	m_WarpDest $38 $ff $9 $3
	m_WarpDest $0e $ff $9 $3
	m_WarpDest $0e $16 $0 $4
	m_WarpDest $01 $18 $0 $1
	m_WarpDest $02 $22 $0 $1
	m_WarpDest $04 $27 $0 $1
	m_WarpDest $05 $13 $0 $1
	m_WarpDest $78 $35 $0 $1
	m_WarpDest $68 $18 $0 $1
	m_WarpDest $09 $35 $0 $1
	m_WarpDest $0b $41 $0 $1
	m_WarpDest $0b $27 $0 $1
	m_WarpDest $0c $54 $0 $1
	m_WarpDest $0d $52 $0 $1
	m_WarpDest $12 $55 $0 $1
	m_WarpDest $13 $55 $0 $e
	m_WarpDest $14 $34 $0 $1
	m_WarpDest $18 $04 $0 $1
	m_WarpDest $1c $43 $0 $1
	m_WarpDest $1d $13 $0 $1
	m_WarpDest $23 $05 $0 $e
	m_WarpDest $27 $47 $0 $1
	m_WarpDest $20 $14 $0 $1
	m_WarpDest $2b $23 $0 $1
	m_WarpDest $2d $07 $0 $1
	m_WarpDest $38 $52 $0 $1
	m_WarpDest $73 $32 $0 $1
	m_WarpDest $3c $34 $0 $1
	m_WarpDest $3d $27 $0 $1
	m_WarpDest $41 $51 $0 $1
	m_WarpDest $41 $57 $0 $1
	m_WarpDest $43 $48 $0 $1
	m_WarpDest $45 $52 $0 $1
	m_WarpDest $4d $38 $0 $1
	m_WarpDest $51 $15 $0 $e
	m_WarpDest $55 $41 $0 $1
	m_WarpDest $56 $27 $0 $1
	m_WarpDest $57 $36 $0 $1
	m_WarpDest $58 $32 $0 $1
	m_WarpDest $58 $35 $0 $1
	m_WarpDest $5a $31 $0 $1
	m_WarpDest $66 $54 $0 $1
	m_WarpDest $40 $17 $0 $1
	m_WarpDest $62 $32 $0 $1
	m_WarpDest $71 $22 $0 $1
	m_WarpDest $62 $67 $0 $1
	m_WarpDest $51 $27 $0 $1
	m_WarpDest $76 $45 $0 $e
	m_WarpDest $63 $47 $0 $1
	m_WarpDest $91 $11 $0 $1
	m_WarpDest $a3 $36 $0 $1
	m_WarpDest $a5 $23 $0 $e
	m_WarpDest $a7 $24 $0 $1
	m_WarpDest $a7 $26 $0 $1
	m_WarpDest $ad $15 $0 $1
	m_WarpDest $ba $55 $0 $1
	m_WarpDest $33 $14 $0 $1
	m_WarpDest $30 $37 $0 $1
	m_WarpDest $bd $11 $0 $1
	m_WarpDest $c5 $38 $0 $1
	m_WarpDest $10 $64 $0 $1
	m_WarpDest $cd $34 $0 $1
	m_WarpDest $cd $11 $0 $1
	m_WarpDest $d9 $48 $0 $1
	m_WarpDest $da $06 $0 $1
	m_WarpDest $db $01 $0 $1
	m_WarpDest $dd $31 $0 $1
	m_WarpDest $40 $28 $0 $1
	m_WarpDest $e2 $32 $0 $4
	m_WarpDest $12 $55 $0 $1
	m_WarpDest $12 $45 $0 $1
	m_WarpDest $70 $43 $0 $1

group2WarpDestTable:
	m_WarpDest $5e $f6 $0 $3
	m_WarpDest $0e $ff $9 $3
	m_WarpDest $0f $ff $9 $3
	m_WarpDest $1e $ff $9 $3
	m_WarpDest $1f $f4 $9 $3
	m_WarpDest $2e $68 $0 $4
	m_WarpDest $2f $ff $9 $3
	m_WarpDest $3e $f7 $9 $3
	m_WarpDest $3f $ff $9 $3
	m_WarpDest $4e $18 $0 $4
	m_WarpDest $4f $f2 $9 $3
	m_WarpDest $08 $ff $0 $3
	m_WarpDest $18 $ff $0 $3
	m_WarpDest $5e $31 $0 $4
	m_WarpDest $5f $31 $0 $4
	m_WarpDest $5f $11 $0 $4
	m_WarpDest $6e $ff $9 $3
	m_WarpDest $6f $ff $9 $3
	m_WarpDest $7e $11 $0 $4
	m_WarpDest $7f $ff $9 $3
	m_WarpDest $8e $ff $9 $3
	m_WarpDest $19 $ff $0 $3
	m_WarpDest $8f $14 $0 $4
	m_WarpDest $9e $ff $9 $3
	m_WarpDest $9e $11 $0 $1
	m_WarpDest $9f $f3 $9 $3
	m_WarpDest $9f $f7 $9 $3
	m_WarpDest $9f $15 $0 $4
	m_WarpDest $a1 $25 $0 $e
	m_WarpDest $ae $15 $0 $4
	m_WarpDest $bf $ff $0 $3
	m_WarpDest $af $61 $0 $4
	m_WarpDest $b7 $33 $0 $1
	m_WarpDest $ba $12 $0 $1
	m_WarpDest $be $15 $0 $4
	m_WarpDest $bf $ff $9 $3
	m_WarpDest $bf $15 $0 $4
	m_WarpDest $c0 $32 $0 $4
	m_WarpDest $c1 $46 $0 $4
	m_WarpDest $ce $11 $0 $1
	m_WarpDest $ce $18 $0 $4
	m_WarpDest $cf $ff $9 $3
	m_WarpDest $d0 $22 $0 $1
	m_WarpDest $d0 $25 $0 $1
	m_WarpDest $de $ff $9 $3
	m_WarpDest $28 $ff $0 $3
	m_WarpDest $e3 $ff $9 $3
	m_WarpDest $e3 $16 $0 $4
	m_WarpDest $e4 $ff $9 $3
	m_WarpDest $e5 $ff $9 $3
	m_WarpDest $e6 $f7 $9 $3
	m_WarpDest $5f $22 $0 $1
	m_WarpDest $e8 $61 $0 $4
	m_WarpDest $e8 $68 $0 $4
	m_WarpDest $e9 $ff $9 $3
	m_WarpDest $0f $ff $0 $3
	m_WarpDest $9f $ff $0 $3
	m_WarpDest $4e $18 $0 $1
	m_WarpDest $ae $61 $0 $4
	m_WarpDest $ee $ff $9 $3
	m_WarpDest $29 $ff $0 $3
	m_WarpDest $f3 $ff $9 $3
	m_WarpDest $f4 $ff $9 $3
	m_WarpDest $f5 $ff $9 $3
	m_WarpDest $f6 $ff $9 $3
	m_WarpDest $f7 $ff $9 $3
	m_WarpDest $f8 $ff $9 $3
	m_WarpDest $f9 $f3 $9 $3
	m_WarpDest $fa $15 $0 $4
	m_WarpDest $fb $ff $9 $3
	m_WarpDest $fb $22 $0 $4
	m_WarpDest $fc $f3 $9 $3
	m_WarpDest $fd $f6 $9 $3
	m_WarpDest $fd $48 $0 $4
	m_WarpDest $19 $25 $0 $1
	m_WarpDest $ff $f6 $9 $3
	m_WarpDest $ff $48 $0 $4
	m_WarpDest $29 $28 $0 $1
	m_WarpDest $0a $ff $0 $3
	m_WarpDest $0a $ff $4 $3

group3WarpDestTable:
	m_WarpDest $0f $f4 $9 $3
	m_WarpDest $0f $f5 $9 $3
	m_WarpDest $0f $f6 $9 $3
	m_WarpDest $1a $ff $9 $3
	m_WarpDest $1e $ff $9 $3
	m_WarpDest $1e $12 $0 $4
	m_WarpDest $1e $17 $0 $4
	m_WarpDest $1f $ff $9 $3
	m_WarpDest $1f $12 $0 $4
	m_WarpDest $2e $ff $9 $3
	m_WarpDest $2e $15 $0 $4
	m_WarpDest $2f $ff $9 $3
	m_WarpDest $2f $15 $0 $4
	m_WarpDest $3f $ff $9 $3
	m_WarpDest $4e $52 $0 $4
	m_WarpDest $4e $27 $0 $4
	m_WarpDest $4f $ff $9 $3
	m_WarpDest $5e $ff $9 $3
	m_WarpDest $5f $ff $9 $3
	m_WarpDest $ed $ff $0 $3
	m_WarpDest $6f $ff $9 $3
	m_WarpDest $7e $f4 $9 $3
	m_WarpDest $7f $f6 $9 $3
	m_WarpDest $8c $45 $0 $1
	m_WarpDest $0a $21 $0 $4
	m_WarpDest $8f $68 $0 $4
	m_WarpDest $ed $68 $0 $1
	m_WarpDest $9e $22 $0 $4
	m_WarpDest $9f $22 $1 $4
	m_WarpDest $9f $11 $0 $4
	m_WarpDest $a1 $25 $0 $e
	m_WarpDest $ae $11 $0 $4
	m_WarpDest $af $ff $9 $3
	m_WarpDest $be $18 $0 $4
	m_WarpDest $be $ff $9 $3
	m_WarpDest $bf $ff $9 $3
	m_WarpDest $c1 $46 $0 $1
	m_WarpDest $c5 $55 $0 $1
	m_WarpDest $c7 $46 $0 $1
	m_WarpDest $ce $ff $9 $3
	m_WarpDest $cf $ff $9 $3
	m_WarpDest $d0 $22 $0 $1
	m_WarpDest $d0 $25 $0 $1
	m_WarpDest $de $ff $9 $3
	m_WarpDest $df $ff $9 $3
	m_WarpDest $e3 $ff $9 $3
	m_WarpDest $e4 $ff $9 $3
	m_WarpDest $e5 $ff $9 $3
	m_WarpDest $e6 $ff $9 $3
	m_WarpDest $e7 $ff $9 $3
	m_WarpDest $e8 $ff $9 $3
	m_WarpDest $e9 $18 $0 $1
	m_WarpDest $18 $ff $0 $3
	m_WarpDest $9e $ff $0 $3
	m_WarpDest $ec $f6 $9 $3
	m_WarpDest $ed $ff $9 $3
	m_WarpDest $ee $ff $9 $3
	m_WarpDest $ef $ff $9 $3
	m_WarpDest $f6 $ff $9 $3
	m_WarpDest $00 $00 $0 $1
	m_WarpDest $0a $21 $0 $4
	m_WarpDest $fa $ff $9 $3
	m_WarpDest $08 $21 $0 $1
	m_WarpDest $fc $ff $9 $3
	m_WarpDest $fd $ff $9 $3
	m_WarpDest $fe $ff $9 $3
	m_WarpDest $ff $ff $9 $3
	m_WarpDest $08 $ff $0 $3
	m_WarpDest $49 $15 $0 $1
	m_WarpDest $18 $03 $0 $1
	m_WarpDest $28 $03 $0 $1
	m_WarpDest $48 $64 $0 $1
	m_WarpDest $09 $62 $0 $1
	m_WarpDest $19 $ff $9 $3
	m_WarpDest $09 $07 $0 $4
	m_WarpDest $38 $ff $0 $3
	m_WarpDest $1a $ff $0 $3
	m_WarpDest $59 $f5 $0 $3
	m_WarpDest $58 $ff $f $3
	m_WarpDest $78 $65 $0 $1
	m_WarpDest $68 $65 $0 $1
	m_WarpDest $78 $14 $0 $1
	m_WarpDest $18 $17 $0 $1
	m_WarpDest $1a $61 $0 $1
	m_WarpDest $0a $f7 $9 $3
	m_WarpDest $69 $ff $0 $3
	m_WarpDest $69 $18 $0 $4
	m_WarpDest $69 $48 $9 $1
	m_WarpDest $79 $f6 $9 $3
	m_WarpDest $79 $18 $0 $1
	m_WarpDest $69 $48 $9 $1
	m_WarpDest $79 $18 $0 $1

group4WarpDestTable:
	m_WarpDest $04 $ff $9 $3
	m_WarpDest $0d $ff $9 $3
	m_WarpDest $24 $ff $9 $3
	m_WarpDest $46 $ff $9 $3
	m_WarpDest $66 $ff $9 $3
	m_WarpDest $24 $ff $0 $3
	m_WarpDest $bb $ff $9 $3
	m_WarpDest $ce $ff $9 $3
	m_WarpDest $09 $1a $0 $4
	m_WarpDest $3b $ff $0 $3
	m_WarpDest $77 $ff $0 $3
	m_WarpDest $19 $5b $0 $4
	m_WarpDest $17 $1d $0 $4
	m_WarpDest $37 $63 $0 $4
	m_WarpDest $37 $6b $0 $4
	m_WarpDest $14 $3c $0 $4
	m_WarpDest $1a $37 $0 $4
	m_WarpDest $6c $23 $0 $4
	m_WarpDest $86 $23 $0 $4
	m_WarpDest $99 $23 $0 $4
	m_WarpDest $9b $12 $0 $4
	m_WarpDest $9c $87 $0 $4
	m_WarpDest $a0 $22 $0 $4
	m_WarpDest $a2 $87 $0 $4
	m_WarpDest $a3 $17 $0 $4
	m_WarpDest $a4 $64 $0 $4
	m_WarpDest $ad $27 $0 $4
	m_WarpDest $c2 $15 $0 $4
	m_WarpDest $c3 $22 $0 $4
	m_WarpDest $d0 $ff $9 $3
	m_WarpDest $d0 $11 $0 $4
	m_WarpDest $d0 $17 $0 $4
	m_WarpDest $d0 $19 $0 $4
	m_WarpDest $d0 $1d $0 $4
	m_WarpDest $d0 $31 $0 $4
	m_WarpDest $d0 $35 $0 $4
	m_WarpDest $d0 $39 $0 $4
	m_WarpDest $d0 $51 $0 $4
	m_WarpDest $d0 $55 $0 $4
	m_WarpDest $d0 $59 $0 $4
	m_WarpDest $d0 $5d $0 $4
	m_WarpDest $d0 $71 $0 $4
	m_WarpDest $d0 $77 $0 $4
	m_WarpDest $d0 $91 $0 $4
	m_WarpDest $d0 $9d $0 $4
	m_WarpDest $d1 $57 $0 $4
	m_WarpDest $d1 $11 $0 $4
	m_WarpDest $d1 $17 $0 $4
	m_WarpDest $d1 $19 $0 $4
	m_WarpDest $d1 $1d $0 $4
	m_WarpDest $d1 $31 $0 $4
	m_WarpDest $d1 $35 $0 $4
	m_WarpDest $d1 $39 $0 $4
	m_WarpDest $d1 $51 $0 $4
	m_WarpDest $d1 $55 $0 $4
	m_WarpDest $d1 $59 $0 $4
	m_WarpDest $d1 $5d $0 $4
	m_WarpDest $d1 $71 $0 $4
	m_WarpDest $d1 $77 $0 $4
	m_WarpDest $d1 $91 $0 $4
	m_WarpDest $d1 $9d $0 $4
	m_WarpDest $d2 $57 $0 $4
	m_WarpDest $d2 $8a $0 $4
	m_WarpDest $d3 $57 $0 $4
	m_WarpDest $43 $ff $0 $3
	m_WarpDest $d3 $2c $0 $4
	m_WarpDest $d3 $07 $0 $4
	m_WarpDest $43 $ff $0 $3
	m_WarpDest $e6 $47 $0 $4
	m_WarpDest $5a $ff $0 $3
	m_WarpDest $ea $47 $0 $1
	m_WarpDest $eb $52 $0 $4
	m_WarpDest $f0 $77 $0 $4
	m_WarpDest $f0 $27 $0 $4
	m_WarpDest $f2 $5c $0 $4
	m_WarpDest $fb $5c $0 $4
	m_WarpDest $fe $ff $9 $3
	m_WarpDest $fd $52 $0 $4
	m_WarpDest $7d $ff $0 $3
	m_WarpDest $7c $23 $0 $1
	m_WarpDest $65 $ff $0 $3
	m_WarpDest $5e $ff $9 $3
	m_WarpDest $57 $51 $0 $1
	m_WarpDest $57 $7b $0 $1
	m_WarpDest $5d $ff $0 $3
	m_WarpDest $58 $6b $0 $1
	m_WarpDest $54 $29 $9 $1
	m_WarpDest $51 $ff $0 $3
	m_WarpDest $76 $57 $0 $1
	m_WarpDest $72 $57 $0 $1
	m_WarpDest $7a $57 $0 $1
	m_WarpDest $7a $11 $0 $1
	m_WarpDest $68 $ff $0 $3
	m_WarpDest $7e $ff $0 $3
	m_WarpDest $39 $93 $0 $1
	m_WarpDest $4f $5c $0 $1
	m_WarpDest $61 $47 $0 $1
	m_WarpDest $1a $11 $0 $4
	m_WarpDest $15 $42 $0 $4
	m_WarpDest $14 $3c $0 $4

group5WarpDestTable:
	m_WarpDest $26 $ff $9 $3
	m_WarpDest $56 $ff $9 $3
	m_WarpDest $aa $ff $9 $3
	m_WarpDest $fc $fa $0 $3
	m_WarpDest $2a $91 $0 $4
	m_WarpDest $2a $ff $0 $3
	m_WarpDest $44 $ff $9 $3
	m_WarpDest $23 $51 $0 $4
	m_WarpDest $25 $8c $0 $4
	m_WarpDest $33 $5c $0 $4
	m_WarpDest $35 $8c $0 $4
	m_WarpDest $1a $69 $0 $4
	m_WarpDest $3a $11 $0 $4
	m_WarpDest $15 $11 $0 $4
	m_WarpDest $3e $72 $0 $4
	m_WarpDest $79 $57 $0 $4
	m_WarpDest $7e $97 $0 $4
	m_WarpDest $84 $1c $0 $4
	m_WarpDest $87 $9d $0 $4
	m_WarpDest $5f $82 $0 $4
	m_WarpDest $8a $57 $0 $4
	m_WarpDest $35 $11 $0 $4
	m_WarpDest $f1 $66 $0 $4
	m_WarpDest $20 $2c $0 $4
	m_WarpDest $f5 $9d $0 $4
	m_WarpDest $b0 $22 $0 $4
	m_WarpDest $b2 $3b $0 $4
	m_WarpDest $95 $3b $0 $3
	m_WarpDest $b4 $22 $0 $3
	m_WarpDest $b4 $8b $0 $4
	m_WarpDest $b5 $2b $0 $4
	m_WarpDest $fc $84 $9 $3
	m_WarpDest $50 $ff $9 $3
	m_WarpDest $d2 $53 $0 $4
	m_WarpDest $69 $68 $0 $4
	m_WarpDest $bb $57 $0 $4
	m_WarpDest $be $87 $0 $4
	m_WarpDest $bc $27 $0 $4
	m_WarpDest $61 $7b $0 $4
	m_WarpDest $6a $92 $0 $4
	m_WarpDest $be $8a $0 $1
	m_WarpDest $14 $91 $0 $4
	m_WarpDest $34 $1d $0 $4
	m_WarpDest $36 $22 $0 $4
	m_WarpDest $29 $82 $0 $4
	m_WarpDest $2d $91 $0 $4
	m_WarpDest $c2 $2b $0 $4
	m_WarpDest $1a $65 $0 $1
	m_WarpDest $c4 $99 $0 $4
	m_WarpDest $c5 $57 $0 $4
	m_WarpDest $fd $1c $0 $1
	m_WarpDest $c7 $ff $9 $3
	m_WarpDest $cc $f2 $9 $3
	m_WarpDest $09 $8b $0 $1
	m_WarpDest $cc $1c $0 $1
	m_WarpDest $06 $8b $0 $1
	m_WarpDest $cd $f3 $9 $3
	m_WarpDest $cd $f8 $9 $3
	m_WarpDest $0a $8b $9 $3
	m_WarpDest $cd $49 $0 $1
	m_WarpDest $3d $91 $0 $4
	m_WarpDest $cf $0c $0 $4
	m_WarpDest $d0 $ff $9 $3
	m_WarpDest $d1 $ff $9 $3
	m_WarpDest $2b $8c $0 $4
	m_WarpDest $d2 $ff $9 $3
	m_WarpDest $d2 $2c $0 $4
	m_WarpDest $d3 $ff $9 $3
	m_WarpDest $d4 $57 $0 $4
	m_WarpDest $d8 $ff $9 $3
	m_WarpDest $da $f5 $9 $3
	m_WarpDest $db $fb $9 $3
	m_WarpDest $dc $45 $0 $4
	m_WarpDest $dd $5a $0 $4
	m_WarpDest $de $45 $0 $4
	m_WarpDest $df $5a $0 $4
	m_WarpDest $e0 $f4 $9 $3
	m_WarpDest $e1 $2c $0 $4
	m_WarpDest $e2 $f4 $9 $3
	m_WarpDest $e3 $2c $0 $4
	m_WarpDest $e8 $49 $0 $4
	m_WarpDest $e9 $f3 $9 $3
	m_WarpDest $ea $77 $0 $4
	m_WarpDest $ea $f2 $9 $3
	m_WarpDest $ea $fc $9 $3
	m_WarpDest $eb $ff $9 $3
	m_WarpDest $eb $57 $0 $4
	m_WarpDest $ec $ff $9 $3
	m_WarpDest $ee $f2 $9 $3
	m_WarpDest $ee $fc $9 $3
	m_WarpDest $ee $11 $0 $4
	m_WarpDest $ca $fc $9 $3
	m_WarpDest $ab $87 $0 $4
	m_WarpDest $ac $ff $9 $3
	m_WarpDest $ac $27 $0 $4
	m_WarpDest $ad $87 $0 $4
	m_WarpDest $ae $ff $9 $3
	m_WarpDest $ae $27 $0 $4
	m_WarpDest $e5 $f5 $9 $3
	m_WarpDest $e6 $fb $9 $3
	m_WarpDest $f6 $93 $0 $4
	m_WarpDest $f6 $9b $0 $4
	m_WarpDest $ed $91 $0 $4
	m_WarpDest $f6 $ff $9 $3
	m_WarpDest $36 $8c $0 $4
	m_WarpDest $d3 $ff $1 $3
	m_WarpDest $f7 $ff $9 $3
	m_WarpDest $f9 $ff $9 $3
	m_WarpDest $fb $17 $0 $4
	m_WarpDest $40 $1d $0 $4
	m_WarpDest $2e $12 $0 $4
	m_WarpDest $3f $7d $0 $4
	m_WarpDest $2f $1d $0 $4
	m_WarpDest $1c $12 $0 $4
	m_WarpDest $1a $9d $0 $4
	m_WarpDest $2c $91 $0 $4
	m_WarpDest $1a $91 $0 $4
	m_WarpDest $2e $9c $0 $4
	m_WarpDest $1c $9c $0 $4
	m_WarpDest $18 $14 $0 $4
	m_WarpDest $38 $32 $0 $4
	m_WarpDest $34 $82 $0 $4
	m_WarpDest $fd $f3 $0 $3
	m_WarpDest $fe $8b $0 $1
	m_WarpDest $07 $8b $0 $1
	m_WarpDest $0b $8b $0 $1
	m_WarpDest $08 $8b $0 $1
	m_WarpDest $62 $27 $0 $4
	m_WarpDest $64 $97 $0 $4
	m_WarpDest $1a $27 $0 $4
	m_WarpDest $0b $24 $0 $4
	m_WarpDest $4c $00 $0 $1

group6WarpDestTable:
	m_WarpDest $05 $02 $f $3
	m_WarpDest $10 $02 $f $3
	m_WarpDest $10 $02 $0 $4
	m_WarpDest $28 $0c $0 $4
	m_WarpDest $28 $02 $0 $4
	m_WarpDest $27 $02 $0 $4
	m_WarpDest $27 $0c $0 $4
	m_WarpDest $68 $01 $f $3
	m_WarpDest $68 $ad $9 $3
	m_WarpDest $93 $02 $f $3
	m_WarpDest $94 $0c $f $3
	m_WarpDest $95 $02 $f $3
	m_WarpDest $96 $ad $9 $3
	m_WarpDest $97 $01 $f $3
	m_WarpDest $97 $0d $f $3
	m_WarpDest $98 $01 $f $3
	m_WarpDest $98 $0d $f $3
	m_WarpDest $c0 $01 $f $3
	m_WarpDest $c0 $0d $f $3
	m_WarpDest $28 $00 $0 $1

group7WarpDestTable:
	m_WarpDest $01 $01 $f $3
	m_WarpDest $01 $0d $f $3
	m_WarpDest $02 $a1 $9 $3
	m_WarpDest $02 $0b $f $3
	m_WarpDest $03 $0c $f $3
	m_WarpDest $04 $a3 $9 $3
	m_WarpDest $04 $0c $f $3
	m_WarpDest $08 $01 $f $3
	m_WarpDest $08 $0d $f $3
	m_WarpDest $0a $0d $f $3
	m_WarpDest $bf $01 $0 $4
	m_WarpDest $07 $05 $f $3
	m_WarpDest $07 $0d $f $3
	m_WarpDest $10 $02 $f $3
	m_WarpDest $49 $a1 $0 $4
	m_WarpDest $c0 $0c $0 $4
	m_WarpDest $71 $0c $0 $4
	m_WarpDest $47 $01 $f $3
	m_WarpDest $05 $0d $0 $4
	m_WarpDest $49 $02 $f $3
	m_WarpDest $4a $0d $f $3
	m_WarpDest $ef $a1 $9 $3
	m_WarpDest $73 $01 $f $3
	m_WarpDest $73 $0d $f $3
	m_WarpDest $74 $01 $f $3
	m_WarpDest $74 $0c $f $3
	m_WarpDest $75 $08 $f $3
	m_WarpDest $76 $01 $f $3
	m_WarpDest $76 $ad $9 $3
	m_WarpDest $70 $01 $0 $4
	m_WarpDest $72 $01 $0 $4
	m_WarpDest $73 $0c $0 $4
	m_WarpDest $45 $aa $0 $4
	m_WarpDest $44 $01 $0 $4
	m_WarpDest $46 $0b $0 $4
	m_WarpDest $42 $a1 $0 $4
	m_WarpDest $43 $ad $0 $4
	m_WarpDest $42 $02 $0 $4
	m_WarpDest $4b $ad $0 $4
	m_WarpDest $47 $08 $0 $4
	m_WarpDest $48 $ad $0 $4
	m_WarpDest $47 $01 $0 $4
	m_WarpDest $43 $0d $0 $4
	m_WarpDest $48 $05 $0 $4
	m_WarpDest $4a $06 $0 $4
	m_WarpDest $4a $0c $0 $4
	m_WarpDest $01 $01 $0 $3
	m_WarpDest $11 $03 $0 $4
	m_WarpDest $11 $03 $0 $4
	m_WarpDest $42 $a1 $0 $4
	m_WarpDest $42 $a1 $0 $4
	m_WarpDest $42 $a1 $0 $4
	m_WarpDest $11 $0b $0 $4


warpSourcesTable: ; $1359e
	.dw group0WarpSources
	.dw group1WarpSources
	.dw group2WarpSources
	.dw group3WarpSources
	.dw group4WarpSources
	.dw group5WarpSources
	.dw group6WarpSources
	.dw group7WarpSources


; Explanation:
;
; Byte 0:
;   Bits 0-3: These bits are set for "screen exit" transitions in 4 quadrants of
;     the screen; top-left (bit 0), top-right (bit 1), bottom-left (bit 2),
;     bottom-right (bit 3). Used ie. for cave and building exists. Applies only
;     to north or south transitions.
;   If the byte is $40, it's a "PointerWarp", meaning there are multiple warp
;   locations for this room.
;   Otherwise, if it's $00, this warp applies to any warp tile in the room.
; Byte 1:
;   The room index this warp source is in. (The group is implicitly known
;   already based on which table it's in.)
;
; For m_StandardWarp only:
;   Byte 2:
;     Warp Dest Index. Along with the Warp Dest Group, this is an index for the
;     warp destination (above here) to use.
;   Param 3: (half-byte)
;     Warp Dest Group. Determines the map group to be warped to. Goes with Warp
;     Dest Index (see above)
;   Param 4: (half-byte)
;     Transition source type. See constants/transitions.s.
;
; For m_PointerWarp:
;   Param 3 points to a list of "PointedWarps". Data at that location is defined
;   as follows. (It's basically the same as m_StandardWarp except byte 1.)
;
;   Byte 0: Probably the same as m_StandardWarp, except bit 7 being set
;     indicates the end of the warp list.
;   Byte 1: YX position of this warp (in tiles).
;   Byte 2: Warp Dest Index.
;   Param 3: Warp Dest Group.
;   Param 4: Transition source type.

group0WarpSources: ; $135ae
	m_StandardWarp $01 $48 $07 $0 $3
	m_StandardWarp $02 $48 $07 $0 $3
	m_PointerWarp  $40 $48 warpSource7706
	m_PointerWarp  $40 $8d warpSource7716
	m_StandardWarp $00 $ba $04 $4 $4
	m_PointerWarp  $40 $0a warpSource76aa
	m_StandardWarp $00 $02 $01 $2 $4
	m_StandardWarp $00 $14 $36 $3 $4
	m_StandardWarp $00 $06 $58 $3 $4
	m_PointerWarp  $40 $09 warpSource769a
	m_PointerWarp  $40 $0b warpSource76b2
	m_StandardWarp $00 $0c $09 $3 $4
	m_PointerWarp  $40 $1b warpSource76ce
	m_PointerWarp  $40 $1c warpSource76d6
	m_PointerWarp  $40 $1d warpSource76de
	m_StandardWarp $00 $27 $20 $5 $4
	m_StandardWarp $00 $37 $3e $2 $4
	m_PointerWarp  $40 $3d warpSource76f6
	m_StandardWarp $00 $45 $3a $5 $4
	m_StandardWarp $00 $4d $09 $2 $4
	m_StandardWarp $00 $53 $32 $2 $4
	m_StandardWarp $00 $55 $1f $5 $4
	m_PointerWarp  $40 $57 group0Room57WarpSources
	m_StandardWarp $00 $58 $3b $2 $4
	m_StandardWarp $00 $5d $37 $3 $4
	m_StandardWarp $00 $66 $49 $3 $4
	m_PointerWarp  $40 $68 warpSource770e
	m_StandardWarp $00 $79 $18 $2 $4
	m_StandardWarp $00 $7c $05 $2 $4
	m_StandardWarp $00 $89 $17 $2 $4
	m_StandardWarp $00 $a3 $38 $3 $4
	m_StandardWarp $00 $bd $31 $2 $4
	m_StandardWarp $00 $c5 $27 $3 $4
	m_StandardWarp $00 $cd $29 $2 $4
	m_StandardWarp $00 $da $3a $3 $4
	m_StandardWarp $00 $dd $08 $2 $4
	m_StandardWarp $00 $e0 $14 $2 $4
	m_PointerWarp  $40 $e1 warpSource771e
	m_StandardWarp $00 $e2 $13 $2 $4
	m_StandardWarp $00 $f1 $3d $5 $4
	m_PointerWarp  $40 $0d warpSource76be
	m_StandardWarp $00 $28 $5a $3 $8
	m_StandardWarp $00 $2b $4e $5 $4
	m_StandardWarp $00 $3c $05 $1 $4
	m_StandardWarp $00 $5b $28 $5 $4
	m_StandardWarp $00 $a0 $33 $5 $4
	m_StandardWarp $00 $a5 $3e $5 $4
	m_StandardWarp $00 $24 $43 $3 $4
	m_StandardWarp $00 $16 $34 $3 $4
	m_StandardWarp $00 $44 $47 $3 $4
	m_PointerWarp  $40 $26 group0Room26WarpSources
	m_PointerWarp  $40 $56 group0Room56WarpSources
	m_StandardWarp $00 $77 $05 $5 $4
	m_StandardWarp $00 $03 $69 $5 $4
	m_StandardWarp $00 $00 $39 $2 $4
	m_PointerWarp  $40 $ff group0RoomffWarpSources
	m_StandardWarp $00 $15 $7b $5 $4
	m_StandardWarp $00 $54 $7c $5 $4
	m_StandardWarp $00 $36 $37 $5 $4
	m_StandardWarp $00 $67 $7d $5 $4
	m_StandardWarp $00 $74 $7e $5 $4
	m_PointerWarp  $40 $13 group0Room13WarpSources
	m_PointerWarp  $40 $78 group0Room78WarpSources
	m_PointerWarp  $40 $08 group0Room08WarpSources
	m_StandardWarp $00 $01 $05 $4 $4
	m_StandardWarp $00 $23 $0c $2 $4
	m_StandardWarp $00 $84 $04 $5 $2
	m_StandardWarp $00 $87 $29 $5 $2
	m_StandardWarp $00 $85 $2d $5 $2
	m_StandardWarp $00 $86 $3c $5 $2
	m_StandardWarp $00 $50 $71 $0 $9
	m_PointerWarp  $40 $30 group0Room30WarpSources
	m_PointerWarp  $40 $70 group0Room70WarpSources
	m_PointerWarp  $40 $40 group0Room40WarpSources
	m_PointerWarp  $40 $3a group0Room3aWarpSources
	m_PointerWarp  $40 $60 group0Room60WarpSources
	m_PointerWarp  $40 $51 group0Room51WarpSources
	m_StandardWarp $00 $63 $15 $2 $4
	m_StandardWarp $00 $52 $3c $2 $4
	m_StandardWarp $00 $73 $5a $4 $2
	m_StandardWarp $00 $33 $5d $4 $4
	m_StandardWarp $00 $20 $5e $4 $2
	m_WarpSourcesEnd
group0Room51WarpSources:
	m_PointedWarp $80 $01 $1e $2 $4
group0Room60WarpSources:
	m_PointedWarp $80 $58 $38 $2 $4
group0Room3aWarpSources:
	m_PointedWarp $00 $68 $78 $0 $8
	m_PointedWarp $80 $23 $35 $3 $4
group0Room40WarpSources:
	m_PointedWarp $00 $56 $7a $0 $8
	m_PointedWarp $00 $17 $09 $4 $4
	m_PointedWarp $80 $16 $4e $4 $4
group0Room70WarpSources:
	m_PointedWarp $00 $46 $0a $4 $4
	m_PointedWarp $00 $44 $40 $4 $4
	m_PointedWarp $00 $43 $43 $4 $4
	m_PointedWarp $80 $18 $2e $7 $4
group0Room30WarpSources:
	m_PointedWarp $00 $47 $2d $2 $4
	m_PointedWarp $80 $31 $4f $4 $2
group0Room08WarpSources:
	m_PointedWarp $80 $27 $5b $3 $8
group0Room78WarpSources:
	m_PointedWarp $00 $51 $2f $5 $2
	m_PointedWarp $80 $35 $69 $0 $8
group0Room57WarpSources:
	m_PointedWarp $00 $28 $54 $3 $4
	m_PointedWarp $80 $02 $55 $3 $4
group0Room13WarpSources:
	m_PointedWarp $00 $33 $0b $2 $4
	m_PointedWarp $00 $15 $33 $2 $4
	m_PointedWarp $80 $37 $00 $2 $4
group0Room26WarpSources:
	m_PointedWarp $00 $41 $4b $3 $4
	m_PointedWarp $80 $17 $35 $5 $4
group0Room56WarpSources:
	m_PointedWarp $00 $47 $03 $5 $4
	m_PointedWarp $80 $38 $7a $5 $4
group0RoomffWarpSources:
	m_PointedWarp $00 $00 $00 $0 $0

warpSource769a:
	m_PointedWarp $00 $44 $19 $2 $4
	m_PointedWarp $00 $46 $1a $2 $4
	m_PointedWarp $00 $37 $46 $5 $4
	m_PointedWarp $80 $43 $00 $7 $4
warpSource76aa:
	m_PointedWarp $00 $12 $23 $2 $4
	m_PointedWarp $80 $18 $06 $4 $4
warpSource76b2:
	m_PointedWarp $00 $27 $40 $2 $4
	m_PointedWarp $00 $43 $43 $2 $4
	m_PointedWarp $80 $41 $47 $5 $4
warpSource76be:
	m_PointedWarp $00 $42 $58 $5 $4
	m_PointedWarp $80 $45 $59 $5 $4
warpSource76ce:
	m_PointedWarp $00 $08 $45 $2 $4
	m_PointedWarp $80 $36 $0d $3 $4
warpSource76d6:
	m_PointedWarp $00 $43 $04 $3 $4
	m_PointedWarp $80 $37 $12 $3 $4
warpSource76de:
	m_PointedWarp $00 $13 $45 $5 $4
	m_PointedWarp $80 $27 $11 $3 $4
warpSource76f6:
	m_PointedWarp $00 $27 $48 $2 $4
	m_PointedWarp $80 $13 $10 $3 $4
warpSource7706:
	m_PointedWarp $00 $21 $00 $4 $4
	m_PointedWarp $80 $28 $07 $4 $4
warpSource770e:
	m_PointedWarp $00 $18 $65 $0 $8
	m_PointedWarp $00 $11 $03 $3 $4
warpSource7716:
	m_PointedWarp $00 $26 $02 $4 $4
	m_PointedWarp $80 $61 $66 $5 $4
warpSource771e:
	m_PointedWarp $00 $26 $10 $2 $4
	m_PointedWarp $80 $53 $11 $2 $4

group1WarpSources: ; $13726
	m_StandardWarp $00 $48 $01 $4 $4
	m_StandardWarp $00 $83 $03 $4 $4
	m_StandardWarp $00 $5c $02 $5 $4
	m_StandardWarp $01 $48 $04 $1 $3
	m_StandardWarp $02 $48 $04 $1 $3
	m_StandardWarp $00 $0e $00 $5 $4
	m_StandardWarp $04 $0e $2a $0 $3
	m_StandardWarp $00 $02 $51 $4 $4
	m_StandardWarp $00 $05 $3f $5 $4
	m_StandardWarp $00 $06 $41 $5 $4
	m_StandardWarp $00 $07 $43 $5 $4
	m_StandardWarp $00 $09 $62 $5 $4
	m_PointerWarp  $40 $0b warpSource7836
	m_StandardWarp $00 $0c $0b $3 $4
	m_StandardWarp $00 $0d $47 $2 $4
	m_StandardWarp $00 $04 $14 $3 $4
	m_PointerWarp  $40 $12 group1Room12WarpSources
	m_StandardWarp $00 $13 $67 $5 $4
	m_StandardWarp $00 $14 $16 $3 $4
	m_StandardWarp $00 $18 $55 $5 $4
	m_StandardWarp $00 $1c $07 $3 $4
	m_StandardWarp $00 $1d $31 $3 $4
	m_StandardWarp $00 $23 $22 $3 $4
	m_StandardWarp $00 $28 $57 $3 $8
	m_StandardWarp $00 $2b $4c $5 $4
	m_StandardWarp $00 $2d $42 $2 $4
	m_StandardWarp $00 $39 $28 $0 $8
	m_PointerWarp  $40 $3c warpSource783e
	m_StandardWarp $00 $3d $4b $2 $4
	m_StandardWarp $00 $43 $20 $3 $4
	m_StandardWarp $00 $45 $3f $3 $4
	m_StandardWarp $00 $4d $33 $3 $4
	m_StandardWarp $00 $51 $56 $4 $2
	m_StandardWarp $00 $55 $07 $2 $4
	m_StandardWarp $00 $56 $3d $2 $4
	m_StandardWarp $00 $57 $06 $2 $4
	m_PointerWarp  $40 $58 warpSource7852
	m_StandardWarp $00 $5a $3f $2 $4
	m_StandardWarp $00 $66 $3d $3 $4
	m_PointerWarp  $40 $70 warpSource7862
	m_StandardWarp $00 $71 $1e $5 $4
	m_StandardWarp $00 $74 $1a $5 $4
	m_StandardWarp $00 $79 $02 $2 $4
	m_StandardWarp $00 $91 $19 $5 $4
	m_StandardWarp $00 $a3 $39 $3 $4
	m_StandardWarp $00 $a5 $57 $5 $4
	m_PointerWarp  $40 $a7 warpSource785a
	m_StandardWarp $00 $ad $30 $2 $4
	m_StandardWarp $00 $ba $6b $5 $4
	m_StandardWarp $00 $bb $5b $5 $4
	m_StandardWarp $00 $bc $36 $5 $4
	m_StandardWarp $00 $bd $2c $2 $4
	m_StandardWarp $00 $c5 $28 $3 $4
	m_StandardWarp $00 $cb $34 $5 $4
	m_PointerWarp  $40 $cd warpSource786a
	m_StandardWarp $00 $d9 $51 $5 $4
	m_StandardWarp $00 $da $38 $5 $4
	m_StandardWarp $00 $db $39 $5 $4
	m_StandardWarp $00 $dd $6a $5 $4
	m_StandardWarp $00 $27 $48 $1 $2
	m_StandardWarp $00 $e2 $19 $1 $2
	m_StandardWarp $00 $e0 $42 $5 $2
	m_PointerWarp  $40 $78 group1Room78WarpSources
	m_PointerWarp  $40 $68 group1Room68WarpSources
	m_StandardWarp $00 $08 $59 $3 $8
	m_StandardWarp $00 $50 $37 $2 $4
	m_PointerWarp  $40 $62 group1Room62WarpSources
	m_PointerWarp  $40 $33 group1Room33WarpSources
	m_StandardWarp $00 $30 $13 $3 $4
	m_PointerWarp  $40 $20 group1Room20WarpSources
	m_StandardWarp $00 $73 $54 $4 $4
	m_StandardWarp $00 $63 $55 $4 $2
	m_StandardWarp $00 $40 $57 $4 $4
	m_StandardWarp $00 $10 $60 $4 $2
	m_WarpSourcesEnd
group1Room12WarpSources:
	m_PointedWarp $00 $55 $4e $2 $4
	m_PointedWarp $80 $45 $4f $2 $4
group1Room20WarpSources:
	m_PointedWarp $80 $14 $50 $4 $4
group1Room33WarpSources:
	m_PointedWarp $00 $14 $5c $4 $4
group1Room62WarpSources:
	m_PointedWarp $00 $32 $52 $4 $2
	m_PointedWarp $80 $67 $53 $4 $2
group1Room68WarpSources:
	m_PointedWarp $00 $18 $0b $1 $8
	m_PointedWarp $80 $11 $4c $3 $4
group1Room78WarpSources:
	m_PointedWarp $00 $51 $81 $5 $2
	m_PointedWarp $80 $35 $0c $1 $8

warpSource7836:
	m_PointedWarp $00 $41 $63 $5 $4
	m_PointedWarp $80 $27 $41 $2 $4
warpSource783e:
	m_PointedWarp $00 $33 $00 $3 $4
	m_PointedWarp $00 $34 $01 $3 $4
	m_PointedWarp $80 $35 $02 $3 $4
warpSource7852:
	m_PointedWarp $00 $32 $36 $2 $4
	m_PointedWarp $80 $35 $41 $3 $4
warpSource785a:
	m_PointedWarp $00 $24 $03 $2 $4
	m_PointedWarp $80 $26 $04 $2 $4
warpSource7862:
	m_PointedWarp $00 $43 $45 $4 $4
warpSource786a:
	m_PointedWarp $00 $34 $2e $2 $4
	m_PointedWarp $80 $21 $27 $2 $4

group2WarpSources: ; $13872
	m_StandardWarp $00 $90 $01 $5 $4
	m_StandardWarp $04 $0e $33 $0 $3
	m_StandardWarp $04 $0f $02 $1 $3
	m_StandardWarp $04 $1e $38 $1 $3
	m_StandardWarp $04 $1f $39 $1 $3
	m_StandardWarp $00 $2e $3d $0 $4
	m_StandardWarp $04 $2f $29 $1 $3
	m_StandardWarp $08 $3e $27 $1 $3
	m_StandardWarp $04 $3f $47 $0 $3
	m_StandardWarp $00 $4e $30 $0 $4
	m_StandardWarp $04 $4f $25 $3 $3
	m_StandardWarp $08 $5e $3a $0 $3
	m_StandardWarp $00 $5e $0e $2 $2
	m_PointerWarp  $40 $5f warpSource798a
	m_StandardWarp $04 $6e $4a $0 $3
	m_StandardWarp $04 $6f $49 $0 $3
	m_StandardWarp $00 $7e $0f $2 $2
	m_StandardWarp $04 $7f $4b $0 $3
	m_StandardWarp $04 $8e $48 $0 $3
	m_StandardWarp $04 $8f $26 $1 $3
	m_StandardWarp $00 $8f $52 $5 $2
	m_StandardWarp $04 $9e $3e $0 $3
	m_StandardWarp $00 $9e $3c $0 $4
	m_StandardWarp $00 $9f $1d $2 $2
	m_StandardWarp $04 $9f $0e $0 $3
	m_StandardWarp $00 $a1 $5d $5 $4
	m_PointerWarp  $40 $ae warpSource7992
	m_StandardWarp $04 $af $7b $0 $2
	m_PointerWarp  $40 $af group2RoomafWarpSources
	m_StandardWarp $00 $b7 $32 $3 $4
	m_StandardWarp $00 $ba $40 $3 $4
	m_StandardWarp $00 $be $03 $7 $2
	m_StandardWarp $00 $bf $06 $7 $2
	m_StandardWarp $04 $bf $12 $0 $3
	m_StandardWarp $00 $c0 $23 $3 $4
	m_StandardWarp $00 $c1 $2b $3 $4
	m_PointerWarp  $40 $ce warpSource799a
	m_StandardWarp $04 $cf $45 $0 $3
	m_PointerWarp  $40 $d0 warpSource79a2
	m_StandardWarp $04 $de $3e $1 $3
	m_StandardWarp $04 $df $0b $0 $3
	m_StandardWarp $04 $e3 $41 $1 $3
	m_StandardWarp $00 $e3 $28 $2 $2
	m_StandardWarp $04 $e4 $3a $1 $3
	m_StandardWarp $04 $e5 $43 $0 $3
	m_StandardWarp $08 $e6 $31 $0 $3
	m_StandardWarp $04 $e7 $38 $0 $3
	m_PointerWarp  $40 $e8 warpSource79aa
	m_StandardWarp $04 $e9 $2a $1 $3
	m_StandardWarp $04 $ea $2e $0 $3
	m_StandardWarp $04 $eb $2f $0 $3
	m_StandardWarp $04 $ec $21 $0 $3
	m_StandardWarp $04 $ee $35 $0 $3
	m_StandardWarp $04 $f3 $28 $1 $3
	m_StandardWarp $04 $f4 $24 $0 $3
	m_StandardWarp $04 $f5 $2c $1 $3
	m_StandardWarp $04 $f6 $15 $0 $3
	m_StandardWarp $04 $f7 $0f $1 $3
	m_StandardWarp $04 $f8 $1c $1 $3
	m_StandardWarp $04 $f9 $14 $0 $3
	m_StandardWarp $00 $fa $46 $2 $2
	m_StandardWarp $00 $fb $44 $2 $2
	m_StandardWarp $04 $fb $1c $0 $3
	m_StandardWarp $04 $fc $11 $1 $3
	m_StandardWarp $08 $fd $2c $0 $3
	m_StandardWarp $00 $fd $49 $5 $2
	m_StandardWarp $08 $ff $20 $1 $3
	m_StandardWarp $00 $ff $4b $5 $2
	m_StandardWarp $04 $08 $6b $0 $3
	m_StandardWarp $04 $18 $64 $0 $3
	m_StandardWarp $04 $28 $72 $0 $3
	m_StandardWarp $04 $19 $7c $0 $3
	m_PointerWarp  $40 $19 group2Room19WarpSources
	m_StandardWarp $04 $29 $7d $0 $3
	m_PointerWarp  $40 $29 group2Room29WarpSources
	m_StandardWarp $00 $73 $5b $4 $2
	m_StandardWarp $04 $0a $49 $1 $3
	m_StandardWarp $03 $0a $4a $1 $3
	m_WarpSourcesEnd
group2Room29WarpSources:
	m_PointedWarp $80 $28 $59 $4 $2
group2Room19WarpSources:
	m_PointedWarp $80 $25 $58 $4 $2
group2RoomafWarpSources:
	m_PointedWarp $80 $61 $3a $2 $2

warpSource798a:
	m_PointedWarp $00 $31 $0d $2 $2
	m_PointedWarp $00 $11 $12 $2 $2
	m_PointedWarp $80 $22 $66 $0 $2
warpSource7992:
	m_PointedWarp $00 $15 $1b $2 $2
	m_PointedWarp $80 $61 $1f $2 $2
warpSource799a:
	m_PointedWarp $00 $11 $42 $1 $4
	m_PointedWarp $80 $18 $2f $2 $2
warpSource79a2:
	m_PointedWarp $00 $22 $2d $3 $4
	m_PointedWarp $80 $25 $2e $3 $4
warpSource79aa:
	m_PointedWarp $00 $61 $64 $5 $2
	m_PointedWarp $00 $68 $65 $5 $2

group3WarpSources: ; $139b2
	m_StandardWarp $00 $0f $06 $5 $4
	m_StandardWarp $04 $0f $1f $1 $3
	m_StandardWarp $08 $0f $1f $1 $3
	m_StandardWarp $04 $1e $1d $0 $3
	m_PointerWarp  $40 $1e warpSource7aae
	m_StandardWarp $04 $1f $16 $1 $3
	m_StandardWarp $00 $1f $4a $5 $2
	m_StandardWarp $04 $2e $16 $0 $3
	m_StandardWarp $00 $2e $4f $5 $2
	m_StandardWarp $04 $2f $10 $1 $3
	m_StandardWarp $00 $2f $4d $5 $2
	m_StandardWarp $04 $3f $1b $0 $3
	m_PointerWarp  $40 $4e warpSource7ab6
	m_StandardWarp $04 $4f $2b $0 $3
	m_StandardWarp $04 $5e $20 $0 $3
	m_StandardWarp $04 $5f $1e $0 $3
	m_StandardWarp $04 $6e $08 $1 $3
	m_StandardWarp $04 $6f $09 $1 $3
	m_StandardWarp $04 $7e $12 $1 $3
	m_StandardWarp $08 $7f $14 $1 $3
	m_StandardWarp $00 $8c $08 $7 $4
	m_StandardWarp $04 $8e $09 $0 $3
	m_StandardWarp $00 $8f $09 $7 $2
	m_StandardWarp $04 $9e $29 $0 $3
	m_StandardWarp $00 $9e $1c $3 $2
	m_PointerWarp  $40 $9f warpSource7abe
	m_StandardWarp $00 $a1 $60 $5 $4
	m_StandardWarp $00 $ae $1d $3 $2
	m_StandardWarp $04 $af $23 $1 $3
	m_StandardWarp $00 $be $50 $5 $2
	m_StandardWarp $04 $be $18 $1 $3
	m_StandardWarp $04 $bf $25 $2 $3
	m_StandardWarp $00 $c1 $2c $3 $4
	m_StandardWarp $00 $c5 $0a $2 $4
	m_StandardWarp $00 $c7 $42 $3 $4
	m_StandardWarp $04 $ce $44 $0 $3
	m_StandardWarp $04 $cf $3f $1 $3
	m_PointerWarp  $40 $d0 warpSource7ac6
	m_StandardWarp $04 $de $26 $2 $3
	m_StandardWarp $04 $df $24 $3 $3
	m_StandardWarp $04 $e3 $2a $2 $3
	m_StandardWarp $04 $e4 $2b $2 $3
	m_StandardWarp $04 $e5 $29 $3 $3
	m_StandardWarp $04 $e6 $2a $3 $3
	m_StandardWarp $04 $e7 $17 $1 $3
	m_StandardWarp $04 $e8 $20 $2 $3
	m_StandardWarp $00 $e9 $25 $1 $4
	m_StandardWarp $04 $ea $0a $0 $3
	m_StandardWarp $04 $eb $0c $0 $3
	m_StandardWarp $08 $ec $0d $0 $3
	m_StandardWarp $04 $ed $3d $1 $3
	m_PointerWarp  $40 $ed group3RoomedWarpSources
	m_StandardWarp $04 $ee $41 $0 $3
	m_StandardWarp $04 $ef $36 $1 $3
	m_StandardWarp $04 $f6 $46 $0 $3
	m_StandardWarp $04 $f7 $32 $0 $3
	m_StandardWarp $04 $f8 $34 $0 $3
	m_StandardWarp $04 $fa $2d $1 $3
	m_StandardWarp $04 $fb $2d $0 $3
	m_StandardWarp $04 $fc $24 $1 $3
	m_StandardWarp $04 $fd $21 $2 $3
	m_StandardWarp $04 $fe $2b $1 $3
	m_StandardWarp $04 $ff $26 $3 $3
	m_StandardWarp $04 $08 $4d $0 $3
	m_PointerWarp  $40 $08 group3Room08WarpSources
	m_StandardWarp $04 $18 $08 $0 $3
	m_PointerWarp  $40 $18 group3Room18WarpSources
	m_StandardWarp $04 $38 $50 $0 $3
	m_StandardWarp $00 $28 $45 $3 $2
	m_StandardWarp $00 $48 $52 $0 $2
	m_StandardWarp $08 $0a $22 $0 $3
	m_PointerWarp  $40 $0a group3Room0aWarpSources
	m_PointerWarp  $40 $09 group3Room09WarpSources
	m_StandardWarp $04 $19 $58 $0 $3
	m_StandardWarp $04 $39 $5d $0 $3
	m_StandardWarp $00 $29 $60 $0 $2
	m_StandardWarp $03 $58 $4d $3 $3
	m_StandardWarp $00 $49 $3e $3 $8
	m_StandardWarp $0c $59 $4e $3 $3
	m_StandardWarp $00 $68 $51 $3 $8
	m_PointerWarp  $40 $78 group3Room78WarpSources
	m_StandardWarp $04 $1a $6a $0 $3
	m_PointerWarp  $40 $1a group3Room1aWarpSources
	m_StandardWarp $04 $69 $68 $0 $3
	m_PointerWarp  $40 $69 group3Room69WarpSources
	m_StandardWarp $08 $79 $67 $0 $3
	m_PointerWarp  $40 $79 group3Room79WarpSources
	m_WarpSourcesEnd
group3RoomedWarpSources:
	m_PointedWarp $80 $68 $5f $4 $2
group3Room79WarpSources:
	m_PointedWarp $80 $18 $6d $0 $8
group3Room69WarpSources:
	m_PointedWarp $00 $18 $82 $5 $2
	m_PointedWarp $80 $48 $6c $0 $8
group3Room1aWarpSources:
	m_PointedWarp $80 $61 $52 $3 $8
group3Room78WarpSources:
	m_PointedWarp $00 $65 $7f $5 $2
	m_PointedWarp $80 $14 $50 $3 $8
group3Room08WarpSources:
	m_PointedWarp $80 $21 $44 $3 $8
group3Room09WarpSources:
	m_PointedWarp $00 $07 $18 $3 $2
	m_PointedWarp $80 $62 $32 $5 $2
group3Room0aWarpSources:
	m_PointedWarp $80 $21 $12 $7 $2
group3Room18WarpSources:
	m_PointedWarp $00 $03 $46 $3 $2
	m_PointedWarp $80 $17 $53 $3 $8

warpSource7aae:
	m_PointedWarp $00 $12 $48 $5 $2
	m_PointedWarp $80 $17 $0e $3 $2
warpSource7ab6:
	m_PointedWarp $00 $52 $06 $3 $2
	m_PointedWarp $80 $27 $5a $5 $2
warpSource7abe:
	m_PointedWarp $00 $11 $1f $3 $2
	m_PointedWarp $80 $22 $1b $3 $2
warpSource7ac6:
	m_PointedWarp $00 $22 $2f $3 $4
	m_PointedWarp $00 $25 $30 $3 $4

group4WarpSources: ; $13ace
	m_StandardWarp $04 $24 $01 $0 $3
	m_StandardWarp $04 $66 $02 $0 $3
	m_StandardWarp $04 $91 $03 $0 $3
	m_StandardWarp $04 $bb $04 $0 $3
	m_StandardWarp $04 $ce $05 $0 $3
	m_StandardWarp $04 $04 $00 $0 $3
	m_StandardWarp $04 $0d $00 $1 $3
	m_StandardWarp $00 $09 $00 $6 $2
	m_StandardWarp $00 $07 $1d $1 $4
	m_StandardWarp $00 $01 $26 $0 $4
	m_StandardWarp $00 $1b $01 $6 $2
	m_StandardWarp $00 $6c $08 $6 $2
	m_StandardWarp $00 $86 $07 $6 $2
	m_StandardWarp $00 $99 $0f $6 $2
	m_StandardWarp $00 $9b $10 $6 $2
	m_StandardWarp $00 $a0 $0d $6 $2
	m_StandardWarp $00 $a2 $0a $6 $2
	m_StandardWarp $00 $a3 $0e $6 $2
	m_StandardWarp $00 $ad $0b $6 $2
	m_PointerWarp  $40 $9c warpSource7c36
	m_PointerWarp  $40 $a4 warpSource7c3e
	m_StandardWarp $00 $c2 $11 $6 $2
	m_StandardWarp $00 $c3 $12 $6 $2
	m_StandardWarp $04 $d0 $46 $4 $3
	m_PointerWarp  $40 $d0 warpSource7b96
	m_PointerWarp  $40 $d1 warpSource7bd2
	m_PointerWarp  $40 $d2 warpSource7c12
	m_PointerWarp  $40 $d3 warpSource7c1e
	m_StandardWarp $04 $e6 $3b $0 $3
	m_StandardWarp $08 $e6 $3b $0 $3
	m_StandardWarp $00 $e6 $15 $7 $2
	m_StandardWarp $04 $e7 $33 $1 $3
	m_StandardWarp $08 $e7 $33 $1 $3
	m_StandardWarp $00 $ea $1d $4 $4
	m_StandardWarp $00 $eb $4d $4 $2
	m_PointerWarp  $40 $f0 warpSource7c2e
	m_StandardWarp $00 $f2 $4b $4 $2
	m_StandardWarp $00 $fb $4a $4 $2
	m_StandardWarp $00 $fd $47 $4 $2
	m_StandardWarp $04 $f3 $33 $1 $3
	m_StandardWarp $08 $f3 $33 $1 $3
	m_StandardWarp $04 $fe $49 $4 $3
	m_StandardWarp $00 $11 $39 $0 $4
	m_StandardWarp $04 $77 $77 $0 $3
	m_StandardWarp $04 $43 $7e $0 $3
	m_StandardWarp $04 $3b $7f $0 $3
	m_PointerWarp  $40 $7c group4Room7cWarpSources
	m_StandardWarp $04 $5e $03 $1 $3
	m_StandardWarp $04 $65 $1a $1 $3
	m_StandardWarp $04 $5d $1e $1 $3
	m_StandardWarp $04 $51 $2e $1 $3
	m_PointerWarp  $40 $57 group4Room57WarpSources
	m_StandardWarp $00 $54 $32 $1 $2
	m_StandardWarp $00 $7a $81 $0 $2
	m_StandardWarp $00 $76 $4a $2 $2
	m_StandardWarp $00 $72 $4d $2 $2
	m_StandardWarp $00 $58 $34 $1 $2
	m_StandardWarp $04 $68 $3c $1 $3
	m_StandardWarp $04 $7d $0f $0 $3
	m_StandardWarp $04 $7e $82 $0 $3
	m_StandardWarp $00 $39 $83 $0 $2
	m_StandardWarp $00 $4f $1a $3 $2
	m_StandardWarp $00 $61 $40 $1 $2
	m_StandardWarp $04 $5a $4b $1 $3
	m_StandardWarp $00 $14 $04 $6 $2
	m_StandardWarp $00 $19 $02 $6 $2
	m_StandardWarp $00 $1a $03 $6 $2
	m_StandardWarp $00 $17 $05 $6 $2
	m_StandardWarp $00 $15 $06 $6 $2
	m_WarpSourcesEnd
group4Room57WarpSources:
	m_PointedWarp $00 $51 $2f $1 $2
	m_PointedWarp $80 $7b $31 $1 $2
group4Room7cWarpSources:
	m_PointedWarp $80 $23 $80 $0 $2

warpSource7b96:
	m_PointedWarp $00 $11 $2e $4 $2
	m_PointedWarp $00 $17 $2f $4 $2
	m_PointedWarp $00 $19 $30 $4 $2
	m_PointedWarp $00 $1d $31 $4 $2
	m_PointedWarp $00 $31 $32 $4 $2
	m_PointedWarp $00 $35 $33 $4 $2
	m_PointedWarp $00 $39 $34 $4 $2
	m_PointedWarp $00 $51 $35 $4 $2
	m_PointedWarp $00 $55 $36 $4 $2
	m_PointedWarp $00 $59 $37 $4 $2
	m_PointedWarp $00 $5d $38 $4 $2
	m_PointedWarp $00 $71 $39 $4 $2
	m_PointedWarp $00 $77 $3a $4 $2
	m_PointedWarp $00 $91 $3b $4 $2
	m_PointedWarp $80 $9d $3c $4 $2
warpSource7bd2:
	m_PointedWarp $00 $57 $3d $4 $2
	m_PointedWarp $00 $11 $1e $4 $2
	m_PointedWarp $00 $17 $1f $4 $2
	m_PointedWarp $00 $19 $20 $4 $2
	m_PointedWarp $00 $1d $21 $4 $2
	m_PointedWarp $00 $31 $22 $4 $2
	m_PointedWarp $00 $35 $23 $4 $2
	m_PointedWarp $00 $39 $24 $4 $2
	m_PointedWarp $00 $51 $25 $4 $2
	m_PointedWarp $00 $55 $26 $4 $2
	m_PointedWarp $00 $59 $27 $4 $2
	m_PointedWarp $00 $5d $28 $4 $2
	m_PointedWarp $00 $71 $29 $4 $2
	m_PointedWarp $00 $77 $2a $4 $2
	m_PointedWarp $00 $91 $2b $4 $2
	m_PointedWarp $80 $9d $2c $4 $2
warpSource7c12:
	m_PointedWarp $00 $57 $2d $4 $2
	m_PointedWarp $00 $8a $3f $4 $2
	m_PointedWarp $80 $00 $41 $4 $2
warpSource7c1e:
	m_PointedWarp $00 $07 $48 $4 $2
	m_PointedWarp $00 $57 $3e $4 $2
	m_PointedWarp $00 $22 $2d $4 $2
	m_PointedWarp $80 $2c $41 $4 $2
warpSource7c2e:
	m_PointedWarp $00 $77 $42 $4 $2
	m_PointedWarp $80 $27 $4c $4 $4
warpSource7c36:
	m_PointedWarp $00 $87 $0c $6 $2
	m_WarpSourcesEnd
warpSource7c3e:
	m_PointedWarp $00 $64 $09 $6 $2
	m_WarpSourcesEnd

group5WarpSources: ; $13c46
	m_StandardWarp $04 $26 $06 $1 $3
	m_StandardWarp $00 $25 $0d $7 $2
	m_StandardWarp $00 $4b $11 $7 $2
	m_StandardWarp $00 $4d $13 $7 $2
	m_StandardWarp $00 $4e $14 $7 $2
	m_StandardWarp $04 $aa $4e $0 $3
	m_PointerWarp  $40 $79 warpSource7e06
	m_StandardWarp $00 $7e $1a $7 $2
	m_StandardWarp $00 $84 $19 $7 $2
	m_StandardWarp $00 $87 $18 $7 $2
	m_StandardWarp $00 $88 $17 $7 $2
	m_StandardWarp $00 $8a $1b $7 $2
	m_StandardWarp $00 $8c $16 $7 $2
	m_StandardWarp $00 $f1 $18 $5 $2
	m_StandardWarp $00 $f4 $27 $0 $2
	m_StandardWarp $00 $f5 $16 $5 $2
	m_StandardWarp $00 $b0 $35 $1 $4
	m_StandardWarp $00 $b5 $30 $1 $4
	m_StandardWarp $00 $be $0f $7 $2
	m_StandardWarp $04 $c0 $19 $0 $3
	m_PointerWarp  $40 $c0 warpSource7dde
	m_StandardWarp $00 $c1 $25 $5 $2
	m_StandardWarp $00 $c5 $56 $5 $2
	m_StandardWarp $00 $c6 $30 $5 $2
	m_StandardWarp $04 $c7 $40 $0 $3
	m_StandardWarp $04 $cd $44 $1 $3
	m_StandardWarp $08 $cd $45 $1 $3
	m_PointerWarp  $40 $cd warpSource7df6
	m_StandardWarp $08 $cf $25 $0 $3
	m_StandardWarp $00 $cf $4c $0 $4
	m_StandardWarp $04 $d0 $42 $0 $3
	m_StandardWarp $04 $d1 $0a $1 $3
	m_StandardWarp $00 $d1 $44 $5 $2
	m_StandardWarp $04 $d8 $1f $0 $3
	m_StandardWarp $04 $da $10 $0 $3
	m_StandardWarp $08 $db $13 $0 $3
	m_StandardWarp $00 $dc $05 $3 $2
	m_StandardWarp $00 $dd $49 $2 $2
	m_StandardWarp $00 $de $08 $3 $2
	m_StandardWarp $00 $df $4c $2 $2
	m_StandardWarp $04 $e0 $1b $1 $3
	m_StandardWarp $00 $e1 $0c $3 $2
	m_StandardWarp $04 $e2 $23 $0 $3
	m_StandardWarp $00 $e3 $0a $3 $2
	m_StandardWarp $04 $e5 $0d $1 $3
	m_StandardWarp $08 $e6 $0e $1 $3
	m_StandardWarp $00 $e8 $21 $3 $2
	m_StandardWarp $04 $e9 $43 $1 $3
	m_StandardWarp $00 $ea $16 $2 $2
	m_StandardWarp $04 $ea $21 $1 $3
	m_StandardWarp $08 $ea $22 $1 $3
	m_StandardWarp $04 $eb $15 $1 $3
	m_StandardWarp $00 $eb $31 $5 $2
	m_StandardWarp $04 $ec $37 $1 $3
	m_StandardWarp $00 $ed $3f $0 $4
	m_StandardWarp $04 $ee $17 $0 $3
	m_StandardWarp $08 $ee $18 $0 $3
	m_StandardWarp $00 $ee $0f $3 $2
	m_StandardWarp $00 $ab $5e $5 $2
	m_StandardWarp $04 $ac $1c $2 $3
	m_StandardWarp $00 $ac $5c $5 $2
	m_StandardWarp $00 $ad $61 $5 $2
	m_StandardWarp $04 $ae $1e $3 $3
	m_StandardWarp $00 $ae $5f $5 $2
	m_StandardWarp $04 $f6 $13 $1 $3
	m_PointerWarp  $40 $f6 warpSource7dfe
	m_StandardWarp $04 $f7 $46 $1 $3
	m_StandardWarp $04 $f9 $3b $1 $3
	m_StandardWarp $00 $fb $07 $7 $2
	m_StandardWarp $08 $fc $4f $0 $3
	m_PointerWarp  $40 $fc group5RoomfcWarpSources
	m_StandardWarp $04 $19 $53 $0 $3
	m_StandardWarp $04 $2a $54 $0 $3
	m_PointerWarp  $40 $2a group5Room2aWarpSources
	m_StandardWarp $04 $35 $55 $0 $3
	m_PointerWarp  $40 $35 group5Room35WarpSources
	m_StandardWarp $04 $40 $56 $0 $3
	m_PointerWarp  $40 $40 group5Room40WarpSources
	m_StandardWarp $04 $d3 $5b $0 $3
	m_StandardWarp $00 $d2 $0a $7 $2
	m_StandardWarp $04 $50 $1a $0 $3
	m_StandardWarp $00 $69 $10 $7 $2
	m_StandardWarp $00 $61 $1d $7 $2
	m_StandardWarp $00 $6a $1e $7 $2
	m_StandardWarp $00 $5f $1f $7 $2
	m_PointerWarp  $40 $36 group5Room36WarpSources
	m_PointerWarp  $40 $34 group5Room34WarpSources
	m_PointerWarp  $40 $29 group5Room29WarpSources
	m_StandardWarp $00 $2b $68 $5 $2
	m_PointerWarp  $40 $1a group5Room1aWarpSources
	m_StandardWarp $00 $3f $24 $7 $2
	m_StandardWarp $00 $2f $25 $7 $2
	m_PointerWarp  $40 $2e group5Room2eWarpSources
	m_StandardWarp $00 $3a $28 $7 $2
	m_StandardWarp $00 $2c $74 $5 $2
	m_PointerWarp  $40 $1c group5Room1cWarpSources
	m_StandardWarp $00 $15 $0e $7 $2
	m_StandardWarp $00 $18 $26 $7 $2
	m_StandardWarp $00 $38 $2c $7 $2
	m_StandardWarp $00 $3e $2d $7 $2
	m_StandardWarp $04 $fd $57 $0 $3
	m_PointerWarp  $40 $fd group5RoomfdWarpSources
	m_StandardWarp $00 $fe $36 $0 $2
	m_StandardWarp $00 $06 $5a $0 $2
	m_StandardWarp $00 $08 $5f $0 $2
	m_StandardWarp $00 $07 $5e $0 $2
	m_StandardWarp $00 $09 $5c $0 $2
	m_StandardWarp $00 $0a $62 $0 $2
	m_PointerWarp  $40 $0b group5Room0bWarpSources
	m_PointerWarp  $40 $62 group5Room62WarpSources
	m_PointerWarp  $40 $20 group5Room20WarpSources
	m_PointerWarp  $40 $23 group5Room23WarpSources
	m_PointerWarp  $40 $14 group5Room14WarpSources
	m_PointerWarp  $40 $3d group5Room3dWarpSources
	m_StandardWarp $00 $2d $70 $0 $2
	m_PointerWarp  $40 $30 group5Room30WarpSources
	m_StandardWarp $00 $95 $47 $1 $2
	m_WarpSourcesEnd
group5Room30WarpSources:
	m_PointedWarp $80 $2c $2f $7 $2
group5Room3dWarpSources:
	m_PointedWarp $80 $91 $6f $0 $2
group5Room2aWarpSources:
	m_PointedWarp $80 $91 $6e $0 $2
group5Room14WarpSources:
	m_PointedWarp $80 $91 $06 $0 $2
group5Room23WarpSources:
	m_PointedWarp $80 $51 $34 $7 $2
group5Room20WarpSources:
	m_PointedWarp $80 $2c $30 $7 $2
group5Room0bWarpSources:
	m_PointedWarp $00 $8b $63 $0 $2
	m_PointedWarp $80 $24 $56 $3 $2
group5Room62WarpSources:
	m_PointedWarp $00 $97 $80 $5 $2
	m_PointedWarp $80 $27 $4f $3 $2
group5RoomfdWarpSources:
	m_PointedWarp $80 $1c $48 $3 $2
group5Room29WarpSources:
	m_PointedWarp $80 $82 $79 $5 $2
group5Room1cWarpSources:
	m_PointedWarp $00 $9c $75 $5 $2
	m_PointedWarp $80 $12 $2b $7 $2
group5Room2eWarpSources:
	m_PointedWarp $00 $12 $2a $7 $2
	m_PointedWarp $80 $9c $76 $5 $2
group5Room40WarpSources:
	m_PointedWarp $80 $1d $23 $7 $2
group5Room1aWarpSources:
	m_PointedWarp $00 $91 $73 $5 $2
	m_PointedWarp $00 $9d $27 $7 $2
	m_PointedWarp $00 $69 $29 $7 $2
	m_PointedWarp $80 $65 $59 $0 $2
group5Room34WarpSources:
	m_PointedWarp $00 $82 $2c $5 $2
	m_PointedWarp $80 $1d $21 $7 $2
group5Room36WarpSources:
	m_PointedWarp $00 $8c $40 $5 $2
	m_PointedWarp $80 $22 $22 $7 $2
group5Room35WarpSources:
	m_PointedWarp $00 $11 $20 $7 $2
group5RoomfcWarpSources:
	m_PointedWarp $80 $84 $51 $0 $2

warpSource7dde:
	m_PointedWarp $00 $21 $2e $5 $2
	m_PointedWarp $80 $57 $23 $5 $2
warpSource7df6:
	m_PointedWarp $00 $42 $0b $7 $2
	m_PointedWarp $80 $49 $0c $7 $2
warpSource7dfe:
	m_PointedWarp $00 $93 $34 $2 $2
	m_PointedWarp $80 $9b $35 $2 $2
warpSource7e06:
	m_PointedWarp $00 $57 $1c $7 $2
	m_WarpSourcesEnd

group6WarpSources: ; $13e0e
	m_StandardWarp $01 $05 $08 $4 $3
	m_StandardWarp $01 $10 $0b $4 $3
	m_StandardWarp $01 $27 $0c $4 $3
	m_StandardWarp $02 $27 $62 $4 $3
	m_StandardWarp $02 $2a $10 $4 $3
	m_StandardWarp $04 $2b $0d $4 $3
	m_StandardWarp $08 $2b $0e $4 $3
	m_StandardWarp $01 $68 $12 $4 $3
	m_StandardWarp $08 $68 $11 $4 $3
	m_StandardWarp $01 $93 $19 $4 $3
	m_StandardWarp $02 $94 $17 $4 $3
	m_StandardWarp $01 $95 $1a $4 $3
	m_StandardWarp $08 $96 $15 $4 $3
	m_StandardWarp $01 $97 $16 $4 $3
	m_StandardWarp $02 $97 $18 $4 $3
	m_StandardWarp $01 $98 $13 $4 $3
	m_StandardWarp $02 $98 $14 $4 $3
	m_StandardWarp $01 $c0 $1b $4 $3
	m_StandardWarp $02 $c0 $1c $4 $3
	m_StandardWarp $02 $28 $61 $4 $3
	m_StandardWarp $01 $28 $63 $4 $3
	m_WarpSourcesEnd


group7WarpSources: ; $13e5e
	m_StandardWarp $01 $01 $11 $0 $3
	m_StandardWarp $02 $01 $02 $7 $3
	m_StandardWarp $04 $02 $01 $7 $3
	m_StandardWarp $02 $02 $22 $2 $3
	m_StandardWarp $02 $03 $05 $7 $3
	m_StandardWarp $04 $04 $04 $7 $3
	m_StandardWarp $02 $04 $24 $2 $3
	m_StandardWarp $01 $08 $6c $5 $3
	m_StandardWarp $02 $08 $17 $3 $3
	m_StandardWarp $01 $09 $07 $1 $3
	m_StandardWarp $02 $0a $19 $3 $3
	m_StandardWarp $01 $05 $4a $3 $3
	m_StandardWarp $02 $05 $3c $3 $3
	m_StandardWarp $00 $07 $3b $5 $2
	m_StandardWarp $01 $10 $08 $5 $3
	m_StandardWarp $02 $11 $07 $5 $3
	m_StandardWarp $01 $11 $17 $5 $3
	m_StandardWarp $01 $29 $0a $5 $3
	m_StandardWarp $02 $2a $09 $5 $3
	m_StandardWarp $01 $47 $0b $5 $3
	m_StandardWarp $02 $47 $72 $5 $3
	m_StandardWarp $08 $48 $0c $5 $3
	m_StandardWarp $01 $48 $71 $5 $3
	m_StandardWarp $04 $49 $0d $5 $3
	m_StandardWarp $02 $4a $0e $5 $3
	m_StandardWarp $01 $4a $78 $5 $3
	m_StandardWarp $02 $73 $13 $5 $3
	m_StandardWarp $01 $74 $12 $5 $3
	m_StandardWarp $02 $74 $11 $5 $3
	m_StandardWarp $02 $75 $10 $5 $3
	m_StandardWarp $01 $76 $14 $5 $3
	m_StandardWarp $08 $76 $0f $5 $3
	m_StandardWarp $04 $ef $44 $4 $3
	m_StandardWarp $04 $d3 $61 $0 $3
	m_StandardWarp $01 $bf $21 $5 $3
	m_StandardWarp $02 $c0 $24 $5 $3
	m_StandardWarp $02 $71 $22 $5 $3
	m_StandardWarp $01 $70 $26 $5 $3
	m_StandardWarp $01 $72 $27 $5 $3
	m_StandardWarp $08 $45 $15 $5 $3
	m_StandardWarp $01 $44 $2a $5 $3
	m_StandardWarp $02 $46 $2b $5 $3
	m_StandardWarp $02 $43 $6e $5 $3
	m_StandardWarp $08 $43 $6f $5 $3
	m_StandardWarp $01 $42 $70 $5 $3
	m_StandardWarp $04 $42 $6d $5 $3
	m_StandardWarp $08 $4b $77 $5 $3
	m_WarpSourcesEnd


