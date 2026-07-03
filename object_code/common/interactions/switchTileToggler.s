; ==================================================================================================
; INTERAC_SWITCH_TILE_TOGGLER
; ==================================================================================================
interactionCode78:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	ld a,$01
	ld (de),a
	ld a,(wSwitchState)
	ld e,Interaction.var03
	ld (de),a

@state1:
	ld a,(wSwitchState)
	ld b,a
	ld e,Interaction.var03
	ld a,(de)
	cp b
	ret z

	ld hl,@tileReplacement
	ld a,(wActiveGroup)
	sub $03
	jr c,+
	ld hl,@group4TileReplacement
	sub $01
	jr z,+
	ld hl,@group5TileReplacement
+
	ld a,b
	ld (de),a
	ld e,Interaction.xh
	ld a,(de)
	rst_addDoubleIndex
	ld e,Interaction.subid
	ld a,(de)
	and b
	jr z,+
	inc hl
+
	ld e,Interaction.yh
	ld a,(de)
	ld c,a
	ld a,(hl)
	jp setTile

; Index for this table is "Interaction.xh". Determines what tiles will appear when
; a switch is on or off.
;   b0: tile index when switch not pressed
;   b1: tile index when switch pressed

@tileReplacement:
	.db $5d $59 ; $00

@group4TileReplacement:
	.db $5d $59
	.db $5e $5b
	.db $5b $5a
	.db $5c $5d


@group5TileReplacement:
	.db $b0 $52
	.db $50 $b2

	.db $60 $d0 ;$97
	.db $d0 $60
