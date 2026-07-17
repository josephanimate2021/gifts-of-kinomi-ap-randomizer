; ==================================================================================================
; INTERAC_OLD_MAN
; ==================================================================================================
interactionCode52:
	ld e,Interaction.subid
	ld a,(de)
	cpa $02
	jr nc,@genericNpc
	.dw @subid00
	.dw @subid01
	.dw @subid02

; Old man in village library who does not trade 
@subid01:
; Old man who gives you the seed satchel
@subid02
	call checkInteractionState
	call z,@loadScriptAndInitGraphics
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate

@loadScriptAndInitGraphics:
	call interactionInitGraphics
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@oldManScriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp interactionIncState

; Old man in village library who trades the book for the labrynth key
@subid00:
	call checkInteractionState
	jr z,@@state0

@@state1:
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate

@@state0:
	ld a,>TX_0b00
	call interactionSetHighTextIndex

	ld e,Interaction.state
	ld a,$01
	ld (de),a

	ld e,Interaction.oamFlags
	ld a,$03
	ld (de),a

	callab getGameProgress_Ages
	ld a,$04
	cp b			;has trade item
	jr z,+
	ld h,d
	ld l,Interaction.subid
	inc (hl)
+
	jr @loadScriptAndInitGraphics


@oldManScriptTable:
	.dw mainScripts.oldManScript_givesLabrinthKey
	.dw mainScripts.oldManScript_noTrade
	.dw mainScripts.oldManScript_givesSeedSatchel

; Var03 is for different NPCs (sets collision,oam,animations)
; Subid then determines texts
; Subids 03 - 0b
@genericNpc:
	call checkInteractionState
	jr z,@@state0

@@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate

@@state0:
	ld a,$01
	ld (de),a

	ld hl,@oldManSubidAppearances
	call checkNpcAppear_seasons
	jp nz,interactionDelete

	call interactionInitGraphics

	ld hl,@oldManTextIndices
	call loadNpcText

; loads animation,oamFlags,collision
	ld e,Interaction.collisionRadiusX
	ld a,$06
	ld (de),a

	ld e,Interaction.var03
	ld a,(de)
	ld c,a
	add a
	add c
	ld hl,@baseVariables
	rst_addAToHl

	ld e,Interaction.collisionRadiusY
	ldi a,(hl)
	ld (de),a
	ld e,Interaction.oamFlagsBackup
	ldi a,(hl)
	ld (de),a
	inc e
	ld (de),a
	ld e,Interaction.var38
	ld a,(hl)
	ld (de),a
	call interactionSetAnimation
	call objectSetVisiblec2

	ld hl,mainScripts.oldManScript_generic
	jp interactionSetScript

; If subid matches to the game progress, then don't delete NPC
@oldManSubidAppearances:
	.dw @@var03_00
	.dw @@var03_01

@@var03_00:
	.db $03 $03 $03 $03
	.db $03 $04 $05 $05
	.db $05
@@var03_01:
	.db $03 $03 $03 $03
	.db $03 $04 $05 $05
	.db $05

@oldManTextIndices:
	.dw @@var03_00
	.dw @@var03_01

; First old man in woods house
@@var03_00:
	.db <TX_3302 ; 0x00 before quest
	.db <TX_3302 ; 0x01 got sword
	.db <TX_3302 ; 0x02 got bombs
	.db <TX_3302 ; 0x03 got boomerang
	.db <TX_3302 ; 0x04 got Rod of Seasons
	.db <TX_3305 ; 0x05 got flippers
	.db <TX_3307 ; 0x06 got feather
	.db <TX_3307 ; 0x07 got gift
	.db <TX_3307 ; 0x08 game finished

; Second old man in woods house
@@var03_01:
	.db <TX_3303 ; 0x00 before quest
	.db <TX_3303 ; 0x01 got sword
	.db <TX_3303 ; 0x02 got bombs
	.db <TX_3303 ; 0x03 got boomerang
	.db <TX_3303 ; 0x04 got Rod of Seasons
	.db <TX_3304 ; 0x05 got flippers
	.db <TX_3306 ; 0x06 got feather
	.db <TX_3306 ; 0x07 got gift
	.db <TX_3306 ; 0x08 game finished

; b0: collisionRadiusY
; b1: oamFlagsBackup
; b2: animation (can be thought of as direction to face?)
@baseVariables:
	.db $06 $02 $00 ;0x00
	.db $06 $01 $00 ;0x01
	;.db $06 $00 $00
	;.db $06 $01 $02

; [in] hl like @oldManSubidAppearances
; If subid matches to the game progress, then don't delete NPC
checkNpcAppear_seasons:
; checks if the subid should be deleted based on game progress
	ld e,Interaction.var03
	ld a,(de)
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	push hl
	callab agesInteractionsBank09.getGameProgress_Seasons
	pop hl
	ld a,b  ;game progress in b
	rst_addAToHl
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	ret 

; [in] hl like @oldManTextIndices
loadNpcText:
;loads text
	ld e,Interaction.var03
	ld a,(de)
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	ld a,b ;game progress in b
	rst_addAToHl
	ld a,(hl)

	ld e,Interaction.textID
	ld (de),a

	inc e ; Interaction.textID+1
	ld a,>TX_3300
	ld (de),a
	ret

/*
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @runSubid00
	.dw @runSubid01
	.dw @runSubid02
	.dw @runSubid03
	.dw @runSubid04
	.dw @runSubid05
	.dw @runSubid06
	.dw @runSubid07 ; Old man that gives Link seed satchel

; Old man who takes a secret to give you the shield (same spot as subid $02)
@runSubid00:
	ld a,>TX_0b00
	call interactionSetHighTextIndex
	call checkInteractionState
	jr nz,@@state1


@@state0:
	ld e,Interaction.state
	ld a,$01
	ld (de),a

	ld e,Interaction.oamFlags
	ld a,$03
	ld (de),a

	callab getGameProgress_Ages
	ld a,$04
	cp b			;has trade item
	jr z,+
	ld h,d
	ld l,Interaction.subid
	inc (hl)
+
	call @loadScriptAndInitGraphics
@@state1:
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate


; Old man who gives you book of seals
@runSubid01:
	call checkInteractionState
	call z,@loadScriptAndInitGraphics
	call interactionRunScript
	jp c,interactionDelete
	jp interactionAnimateAsNpc


; Old man guarding fairy powder in past (same spot as subid $00)
@runSubid02:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	jp nz,interactionDelete
	call @loadScriptAndInitGraphics

@@state1:
	call interactionAnimateAsNpc
	call interactionRunScript
	ret nc
	ld a,SND_TELEPORT
	call playSound
	ld hl,@warpDest
	jp setWarpDestVariables

@warpDest:
	m_HardcodedWarpA ROOM_AGES_5ec, $00, $17, $03


; Generic NPCs in the past library
@runSubid03:
@runSubid04:
@runSubid05:
@runSubid06:
	call checkInteractionState
	jr z,@@state0

@@state1:
	call interactionRunScript
	jp interactionAnimateAsNpc

@@state0:
	call interactionInitGraphics
	call interactionIncState

	ld l,Interaction.textID+1
	ld (hl),>TX_3300

	ld l,Interaction.collisionRadiusX
	ld (hl),$06
	ld l,Interaction.direction
	dec (hl)
*/
	/*
	ld a,GLOBALFLAG_WATER_POLLUTION_FIXED
	call checkGlobalFlag
	ld b,$00
	jr z,+
	inc b
+
	*/
/*
	ld e,Interaction.subid
	ld a,(de)
	sub $03
	ld c,a
	add a
;	add b
	ld hl,@textIndices
	rst_addAToHl
	ld e,Interaction.textID
	ld a,(hl)
	ld (de),a

	ld a,c
	add a
	add c
	ld hl,@baseVariables
	rst_addAToHl
	ld e,Interaction.collisionRadiusY
	ldi a,(hl)
	ld (de),a
	ld e,Interaction.oamFlagsBackup
	ldi a,(hl)
	ld (de),a
	inc e
	ld (de),a
	ld e,Interaction.var38
	ld a,(hl)
	ld (de),a
	call interactionSetAnimation
	call objectSetVisiblec2

	ld hl,mainScripts.oldManScript_generic
	jp interactionSetScript


; b0: collisionRadiusY
; b1: oamFlagsBackup
; b2: animation (can be thought of as direction to face?)
@baseVariables:
	.db $12 $02 $02
	.db $06 $00 $00
	.db $06 $00 $00
	.db $06 $01 $02

; The first and second columns are the text to show before and after the water pollution
; is fixed, respectively.
@textIndices:
	.db <TX_3300, <TX_3301
	.db <TX_3303, <TX_3303
	.db <TX_3304, <TX_3305
	.db <TX_3306, <TX_3307

@func_669d: ; Unused?
	call interactionInitGraphics
	jp interactionIncState

@loadScriptAndInitGraphics:
	call interactionInitGraphics
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp interactionIncState

@runSubid07:
	call checkInteractionState
	call z,@loadScriptAndInitGraphics
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate

@scriptTable:
	.dw mainScripts.oldManScript_givesLabrinthKey
	.dw mainScripts.oldManScriptSubid01
	.dw mainScripts.oldManScript_givesFairyPowder
	.dw 0
	.dw 0
	.dw 0
	.dw 0
	.dw mainScripts.oldManScript_givesSeedSatchel
*/