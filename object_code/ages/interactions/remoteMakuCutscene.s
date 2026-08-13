; ==================================================================================================
; INTERAC_REMOTE_MAKU_CUTSCENE
;
; Variables:
;   var3e: Doesn't do anything
;   var3f: Text to show
; ==================================================================================================
interactionCode8a:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1

@subid0:
@subid1:
	call checkInteractionState
	jr nz,@state1

@state0:
	call returnIfScrollMode01Unset
	ld a,(wPaletteThread_mode)
	cpa $00
	ret nz
	
	ld e,Interaction.subid
	ld a,(de)
	ld e,Interaction.var3d
	ld (de),a
	call @checkConditionsAndSetText
	call getThisRoomFlags
	and ROOMFLAG_40;$40
	jp nz,interactionDelete

	call @loadScript

@state1:
	call interactionRunScript
	jp c,interactionDelete
	ret

@checkConditionsAndSetText:
	ld e,Interaction.var03
	ld a,(de)
	rst_jumpTable
	.dw @val00 ; obtained Nayru's Gift 
	.dw @val01 ; obtained Din's Gift 
	.dw @val02 ; obtained Ghastly doll
	.dw @val03 ; obtained Rod of Seasons
	.dw @val04 ; pushed rock first time
	.dw @val05 ; obtained all 4 gems

@val00:
	lda $00
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn

	ld c,<TX_05b0
	jr +
@val01:
	lda $01
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn

	ld c,<TX_05b1
+
	ld b,$00
; Both essences obtained?	
	ld a,(wEssencesObtained)
	and $03
	cp $03
	jp nz,@setTextForScript
	ld c,<TX_05b2
	jp @setTextForScript

@val02:
	lda TREASURE_TRADEITEM
	call checkTreasureObtained
	jp nc,@deleteSelfAndReturn
	ldbc $00,<TX_05b3
	jp @setTextForScript

@val03:
	lda TREASURE_ROD_OF_SEASONS
	call checkTreasureObtained
	jp nc,@deleteSelfAndReturn
	ldbc $00,<TX_05b4
	jp @setTextForScript

@val04:
	lda GLOBALFLAG_PUSHED_ROCK_FIRST_TIME
	call checkGlobalFlag
	jp z,@deleteSelfAndReturn
	ldbc $00,<TX_05b5
	jp @setTextForScript

@val05:
	lda GLOBALFLAG_GOT_ALL_4_STONES
	call checkGlobalFlag
	jp nz,@deleteSelfAndReturn
	
	ld l,TREASURE_FIRST_STONE-1
-
	inc l
	ld a,l
	cpa TREASURE_LAST_STONE+1
	jr z,+

	call checkTreasureObtained
	jp nc,@deleteSelfAndReturn
	jr -
+
	lda GLOBALFLAG_GOT_ALL_4_STONES
	call setGlobalFlag
	ldbc $00,<TX_05b6
	jp @setTextForScript

/*	
	rst_jumpTable
	.dw @val00
	.dw @val01
	.dw @val02
	.dw @val03
	.dw @val04
	.dw @val05
	.dw @val06
	.dw @val07
	.dw @val08
	.dw @val09
	.dw @val0a
	.dw @val0b


@val00:
	xor a
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b0
	jp @setTextForScript

@val01:
	ldbc $00, <TX_05b1
	jp @setTextForScript

@val02:
	ld a,TREASURE_HARP
	call checkTreasureObtained
	jp nc,@deleteSelfAndReturn
	ldbc $00, <TX_05b2
	jp @setTextForScript

@val03:
	ld a,$01
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b3
	jp @setTextForScript

@val04:
	ld a,$02
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn

	ld hl,wPastRoomFlags+$76
	set 0,(hl)
	call checkIsLinkedGame
	ld a,GLOBALFLAG_CAN_BUY_FLUTE
	call z,setGlobalFlag
	ldbc $00, <TX_05b4
	jp @setTextForScript

@val05:
	ld a,$03
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b5
	jp @setTextForScript

@val06:
	ld a,GLOBALFLAG_MOBLINS_KEEP_DESTROYED
	call checkGlobalFlag
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b6
	jp @setTextForScript

@val07:
	ld a,$04
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b7
	jp @setTextForScript

@val08:
	ld a,$05
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b8
	jp @setTextForScript

@val09:
	ld a,$06
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05b9
	jp @setTextForScript

@val0a:
	ld a,$07
	call @checkEssenceObtained
	jp z,@deleteSelfAndReturn
	ldbc $00, <TX_05ba
	jp @setTextForScript

@val0b:
	ldbc $00, <TX_05bb
	jp @setTextForScript
*/

@deleteSelfAndReturn:
	pop af
	jp interactionDelete

@setTextForScript:
	ld h,d
	ld l,Interaction.var3e
	ld (hl),b
	inc l
	ld (hl),c
	ret

;;
; @param	a	Essence number
@checkEssenceObtained:
	ld hl,wEssencesObtained
	jp checkFlag


@initGraphicsAndIncState: ; Unused
	call interactionInitGraphics
	jp interactionIncState

@initGraphicsAndLoadScript: ; Unused
	call interactionInitGraphics

@loadScript:
	ld a,>TX_0500
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
	.dw mainScripts.remoteMakuCutsceneScript
	.dw mainScripts.remoteMakuCutsceneScript
