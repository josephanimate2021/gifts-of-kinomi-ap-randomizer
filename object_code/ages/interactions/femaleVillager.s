; ==================================================================================================
; INTERAC_FEMALE_VILLAGER
; ==================================================================================================
interactionCode3b:
	call checkInteractionState
	jr z,@state0

@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate
	;jp interactionAnimateAsNpc

@state0:
	call interactionIncState
	ld a,$06
	call objectSetCollideRadius
	call interactionInitGraphics
	call objectMarkSolidPosition
	call objectSetVisiblec2

; Whether to delete
	ld e,Interaction.subid
	ld a,(de)
	cp $04 ; number of woman subids + 1
	jr nc,+
	callab agesInteractionsBank09.getGameProgress_Ages
	ld hl,@womanSubidAppearances
	jr ++
+
	callab agesInteractionsBank09.getGameProgress_Seasons
	ld hl,@galSubidAppearances
++
	ld a,b ; game progress in b
	rst_addAToHl
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	jp nz,interactionDelete

; Scripts
; a == [subid]
	ld hl,@scripts
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript

@womanSubidAppearances:
	.db $00 $00 $00 $01
	.db $01 $01 $01 $02
	.db $02 $03
@galSubidAppearances:
	.db $04 $04 $04 $05
	.db $05 $06 $06 $06
	.db $06 $07

@scripts:
	.dw mainScripts.woman_subid0Script ; ROOM_AGES_004
	.dw mainScripts.woman_subid1Script ; ROOM_AGES_023
	.dw mainScripts.woman_subid2Script ; ROOM_AGES_004
	.dw mainScripts.woman_subid3Script ; ROOM_AGES_214 | ROOM_AGES_208
	.dw mainScripts.gal_subid0Script ; ROOM_AGES_014
	.dw mainScripts.gal_subid1Script ; ROOM_AGES_004
	.dw mainScripts.gal_subid2Script ; ROOM_AGES_024
	.dw mainScripts.gal_subid3Script ; ROOM_AGES_014 | ROOM_AGES_214













/*
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	ld a,$01
	ld (de),a

	call interactionInitGraphics
	call objectSetVisiblec2
	call @initSubid

	ld e,Interaction.enabled
	ld a,(de)
	or a
	jp nz,objectMarkSolidPosition
	ret

@initSubid:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @initSubid00
	.dw @initSubid01
	.dw @initSubid02
	.dw @initSubid03
	.dw @initSubid04
	.dw @initSubid05
	.dw @initSubid06
	.dw @initSubid07
	.dw @initSubid08

@initSubid00:
	ld a,$01
	jp interactionSetAnimation

@initSubid01:
@initSubid02:
	callab agesInteractionsBank09.getGameProgress_1
	ld c,$01
	xor a
	call checkNpcShouldExistAtGameStage
	jp nz,interactionDelete

	ld a,b
	ld hl,@subid1And2ScriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp objectSetVisible82

@initSubid03:
@initSubid04:
	callab agesInteractionsBank09.getGameProgress_2
	ld c,$03
	ld a,$01
	call checkNpcShouldExistAtGameStage
	jp nz,interactionDelete

	ld a,b
	ld hl,@subid3And4ScriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp objectSetVisible82

@initSubid05:
	ld a,$01
	ld e,Interaction.oamFlags
	ld (de),a
	callab agesInteractionsBank09.getGameProgress_2
	ld c,$05
	ld a,$02
	call checkNpcShouldExistAtGameStage
	jp nz,interactionDelete

	ld a,b
	ld hl,@subid5ScriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp objectSetVisible82

@initSubid07:
	ld a,GLOBALFLAG_WATER_POLLUTION_FIXED
	call checkGlobalFlag
	ld a,<TX_1526
	jr z,+
	ld a,<TX_1527
+
	ld e,Interaction.textID
	ld (de),a

	inc e
	ld a,>TX_1500
	ld (de),a

	xor a
	call interactionSetAnimation

	ld hl,mainScripts.villagerGalSubid07Script
	jp interactionSetScript

@initSubid08:
	ld e,Interaction.textID
	ld a,<TX_0f03
	ld (de),a
	inc e
	ld a,>TX_0f03
	ld (de),a

	ld hl,mainScripts.genericNpcScript
	jp interactionSetScript

@initSubid06:
	ld a,$05
	ld e,Interaction.var3f
	ld (de),a
	ld hl,mainScripts.linkedGameNpcScript
	call interactionSetScript
	call interactionRunScript

@state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @runSubid00
	.dw @runScriptAndAnimateFacingLink
	.dw @runScriptAndAnimateFacingLink
	.dw @runScriptAndAnimateFacingLink
	.dw @runScriptAndAnimateFacingLink
	.dw @runScriptAndAnimateFacingLink
	.dw @runSubid06
	.dw @runSubid07
	.dw @runScriptAndAnimateFacingLink


; Cutscene where guy is struck by lightning in intro
@runSubid00:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2
	.dw @@substate3
	.dw @@substate4

@@substate0:
	ld a,($cfd1)
	cp $02
	jp nz,interactionAnimate

	call interactionIncSubstate
	ld l,Interaction.xh
	ld a,(hl)
	ld l,Interaction.var3d
	ld (hl),a
	ret

@@substate1:
	callab interactionOscillateXRandomly
	ld a,($cfd1)
	cp $04
	ret nz

	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),$1e
	ret

@@substate2:
	call interactionDecCounter1
	ret nz

	ld bc,-$1c0
	call objectSetSpeedZ
	ld a,SND_JUMP
	call playSound
	jp interactionIncSubstate

@@substate3:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz

	call interactionIncSubstate
	jp @loadScript

@@substate4:
	call interactionAnimate2Times
	call interactionRunScript
	ret nc
	jp interactionDelete


; Generic NPCs
@runScriptAndAnimateFacingLink:
	call interactionRunScript
	jp npcFaceLinkAndAnimate

; Linked game NPC
@runSubid06:
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate

; NPC in eyeglasses library (present)
@runSubid07:
	call interactionRunScript
	jp interactionAnimateAsNpc


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
	.dw mainScripts.villagerGalSubid00Script
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript
	.dw mainScripts.stubScript

@subid1And2ScriptTable:
	.dw mainScripts.villagerGalSubid1And2Script_befored3
	.dw mainScripts.villagerGalSubid1And2Script_afterd3
	.dw mainScripts.villagerGalSubid1And2Script_afterNayruSaved
	.dw mainScripts.villagerGalSubid1And2Script_afterd7
	.dw mainScripts.villagerGalSubid1And2Script_afterGotMakuSeed
	.dw mainScripts.villagerGalSubid1And2Script_postGame

@subid3And4ScriptTable:
	.dw mainScripts.villagerGalSubid3And4Script_befored2
	.dw mainScripts.villagerGalSubid3And4Script_afterd2
	.dw mainScripts.villagerGalSubid3And4Script_afterd4
	.dw mainScripts.villagerGalSubid3And4Script_afterNayruSaved
	.dw mainScripts.villagerGalSubid3And4Script_afterd7
	.dw mainScripts.villagerGalSubid3And4Script_afterGotMakuSeed
	.dw mainScripts.villagerGalSubid3And4Script_twinrovaKidnappedZelda
	.dw mainScripts.villagerGalSubid3And4Script_postGame

@subid5ScriptTable:
	.dw mainScripts.villagerGalSubid05Script_befored2
	.dw mainScripts.villagerGalSubid05Script_afterd2
	.dw mainScripts.villagerGalSubid05Script_afterd4
	.dw mainScripts.villagerGalSubid05Script_afterNayruSaved
	.dw mainScripts.villagerGalSubid05Script_afterd7
	.dw mainScripts.villagerGalSubid05Script_afterd7
	.dw mainScripts.villagerGalSubid05Script_twinrovaKidnappedZelda
	.dw mainScripts.villagerGalSubid05Script_twinrovaKidnappedZelda ; Not used
*/