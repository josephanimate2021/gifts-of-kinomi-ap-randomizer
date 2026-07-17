; ==================================================================================================
; INTERAC_POE
;
; var3e: Animations don't update when nonzero. (Used when disappearing.)
; var3f: If nonzero, doesn't face toward Link.
; ==================================================================================================
interactionCode59:
	call checkInteractionState
	jr nz,@state1

@state0:
ld b,b
	ld a,TREASURE_GRAVEYARD_KEY
	call checkTreasureObtained
	jp c,interactionDelete ; Delete the poe if the player already obtained the key

@init:
	call @loadScriptAndInitGraphics
@state1:
	call interactionRunScript
	jp c,interactionDelete

	ld e,Interaction.var3e
	ld a,(de)
	or a
	ret nz
	ld e,Interaction.var3f
	ld a,(de)
	or a
	jp z,npcFaceLinkAndAnimate
	call interactionAnimate
	jp objectSetPriorityRelativeToLink_withTerrainEffects



@loadScriptAndInitGraphics:
	call interactionInitGraphics
	call objectMarkSolidPosition
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
	.dw mainScripts.poeScript
