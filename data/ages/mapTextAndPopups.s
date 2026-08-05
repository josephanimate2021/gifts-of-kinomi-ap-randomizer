; Each number corresponds to TX_03XX (see text.txt).
; If bit 7 is set, that indicates special behaviour; see the "mapGetRoomText" function.
presentMapTextIndices:
	.db $09 $89 $0b  $81 $07  $19 $19 $99         $05 $82 $a9 $05 $05 $05
	.db $09 $09 $0b  $07 $07  $19 $19 $19         $05 $05 $05 $05 $05 $42
	.db $09 $09 $0b  $07 $0a  $19 $19 $19         $06 $06 $06 $06 $05 $05
	.db $06 $06 $06 $06    $0c $0c $19 $19    $80 $08 $1b $06 $b1 $06
	.db $06 $06 $06 $06    $0c $0c $03 $03    $81 $08 $08 $06 $06 $06

	.db $85 $85 $85 $85    $03 $03 $04 $04    $1e $08 $08 $15 $09 $1a
	.db $85 $85 $85 $85    $03 $03 $04 $04    $1d $08 $08 $09 $09 $09
	.db $de $85 $85 $85    $03 $03 $04 $a1    $0b $08 $08 $09 $09 $09

	.db $0a $0a $0a $0a   $a1 $a1 $a1 $a1 $0b $08 $08 $09 $09 $89
	.db $b9 $0a $0a $0a $0a $0c $0c $0c $0c $0c $0d $0d $0d $0d
	.db $0e $0e $0f $0f $0f $41 $10 $0c $0c $11 $11 $11 $11 $11
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $99 $11 $11 $47
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $11 $11 $11 $11
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $11 $11 $11 $11

pastMapTextIndices:
	.db $30 $30 $30      $03 $03 $38 $38 $38 $05 $05 $05 $05 $05 $05
	.db $30 $02 $02     $21 $03 $38 $38 $38 $05 $05 $05 $05 $05 $48

	.db  $02 $02 $02    $31 $03 $38 $38 $38 $06 $06 $06 $06 $05 $05

	.db $06 $06 $06 $06  $02 $38 $38 $38 $80 $33 $33 $06 $e1 $06
	.db $06 $06 $06 $06  $02 $49 $32 $32 $e9 $33 $35 $06 $06 $06

	.db $11 $11 $11 $11  $02 $3d $4a $3c $84 $32 $35 $36 $c1 $36
	.db $11 $11 $11 $11  $34 $32 $22 $32 $32 $32 $36 $36 $36 $36
	.db $91 $11 $11 $11  $37 $13 $46 $0c $0c $3a $36 $36 $36 $36

	.db $37 $37 $37 $91 $37 $13 $13 $0c $0c $0c $36 $36 $36 $36
	.db $37 $37 $37 $37 $37 $0c $0c $0c $0d $0d $0d $0d $0d $0d
	.db $0e $0e $0f $0f $0f $41 $10 $39 $10 $11 $11 $11 $11 $3b
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $11 $11 $11 $16
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $11 $11 $11 $11
	.db $0e $0e $0f $0f $0f $0f $10 $10 $10 $11 $11 $11 $11 $11



; This is the list of popups that appear when hovering the cursor over a tile.
;
; b0: room index
; b1: popup behaviour. Each digit represents a different popup; screens with only one
;     popup use the same digit twice. (see the "mapMenu_LoadPopupData" function)
presentMinimapPopups:
; Dungeons
	m_PopupData <ROOM_AGES_003 POPUP_CAVE ;.db $03 $88
	m_PopupData <ROOM_AGES_001 POPUP_CAVE ;.db $01 $88
	m_PopupData <ROOM_AGES_070 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_007 POPUP_STUMP POPUP_CAVE
; Trees
	m_PopupData <ROOM_AGES_004 POPUP_SEED_TREE
	m_PopupData <ROOM_AGES_071 POPUP_SEED_TREE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_077 POPUP_SEED_TREE POPUP_CAVE
	m_PopupData <ROOM_AGES_084 POPUP_SEED_TREE
	m_PopupData <ROOM_AGES_085 POPUP_SEED_TREE
	m_PopupData <ROOM_AGES_086 POPUP_SEED_TREE
	m_PopupData <ROOM_AGES_087 POPUP_SEED_TREE
; Seasons
	m_PopupData <ROOM_AGES_006 POPUP_STUMP
	m_PopupData <ROOM_AGES_015 POPUP_CAVE
	m_PopupData <ROOM_AGES_017 POPUP_PRESENT_HOUSE
	m_PopupData <ROOM_AGES_025 POPUP_STUMP
	m_PopupData <ROOM_AGES_035 POPUP_CAVE
	m_PopupData <ROOM_AGES_036 POPUP_STUMP
	m_PopupData <ROOM_AGES_037 POPUP_CAVE
	m_PopupData <ROOM_AGES_044 POPUP_STUMP
	m_PopupData <ROOM_AGES_045 POPUP_STUMP
	m_PopupData <ROOM_AGES_046 POPUP_CAVE
	m_PopupData <ROOM_AGES_047 POPUP_CAVE
	m_PopupData <ROOM_AGES_056 POPUP_CAVE
	m_PopupData <ROOM_AGES_064 POPUP_STUMP
	m_PopupData <ROOM_AGES_067 POPUP_STUMP
; Ages
	m_PopupData <ROOM_AGES_002 POPUP_PRESENT_HOUSE
	m_PopupData <ROOM_AGES_010 POPUP_CAVE
	m_PopupData <ROOM_AGES_030 POPUP_TIMEPORTAL_SPOT;POPUP_PRESENT_HOUSE
	m_PopupData <ROOM_AGES_033 POPUP_CAVE
	m_PopupData <ROOM_AGES_040 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_050 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_051 POPUP_CAVE
	m_PopupData <ROOM_AGES_052 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_053 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_060 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_063 POPUP_TIMEPORTAL_SPOT

; Ages Desert
	;m_PopupData <ROOM_AGES_061 POPUP_TIMEPORTAL_SPOT ; desert only
	;m_PopupData <ROOM_AGES_073 POPUP_TIMEPORTAL_SPOT ; desert only
; Common
	m_PopupData <ROOM_AGES_013 POPUP_SHOP POPUP_PRESENT_HOUSE
	m_PopupData <ROOM_AGES_023 POPUP_PRESENT_HOUSE
	m_PopupData <ROOM_AGES_024 POPUP_PRESENT_HOUSE
	.db $ff

/*
;	.db $48 $88 ; 0x00
	.db $8d $88 ; 0x02
	.db $83 $88 ; 0x04
	.db $ba $88 ; 0x06
;	.db $03 $88 ; 0x08
;	.db $0a $88 ; 0x0a
;	.db $3c $a8 ; 0x0c
	.db $90 $98 ; 0x10
;	.db $03 $88 ; 0x12
	.db $ac $ff ; 0x14
;	.db $13 $af ; 0x16
;	.db $78 $ff ; 0x18
	.db $c1 $ff ; 0x1a
;	.db $0b $aa ; 0x1c
;	.db $05 $99 ; 0x1e
;	.db $09 $dd
;	.db $1b $aa
;	.db $1d $a8
;	.db $20 $aa
;	.db $2c $99
;	.db $30 $99
;	.db $38 $44
;	.db $39 $aa
;	.db $3a $a1
;	.db $41 $aa
;	.db $45 $11
;	.db $47 $11
;	.db $51 $aa
;	.db $53 $11
;	.db $55 $11
;	.db $57 $11
;	.db $58 $77
;	.db $5d $77
;	.db $63 $aa
;	.db $66 $11
;	.db $68 $ac
;	.db $76 $ee
;	.db $7b $99
	.db $90 $99
	.db $a5 $55
	.db $a9 $aa
	.db $ad $99
	.db $bd $88
	.db $cb $99
	.db $cd $aa
	.db $d7 $99
	.db $ff
*/
pastMinimapPopups:
; Dungeons
	m_PopupData <ROOM_AGES_170 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_102 POPUP_SEED_TREE POPUP_CAVE
; Trees
	m_PopupData <ROOM_AGES_112 POPUP_SEED_TREE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_150 POPUP_SEED_TREE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_171 POPUP_SEED_TREE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_113 POPUP_SEED_TREE POPUP_TIMEPORTAL_SPOT
; Ages
	m_PopupData <ROOM_AGES_120 POPUP_CAVE
	m_PopupData <ROOM_AGES_130 POPUP_SYRUP POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_131 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_133 POPUP_CAVE
	m_PopupData <ROOM_AGES_140 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_151 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_160 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_161 POPUP_TIMEPORTAL_SPOT
	m_PopupData <ROOM_AGES_173 POPUP_CAVE POPUP_TIMEPORTAL_SPOT
	.db $ff

/*
	.db $3c $88
	.db $5c $88
	.db $48 $a8
	.db $08 $ff
	.db $25 $ff
	.db $2d $ff
	.db $78 $ff
	.db $80 $ff
	.db $c1 $ff
	.db $01 $99
	.db $0a $99
	.db $13 $33
	.db $1d $88
	.db $20 $aa
	.db $23 $88
	.db $28 $99
	.db $34 $99
	.db $38 $44
	.db $3c $88
	.db $41 $aa
	.db $45 $33
	.db $51 $aa
	.db $55 $91
	.db $56 $33
	.db $57 $11
	.db $58 $b6
	.db $66 $11
	.db $76 $ee
	.db $79 $11
	.db $83 $88
	.db $95 $99
	.db $d0 $99
	.db $a5 $55
	.db $a7 $33
	.db $ad $22
	.db $bd $88
	.db $ca $99
	.db $cd $aa
	.db $d9 $aa
	.db $ff
*/
