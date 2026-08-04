; ==================================================================================================
; INTERAC_MUSTACHE_MAN
; ==================================================================================================
interactionCode42:
	call checkInteractionState
	jr z,@state0

@state1:
	call interactionRunScript
	jp interactionAnimateAsNpc

@state0:
	call interactionIncState
	ld a,$06
	call objectSetCollideRadius
	call interactionInitGraphics
	call objectMarkSolidPosition
	call objectSetVisiblec2

; Whether to delete
	callab agesInteractionsBank09.getGameProgress_Ages
	ld hl,@subidAppearances
	ld a,b ; game progress in b
	rst_addAToHl
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	jp nz,interactionDelete

; Scripts
	ld hl,@scripts
	ld e,Interaction.subid
	ld a,(de)
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript

@subidAppearances:
	.db $00 $00 $00 $00
	.db $00 $00 $01 $02
	.db $02 $03

@scripts:
	.dw mainScripts.mustacheMan_subid0Script ; ROOM_AGES_20a
	.dw mainScripts.mustacheMan_subid1Script ; ROOM_AGES_20a
	.dw mainScripts.mustacheMan_subid2Script ; ROOM_AGES_112
	.dw mainScripts.mustacheMan_subid3Script ; ROOM_AGES_20a















/*
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1

@subid0:
	call checkInteractionState
	jr nz,@@initialized

	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	jp nz,interactionDelete
	call @initGraphicsAndScript
@@initialized:
	call interactionRunScript
	jp interactionAnimateAsNpc

@subid1:
	call checkInteractionState
	jr nz,@@initialized

	ld e,Interaction.var32
	ld a,$02
	ld (de),a
	call @initGraphicsAndScript

@@initialized:
	call interactionRunScript
	jp interactionAnimateAsNpc

; Unused
@func_52e8:
	call interactionInitGraphics
	call objectMarkSolidPosition
	jp interactionIncState

@initGraphicsAndScript:
	call interactionInitGraphics
	call objectMarkSolidPosition

	ld a,>TX_0f00
	call interactionSetHighTextIndex

	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp interactionIncState

@scriptTable:
	.dw mainScripts.mustacheManScript
	.dw mainScripts.genericNpcScript
*/