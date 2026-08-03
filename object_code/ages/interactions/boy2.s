; ==================================================================================================
; INTERAC_BOY_2
; ==================================================================================================
interactionCode3f:
	call checkInteractionState
	jr z,@state0

@state1:
	call interactionRunScript
	jp interactionAnimateAsNpc

@state0:
	call interactionIncState
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
	.db $00 $00 $01 $01
	.db $02 $02 $01 $01
	.db $03 $04

@scripts:
	.dw mainScripts.boy2_subid0Script ; ROOM_AGES_003
	.dw mainScripts.boy2_subid1Script ; ROOM_AGES_013
	.dw mainScripts.boy2_subid2Script ; ROOM_AGES_002
	.dw mainScripts.boy2_subid3Script ; ROOM_AGES_015











/*
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1
	.dw @subid2
	.dw @subid3

@subid0:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	jp nz,interactionDelete
	ld a,GLOBALFLAG_0b
	call checkGlobalFlag
	jp nz,interactionDelete

	call @initializeGraphicsAndScript
@@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate


@subid1:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	callab getGameProgress_1
	ld a,b
	cp $03
	jp nz,interactionDelete
	call @initializeGraphicsAndScript
@@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate


@subid2:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	call getThisRoomFlags
	bit 6,a
	jp nz,interactionDelete
	call @initGraphicsAndIncState

	ld l,Interaction.var3d
	ld e,Interaction.xh
	ld a,(de)
	ld (hl),a

	jp objectSetVisiblec2

@@state1:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2

@@substate0:
	call interactionAnimate
	ld a,($cfd1)
	cp $01
	ret nz
	call interactionIncSubstate
	jpab agesInteractionsBank08.startJump

@@substate1:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz
	call interactionIncSubstate
	call @initializeScript
	dec (hl)
	ret

@@substate2:
	jpab agesInteractionsBank08.boyRunSubid03


@subid3:
	call checkInteractionState
	jr z,@@state0

@@state1:
	jpab agesInteractionsBank08.boyRunSubid09

@@state0:
	call @initGraphicsAndIncState
	ld l,Interaction.counter1
	ld (hl),$78
	ld l,Interaction.oamFlags
	ld (hl),$02
	jp objectSetVisiblec1

@initGraphicsAndIncState:
	call interactionInitGraphics
	call objectMarkSolidPosition
	jp interactionIncState


@initializeGraphicsAndScript:
	call interactionInitGraphics
	call objectMarkSolidPosition

@initializeScript:
	ld a,>TX_2900
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
	.dw mainScripts.boy2Subid0Script
	.dw mainScripts.boy2Subid1Script
	.dw mainScripts.boy2Subid2Script
	.dw mainScripts.stubScript
*/