singleTileChangeGroupTable:
	.dw singleTileChangeGroup0Data
	.dw singleTileChangeGroup1Data
	.dw singleTileChangeGroup2Data
	.dw singleTileChangeGroup3Data
	.dw singleTileChangeGroup4Data
	.dw singleTileChangeGroup5Data
	.dw singleTileChangeGroup6Data
	.dw singleTileChangeGroup7Data

; Data format:
; b0: Room index
; b1: Bitmask to check. If bitmask & [room flags] is nonzero, the change is applied.
;     Special cases:
;       * $f0: the change applies to unlinked games.
;       * $f1: the change applies to linked games.
;       * $f2: the change applies after finishing an unlinked game.
;		* $e0-$e7: corresponds to the 8 slate slots
; b2: Position of tile to change
; b3: New tile to put at that position

singleTileChangeGroup0Data:
	.db <ROOM_AGES_008 ROOMFLAG_80 $27 $ed
	.db <ROOM_AGES_032 ROOMFLAG_40 $55 TILEINDEX_OVERWORLD_STANDARD_GROUND
	.db <ROOM_AGES_057 ROOMFLAG_40 $56 TILEINDEX_OVERWORLD_STANDARD_GROUND
	
	.db <ROOM_AGES_054 ROOMFLAG_40 $51 $23
	.db <ROOM_AGES_055 ROOMFLAG_40 $24 $cf
	.db <ROOM_AGES_064 ROOMFLAG_40 $51 $31
	.db <ROOM_AGES_065 ROOMFLAG_40 $44 $2b
	.db <ROOM_AGES_074 ROOMFLAG_40 $31 $cf
	.db <ROOM_AGES_075 ROOMFLAG_40 $32 TILEINDEX_OVERWORLD_BUSH_1
	;Can't because of desert differences
;	.db <ROOM_AGES_051 ROOMFLAG_40 $68 TILEINDEX_OVERWORLD_STANDARD_GROUND
;	.db <ROOM_AGES_062 ROOMFLAG_40 $67 TILEINDEX_OVERWORLD_STANDARD_GROUND
;	.db $39 $40 $22 $d7
;	.db $83 $80 $43 $1c
;	.db $13 $02 $42 $d7
;	.db $13 $04 $47 $d7
;	.db $0a $80 $17 $ee
	;.db $48 $f0 $28 $64
	;.db $47 $f2 $36 $f2
	;.db $88 $02 $66 $3a
	;.db $6a $02 $48 $3a
	;.db $48 $02 $68 $3a
	;.db $64 $02 $67 $3a
	.db $00 $00

singleTileChangeGroup1Data:
	.db <ROOM_AGES_102, ROOMFLAG_80, $17, $ee
	.db <ROOM_AGES_162, ROOMFLAG_40, $65, TILEINDEX_OVERWORLD_STANDARD_GROUND
;	.db $0e $80 $16 $af
;	.db $48 $02 $48 $3a
;	.db $15 $80 $34 $9e
;	.db $17 $80 $18 $9e
;	.db $35 $80 $58 $9e
;	.db $37 $80 $57 $9e
;	.db $ba $80 $54 $a2
;	.db $ba $80 $55 $ef
;	.db $ba $80 $56 $a4
;	.db $a5 $80 $22 $ee
;	.db $a5 $80 $23 $ef
;	.db $65 $08 $51 $3a
;	.db $65 $02 $61 $3a
	.db $00 $00

singleTileChangeGroup2Data:
	.db <ROOM_AGES_21a ROOMFLAG_40 $22 TILEINDEX_PUSHABLE_BLOCK
	.db <ROOM_AGES_21a ROOMFLAG_40 $23 TILEINDEX_STANDARD_FLOOR
	.db $d7 $f0 $42 $e9
	.db $00 $00

singleTileChangeGroup3Data:
	.db <ROOM_AGES_308, ROOMFLAG_40, $31, TILEINDEX_STANDARD_FLOOR
	.db <ROOM_AGES_308, ROOMFLAG_40, $41, $1a
	.db <ROOM_AGES_379, ROOMFLAG_40, $34, TILEINDEX_STANDARD_FLOOR
	.db <ROOM_AGES_379, ROOMFLAG_40, $35, $1d
	.db $d6 $f1 $55 $e9
;	.db $0f $80 $16 $af
	.db $9e $80 $31 $1c
	.db $9e $80 $32 $a0
	.db $00 $00

singleTileChangeGroup4Data:
	.db <ROOM_AGES_44f ROOMFLAG_40 $81 TILEINDEX_STANDARD_FLOOR

	.db <ROOM_AGES_479 $e0 $77 TILEINDEX_FILLED_SLATE_1
	.db <ROOM_AGES_479 $e0 $86 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e0 $88 TILEINDEX_LIT_TORCH 
	.db <ROOM_AGES_479 $e1 $5a TILEINDEX_FILLED_SLATE_1+$01
	.db <ROOM_AGES_479 $e1 $4b TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e1 $6b TILEINDEX_LIT_TORCH 
	.db <ROOM_AGES_479 $e2 $37 TILEINDEX_FILLED_SLATE_1+$02
	.db <ROOM_AGES_479 $e2 $26 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e2 $28 TILEINDEX_LIT_TORCH 
	.db <ROOM_AGES_479 $e3 $54 TILEINDEX_FILLED_SLATE_1+$03
	.db <ROOM_AGES_479 $e3 $43 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e3 $63 TILEINDEX_LIT_TORCH

	.db <ROOM_AGES_479 $e4 $02 TILEINDEX_FILLED_SLATE_1
	.db <ROOM_AGES_479 $e4 $11 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e4 $13 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e5 $80 TILEINDEX_FILLED_SLATE_1+$01
	.db <ROOM_AGES_479 $e5 $71 TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e5 $91 TILEINDEX_LIT_TORCH 
	.db <ROOM_AGES_479 $e6 $ac TILEINDEX_FILLED_SLATE_1+$02
	.db <ROOM_AGES_479 $e6 $9b TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e6 $9d TILEINDEX_LIT_TORCH 
	.db <ROOM_AGES_479 $e7 $2e TILEINDEX_FILLED_SLATE_1+$03
	.db <ROOM_AGES_479 $e7 $1d TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_479 $e7 $3d TILEINDEX_LIT_TORCH 
	
	.db <ROOM_AGES_479 ROOMFLAG_40 $77 TILEINDEX_NORTH_STAIRS
;Armos statue puzzle
	.db <ROOM_AGES_474 ROOMFLAG_80 $2c $26
	.db <ROOM_AGES_474 ROOMFLAG_80 $3d TILEINDEX_STANDARD_FLOOR

	.db <ROOM_AGES_47a ROOMFLAG_40 $44 $1d
	.db <ROOM_AGES_47a ROOMFLAG_40 $54 TILEINDEX_STANDARD_FLOOR

	.db <ROOM_AGES_478 ROOMFLAG_40 $37 TILEINDEX_STANDARD_FLOOR
	.db <ROOM_AGES_478 ROOMFLAG_40 $38 TILEINDEX_PUSHABLE_BLOCK

	.db <ROOM_AGES_46c ROOMFLAG_40 $2a TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_46c ROOMFLAG_40 $4c TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_46c ROOMFLAG_40 $6a TILEINDEX_LIT_TORCH
	.db <ROOM_AGES_46c ROOMFLAG_40 $48 TILEINDEX_LIT_TORCH

	.db <ROOM_AGES_46c ROOMFLAG_40 $8c TILEINDEX_INDOOR_UPSTAIRCASE
	.db <ROOM_AGES_46c ROOMFLAG_40 $82 TILEINDEX_INDOOR_UPSTAIRCASE
	.db <ROOM_AGES_474 ROOMFLAG_40 $8c TILEINDEX_INDOOR_DOWNSTAIRCASE
	.db <ROOM_AGES_474 ROOMFLAG_40 $82 TILEINDEX_INDOOR_DOWNSTAIRCASE

	.db <ROOM_AGES_44a ROOMFLAG_80 $57 TILEINDEX_INDOOR_DOWNSTAIRCASE
	.db <ROOM_AGES_44a ROOMFLAG_80 $97 TILEINDEX_INDOOR_DOWNSTAIRCASE

	.db <ROOM_AGES_463 ROOMFLAG_ITEM $2c TILEINDEX_STANDARD_FLOOR
	.db <ROOM_AGES_463 ROOMFLAG_ITEM $65 TILEINDEX_STANDARD_FLOOR
	.db <ROOM_AGES_463 ROOMFLAG_ITEM $6b TILEINDEX_STANDARD_FLOOR

;	.db $56 $20 $44 $a0
;	.db $59 $80 $a3 $a0
;	.db $4b $80 $54 $a0
;	.db $4b $80 $55 $1d
;	.db $c5 $20 $57 $52
	.db $00 $00

singleTileChangeGroup5Data:
	.db <ROOM_AGES_56f ROOMFLAG_80 $36 $5c
	.db <ROOM_AGES_56f ROOMFLAG_80 $76 $5a
;	.db $19 $01 $08 $34
;	.db $26 $02 $5e $35
;	.db $87 $40 $7c $50
;	.db $9c $40 $42 $52
;	.db $a9 $40 $77 $52

;	.db $8a $01 $77 $d4
;	.db $8a $01 $86 $09
;	.db $8a $01 $88 $09
;	.db $8a $02 $5a $d5
;	.db $8a $02 $4b $09
;	.db $8a $02 $6b $09
;	.db $8a $04 $37 $d6
;	.db $8a $04 $26 $09
;	.db $8a $04 $28 $09
;	.db $8a $08 $54 $d7
;	.db $8a $08 $43 $09
;	.db $8a $08 $63 $09
;	.db $8a $40 $77 $52

	.db $f0 $80 $9d $44
	.db $f1 $80 $66 $45
	.db $f5 $80 $9d $44
	.db $00 $00

singleTileChangeGroup6Data:
	.db $2b $80 $aa $19
singleTileChangeGroup7Data:
	.db $00 $00
