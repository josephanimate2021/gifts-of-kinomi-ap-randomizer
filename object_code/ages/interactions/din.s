; ==================================================================================================
; INTERAC_DIN
; ==================================================================================================
interactionCodeaa:
	call checkInteractionState
	jr z,@state0

@state1:
	call interactionRunScript
	jp c,interactionDelete
	jp interactionAnimateAsNpc

@state0:
	ld a,$01
	ld (de),a

	call interactionInitGraphics
	ld a,$06
	call objectSetCollideRadius
	call objectMarkSolidPosition
	call objectSetVisiblec2

; Whether to delete
	callab agesInteractionsBank09.getGameProgress_Seasons
	ld hl,@dinSubidAppearances
	ld a,b ; game progress in b
	rst_addAToHl	
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	jp nz,interactionDelete

; Text
	ld hl,@dinTextIndices
	ld a,b ; game progress in b
	rst_addAToHl
	ld a,(hl)
	ld e,Interaction.textID
	ld (de),a
	inc e ; Interaction.textID+1
	ld a,>TX_1c00
	ld (de),a

; set animation/graphics?

; Scripts
	ld hl,@dinScripts
	ld a,b ; game progress in b
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript


@dinSubidAppearances:
	.db $00 $01 $02 $03
	.db $04 $05 $06 $07
	.db $08

@dinTextIndices:
	.db <TX_1c00 ; $00
	.db <TX_1c01 ; $01
	.db <TX_1c02 ; $02
	.db <TX_1c03 ; $03
	.db <TX_1c04 ; $04
	.db <TX_1c05 ; $05
	.db <TX_1c06 ; $06
	.db <TX_1c07 ; $07
	.db <TX_1c08 ; $08

@dinScripts:
	.dw mainScripts.dinScript_generic ; $00
	.dw mainScripts.dinScript_generic ; $01
	.dw mainScripts.dinScript_generic ; $02
	.dw mainScripts.dinScript_generic ; $03
	.dw mainScripts.dinScript_generic ; $04
	.dw mainScripts.dinScript_generic ; $05
	.dw mainScripts.dinScript_generic ; $06
	.dw mainScripts.dinScript_generic ; $07
	.dw mainScripts.dinScript_generic ; $08



/*
interactionCodeaa:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	ld a,$01
	ld (de),a ; [state]
	call interactionInitGraphics
	call objectSetVisible82
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @initSubid0
	.dw @initSubid1
	.dw @initSubid2

@initSubid0:
@initSubid1:
	ret

@initSubid2:
	call interactionSetAlwaysUpdateBit
	ld bc,$4830
	jp interactionSetPosition


@state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @runSubid0
	.dw interactionAnimate
	.dw interactionAnimate

@runSubid0:
	call @runSubid0Substates
	ld e,Interaction.zh
	ld a,(de)
	or a
	jp nz,objectSetVisiblec2
	jp objectSetVisible82

@runSubid0Substates:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @substate0
	.dw @substate1
	.dw @substate2
	.dw @substate3
	.dw interactionAnimate

@substate0:
	call interactionAnimate
	ld a,(wTmpcfc0.genericCutscene.state)
	cp $04
	ret nz
	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),120
	ld a,$05
	call interactionSetAnimation
	jp @beginJump

@substate1:
	call interactionDecCounter1
	jp nz,@updateSpeedZ
	call interactionIncSubstate
	xor a
	ld l,Interaction.zh
	ld (hl),a
	ld l,Interaction.counter1
	ld (hl),30
	jp interactionAnimate

@substate2:
	call interactionDecCounter1
	jr nz,++
	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),60
	ld bc,TX_3d09
	call showText
++
	jp interactionAnimate

@substate3:
	call interactionDecCounter1IfTextNotActive
	jr nz,++
	call interactionIncSubstate
	ld hl,wTmpcfc0.genericCutscene.state
	ld (hl),$05
++
	jp interactionAnimate


; Scripts unused?
@loadScript:
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript

@scriptTable:
	.dw mainScripts.dinScript


@updateSpeedZ:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz
	ld h,d

@beginJump:
	ld bc,-$100
	jp objectSetSpeedZ
*/