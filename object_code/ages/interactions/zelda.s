; ==================================================================================================
; INTERAC_ZELDA
; ==================================================================================================
interactionCodead:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw zelda_subid00 ; Room of Rites
	.dw zelda_subid01 ; NPC Zelda

zelda_subid01:
	call checkInteractionState
	jr z,@state0

@state1:
	call interactionRunScript
	jp c,interactionDelete
	ld e,Interaction.var03
	ld a,(de)
	cpa $05 ; number of walking Zeldas - see @zeldaScripts
	jp c,interactionAnimateAsNpc
	jp npcFaceLinkAndAnimate

@state0:
	call interactionIncState

	call interactionInitGraphics
	lda $06
	call objectSetCollideRadius
	call objectMarkSolidPosition
	call objectSetVisiblec2

; Whether to delete
	callab agesInteractionsBank09.getGameProgress_Ages
	callab agesInteractionsBank09.getGameProgress_Seasons
	;ld a,(wGameProgress2)
	;ld b,a

	ld a,b
	add a ; x2
	ld c,a
	add a ; x4
	add a ; x8
	add c ; +2 = 10
	ld c,a
	ld a,(wGameProgress1)
	add c
	ld c,a
; Should appear?
	ld hl,@var03AppearanceTable
	rst_addAToHl
	ld e,Interaction.var03
	ld a,(de)
	cp (hl)
	jp nz,interactionDelete

; Text
	ld a,c
	ld e,Interaction.var3e
	ld (de),a

	ld hl,@zeldaTextTable
	rst_addAToHl
	ld a,(hl)
	ld e,Interaction.textID
	ld (de),a
	inc e ; Interaction.textID+1
	ld a,>TX_0600
	ld (de),a
; Scripts
	ld e,Interaction.var03
	ld a,(de)
	ld hl,@zeldaScripts
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript	


@zeldaScripts:
	.dw mainScripts.zeldaScript_pacingVertical ; $00 - ROOM_AGES_308
	.dw mainScripts.zeldaScript_pacingVertical ; $01 - ROOM_AGES_5d3
	.dw mainScripts.zeldaScript_pacingHorizontal ; $02 - ROOM_AGES_5b1
	.dw mainScripts.zeldaScript_pacingHorizontal ; $03 - ROOM_AGES_012
	.dw mainScripts.zeldaScript_pacingHorizontal ; $04 - ROOM_AGES_015
	.dw mainScripts.zeldaScript_generic ; $05 - ROOM_AGES_5b1
	.dw mainScripts.zeldaScript_generic ; $06 - ROOM_AGES_218
	.dw mainScripts.zeldaScript_generic ; $07 - ROOM_AGES_023
	.dw mainScripts.zeldaScript_generic ; $08 - ROOM_AGES_013
	.dw mainScripts.zeldaScript_generic ; $09 - ROOM_AGES_024
	.dw mainScripts.zeldaScript_generic ; $0a - ROOM_AGES_014
	.dw mainScripts.zeldaScript_generic ; $0b - ROOM_AGES_003
	.dw mainScripts.zeldaScript_generic ; $0c - ROOM_AGES_013


@var03AppearanceTable:
; 		Start	Swd.	Stchl.	Trade	Harp	Cane	Gloves	Nayru 	Both	Game
; Start
	.db $05 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff
; Sword
	.db $ff 	$05 	$02		$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff
; Bombs
	.db $ff 	$07 	$07 	$08 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff
; Boomerang
	.db $ff 	$08 	$08 	$00 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff
; Rod
	.db $ff 	$05 	$01 	$0b 	$00 	$09 	$04 	$0a 	$ff 	$ff
; Flippers
	.db $ff 	$ff 	$05 	$06 	$03 	$09 	$02 	$01 	$ff 	$ff
; Feather
	.db $ff 	$ff 	$01 	$06 	$03 	$04 	$05 	$0a 	$ff 	$ff
; Din Gift
	.db $ff 	$ff		$0b 	$06 	$03 	$0b 	$0b 	$ff 	$ff 	$ff
; Both
	.db $ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$05 	$ff
; Game finished
	.db $ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$ff 	$0c

@zeldaTextTable:
; 		Start	Swd.	Stchl.	Trade	Harp	Cane	Gloves	Nayru 	Both	Game
; Start
	.db $00 	$20 	$20 	$20 	$20 	$20 	$20 	$20 	$20 	$20
; Sword
	.db $20 	$01 	$05 	$20 	$20 	$20 	$20 	$20 	$20 	$20
; Bombs
	.db $20 	$02 	$06 	$0c 	$20 	$20 	$20 	$20 	$20 	$20
; Boomerang
	.db $20 	$03		$07 	$0c 	$20 	$20 	$20 	$20 	$20 	$20
; Rod
	.db $20 	$04 	$08 	$0d 	$11 	$15 	$18 	$1b 	$20 	$20
; Flippers
	.db $20 	$20 	$09 	$0e 	$12 	$16 	$19 	$1c 	$20 	$20
; Feather
	.db $20 	$20 	$0a 	$0f 	$13 	$16 	$19 	$1d 	$20 	$20
; Din Gift
	.db $20 	$20		$0b 	$10 	$14 	$17 	$1a 	$20 	$20 	$20
; Both
	.db $20 	$20 	$20 	$20 	$20 	$20 	$20 	$20 	$1e 	$20
; Game finished
	.db $20 	$20 	$20 	$20 	$20 	$20 	$20 	$20 	$20 	$1f
/*
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw zelda_state0
	.dw zelda_state1

zelda_state0:
	ld a,$01
	ld (de),a ; [state]
	call interactionInitGraphics
	call objectSetVisiblec2

	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @initSubid00
	.dw @commonInit
	.dw @commonInit
	.dw @initSubid03
	.dw @initSubid04
	.dw @commonInitWithExtraGraphics
	.dw @commonInit
	.dw @initSubid07
	.dw @initSubid08
	.dw @commonInit
	.dw @initSubid0a

@initSubid04:
	call checkIsLinkedGame
	jp z,interactionDeleteAndUnmarkSolidPosition

	ld a,TREASURE_MAKU_SEED
	call checkTreasureObtained
	jp nc,interactionDeleteAndUnmarkSolidPosition

	ld a,GLOBALFLAG_PRE_BLACK_TOWER_CUTSCENE_DONE
	call checkGlobalFlag
	jp nz,interactionDeleteAndUnmarkSolidPosition

	ld h,d
	ld l,Interaction.speed
	ld (hl),SPEED_100
	ld l,Interaction.angle
	ld (hl),$08
	jp @commonInit

@initSubid03:
	ld bc,$4820
	call interactionSetPosition
	ld a,$01
	call interactionSetAnimation
	jp @commonInit

@initSubid07:
	ld a,GLOBALFLAG_GOT_RING_FROM_ZELDA
	call checkGlobalFlag
	jp z,interactionDeleteAndUnmarkSolidPosition

	ld a,TREASURE_MAKU_SEED
	call checkTreasureObtained
	jp c,interactionDeleteAndUnmarkSolidPosition
	ld a,GLOBALFLAG_SAVED_NAYRU
	call checkGlobalFlag

	ld a,(wEssencesObtained)
	add <TX_0605

@actAsGenericNpc:
	ld e,Interaction.textID
	ld (de),a
	inc e
	ld a,>TX_0600
	ld (de),a
	ld hl,mainScripts.genericNpcScript
	jp interactionSetScript

@initSubid08:
	call checkIsLinkedGame
	jp z,interactionDeleteAndUnmarkSolidPosition

	ld a,GLOBALFLAG_PRE_BLACK_TOWER_CUTSCENE_DONE
	call checkGlobalFlag
	jp z,interactionDeleteAndUnmarkSolidPosition

	ld a,GLOBALFLAG_FLAME_OF_DESPAIR_LIT
	call checkGlobalFlag
	jp nz,interactionDeleteAndUnmarkSolidPosition

	ld a,<TX_060b
	jr @actAsGenericNpc

@initSubid0a:
	call checkIsLinkedGame
	jp z,interactionDeleteAndUnmarkSolidPosition

	ld a,TREASURE_MAKU_SEED
	call checkTreasureObtained
	jp nc,interactionDeleteAndUnmarkSolidPosition

	ld a,GLOBALFLAG_PRE_BLACK_TOWER_CUTSCENE_DONE
	call checkGlobalFlag
	jp nz,interactionDeleteAndUnmarkSolidPosition

	ld a,<TX_060a
	jr @actAsGenericNpc

@initSubid00:
*/
zelda_subid00:
	call checkInteractionState
	jr nz,@state1

; added by ZTK
	ld a,$01
	ld (de),a ; [state]
	call interactionInitGraphics
	call objectSetVisiblec2
; vanilla code
	call getThisRoomFlags
	bit 7,a
	jr z,@commonInitWithExtraGraphics
	ld a,$01
	ld (wDisableScreenTransitions),a
	ld a,(wActiveMusic)
	or a
	jr z,@commonInitWithExtraGraphics
	xor a
	ld (wActiveMusic),a
	ld a,MUS_ZELDA_SAVED
	call playSound

@commonInitWithExtraGraphics:
	call interactionLoadExtraGraphics

@commonInit:
	call zelda_loadScript

/*
zelda_state1:
*/
@state1:
/*
	ld e,Interaction.subid;$42
	ld a,(de)
	rst_jumpTable
	.dw @animateAndRunScript
	.dw @animateAndRunScript
	.dw @runSubid2
	.dw @animateAndRunScript
	.dw @runSubid4
	.dw @animateAndRunScript
	.dw @animateAndRunScript
	.dw @faceLinkAndRunScript
	.dw @faceLinkAndRunScript
	.dw @animateAndRunScript
	.dw @faceLinkAndRunScript
*/
@animateAndRunScript:
	call interactionAnimate
	jp interactionRunScript
/*
@runSubid2:
	ld e,Interaction.var39
	ld a,(de)
	or a
	call z,interactionAnimate
	jp interactionRunScript

@runSubid4:
	call interactionRunScript
	jp nc,interactionAnimateBasedOnSpeed
	jp interactionDeleteAndUnmarkSolidPosition

@faceLinkAndRunScript:
	call interactionRunScript
	jp npcFaceLinkAndAnimate
*/
;;
zelda_loadScript:
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript

@scriptTable:
	.dw mainScripts.zeldaSubid00Script
/*
	.dw mainScripts.zeldaSubid01Script
	.dw mainScripts.zeldaSubid02Script
	.dw mainScripts.zeldaSubid03Script
	.dw mainScripts.zeldaSubid04Script
	.dw mainScripts.zeldaSubid05Script
	.dw mainScripts.zeldaSubid06Script
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript
	.dw mainScripts.zeldaSubid09Script
	.dw mainScripts.stubScript
*/