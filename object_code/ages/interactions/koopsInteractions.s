; ==============================================================================
; INTERAC_USED_ROD_OF_SEASONS
; ==============================================================================
interactionCodee7:
	ld a,(wMenuDisabled)
	ld b,a
	ld a,(wLinkDeathTrigger)
	or b
	jr nz,@seasonsTransition
	ld a,(wActiveGroup)
	cp $04
	jr nc,@inDungeon

	ld hl,wCurrentSeason
	ld a,(hl)
	inc a
	and $03
	ld (hl),a
	jr @seasonsTransition
@inDungeon:
;moving between floors
	ld a,(wDungeonFloor)
	ld hl,wDungeonVisitedFloors+$04		;Seasons Shrine
	call @findingVisitedFloor

@foundNextFloor:
	ld c,a
	ld a,GLOBALFLAG_D3_CRYSTALS
	call checkGlobalFlag
	ld a,c
	jr nz,@setDungeonWarp
	;if not all crystals are broken, skip room $41 (winter)
	ld a,(wActiveRoom)
	cp $2d
	ld a,c
	ld hl,wDungeonVisitedFloors+$04		;Seasons Shrine
	call z,@findingVisitedFloor
@setDungeonWarp:
	ld (wDungeonFloor),a

	call getActiveRoomFromDungeonMapPosition
	ld c,$00
	ld (wWarpDestRoom),a

	ld a,(wActiveGroup)
	add c
	or $80
	ld (wWarpDestGroup),a

	ld a,(wActiveTilePos)
	ld (wWarpDestPos),a

	ld a,$00
	ld (wWarpTransition),a

	ld a,$03
	ld (wWarpTransition2),a

@seasonsTransition:
	ld a,SND_ENERGYTHING
	call playSound
	ld a,$02
	ld (wPaletteThread_updateRate),a
	call fadeoutToWhite
	jp interactionDelete

@findingVisitedFloor:
	dec a
	and $03
	ld b,a
	call checkFlag
	ld a,b
	ret nz
	jr @findingVisitedFloor

; ==============================================================================
; INTERAC_HEROS_CAVE_SWORD_CHEST
; ==============================================================================
interactionCodee8:
	ld e,Interaction.state		;$44
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3
	.dw @state4
@state0:
	ld a,$01
	ld (de),a
	ld (wcca1),a		;$ccbb
	jp interactionInitGraphics
@state1:
	;check if Link has opened the chest
	ld a,(wcca2)		;$ccbc
	or a
	ret z
	;disables objects
	ld a,$81
	ld (wDisableLinkCollisionsAndMenu),a	;$cbca
	ld (wDisabledObjects),a					;$cca4
	call interactionIncState
	call interactionSetAlwaysUpdateBit	;sets h to d (high byte of interaction location)
	ld l,Interaction.speedY					;$50
	ld (hl),$0a
	ld l,Interaction.counter1				;$46
	ld (hl),$20
	jp objectSetVisible80
@state2:
	;decreases counter from $20 until 0 (waits $20 frames)
	call interactionDecCounter1
	jp nz,objectApplySpeed
	call interactionIncState
	;gives Link the sword (level 1) - simulates the chest opening
	ld a,TREASURE_SWORD
	ld c,$01				;level of sword
	call giveTreasure
	ld a,SND_GETITEM		;$4c
	call playSound
	ld bc,TX_001c
	jp showText
@state3:
	ld a,(wTextIsActive)	;$cba0
	or a
	ret nz
	call interactionIncState
	call objectSetInvisible
	ld e,Interaction.counter1	;$46
	ld a,$5a					;wait 90 frames
	ld (de),a
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_TREASURE
	inc l
	ld (hl),TREASURE_SWORD
	inc l
	ld (hl),$03
	ld a,($d00b)				;treasure interaction - yh
	ld l,Interaction.yh			;$4b
	ldi (hl),a
	inc l
	ld a,($d00d)				;treasure interaction - xh
	ld (hl),a
	ld a,SNDCTRL_MEDIUM_FADEOUT	;$fb
	jp playSound
@state4:
	call interactionDecCounter1
	ret nz
	call getThisRoomFlags
	set ROOMFLAG_BIT_ITEM,(hl)
	ld hl,@warpDestVariables
	call setWarpDestVariables
	ld a,SND_FADEOUT				;$b4
	call playSound
	jp interactionDelete
@warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_003 $0e $16 $83

; ==============================================================================
; INTERAC_MISC_STATIC_OBJECTS
; ==============================================================================
interactionCodee4:
	;ld e,Interaction.subid
	;ld a,(de)
	;rst_jumpTable
	;.dw @subid0
	;.dw @subid1
	;.dw @subid2
	;.dw @subid3
	;.dw
	jr +

	call @func_72de
	jp objectSetVisible80
	call @func_72de
	jp objectSetVisible81
+
;@subid0:
;@subid1:
;@subid2:
;@subid3:
	call @func_72de
	jp objectSetVisible83
@func_72de:
	call checkInteractionState
	jr nz,+
	ld a,$01
	ld (de),a
	jp interactionInitGraphics
+
	pop hl
	jp interactionAnimate


; ==============================================================================
; INTERAC_QUICKSAND
; ==============================================================================
interactionCodee9:
	call returnIfScrollMode01Unset

	ld a,>ROOM_AGES_120
	ld b,<ROOM_AGES_120
	call getRoomFlags
	and ROOMFLAG_LAYOUTSWAP
	jp z,interactionDelete

	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
@state0:
	ld a,$01
	ld (de),a
@state1:
	ld a,$21
	call objectSetCollideRadius
	call findItemDropAddress
	call findPirateSkullAddress
	call findBombOrScentSeedAddress
	ld a,(w1Link.state)
	cp LINK_STATE_NORMAL
	ret nz
	ld a,(w1Link.zh)
	or a
	ret nz
	ld bc,$2105
	call @checkLinkWithinAPartOfQuicksand
	ret nc
	ld a,QUICKSAND_RING
	call cpActiveRing
	jr z,+
	call objectGetAngleTowardLink
	xor ANGLE_DOWN
	ld c,a
	ld b,SPEED_80		;$14
	call updateLinkPositionGivenVelocity
+
	call matchSkullNumberWithSubid
	ld bc,$0300
	call @checkLinkWithinAPartOfQuicksand
	ret nc
; If subid $00, respawn Link
	ld e,Interaction.subid
	ld a,(de)
	or a
	ld a,$01
	jr z,@respawnLink
; Initiate warp
	call dropLinkHeldItem
	call clearAllParentItems
	ld h,d
	ld l,Interaction.state
	ld (hl),$02
; Puts bit 7 (subid matched) into counter2
	ld a,(wcca7)
	and $7f
	ld l,Interaction.counter2
	ldd (hl),a      ;Interaction.counter1
	ld (hl),60
	ld a,$03
@respawnLink:
	ld (wLinkStateParameter),a
	ld a,LINK_STATE_RESPAWNING
	ld (wLinkForceState),a
	ld hl,w1Link.yh
	jp objectCopyPosition
@state2:
	call interactionDecCounter1
	ret nz

	ld e,Interaction.subid
	ld a,(de)
	dec a

	ld c,a
	add a
	add c
	ld hl,@warpDestLocations
	rst_addAToHl
	ldi a,(hl)
	ld (wWarpDestGroup),a
	ldi a,(hl)
	ld (wWarpDestRoom),a
	ldi a,(hl)
	ld (wWarpDestPos),a
	ld a,TRANSITION_DEST_FALL
	ld (wWarpTransition),a
; Fadeout
	ld a,$03
	ld (wWarpTransition2),a
	jp interactionDelete
@warpDestLocations:
	.db $80|(>ROOM_AGES_470), <ROOM_AGES_46b, $87 ; 473 $23
	.db $80|(>ROOM_AGES_472), <ROOM_AGES_472, $67 ;
	.db $80|(>ROOM_AGES_475), <ROOM_AGES_475, $34 ;
	.db $80|(>ROOM_AGES_476), <ROOM_AGES_476, $52 ;
	.db $80|(>ROOM_AGES_479), <ROOM_AGES_479, $97 ;
	.db $80|(>ROOM_AGES_47a), <ROOM_AGES_47a, $85 ;


; Param			b		Radius Y collision
; Param			c		Radius X collision
; Param[out]	c-flag	Set if Link HAS collided
@checkLinkWithinAPartOfQuicksand:
	ld h,d
	ld l,Interaction.collisionRadiusY
	ld (hl),b
	inc l
	ld (hl),b
	ld a,(w1Link.yh)
	add c
	ld b,a
	ld a,(w1Link.xh)
	ld c,a
	jp interactionCheckContainsPoint

; Set bit 7 of wPirateSkullRandomNumber if that value and subid match
matchSkullNumberWithSubid:
	ld hl,wcca7
	ld a,(hl)
	or a
	ret z
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	ret nz
	set 7,(hl)
	ret

; Checks for Pirate Skull, Bomb, Used Scent Seed, or Item Drop to pull into the center
findPirateSkullAddress:
	ld c,INTERAC_USED_ROD_OF_SEASONS		;INTERAC_PIRATE_SKULL
	call objectFindSameTypeObjectWithID
	ret nz
	ld l,Interaction.zh
	ld e,Interaction.var3a
	jr moveObjectIfGrounded
findItemDropAddress:
	ld h,$d0
-
	ld l,Part.id
	ld a,(hl)
	cp PARTID_ITEM_DROP
	call z,objectIsPart
	inc h
	ld a,h
	cp $e0
	jr c,-
	ret

; Object is a part
objectIsPart:
	ld l,Part.zh
	ld e,Part.var31

; Param     hl      Object.zh
; Param     e       Object's yh variable to tell it to move toward quicksand
moveObjectIfGrounded:
; Checks if object is in the air
	ldd a,(hl)
	rlca
	ret c
	dec l
	ld c,(hl)		;Object.xh
	dec l
	dec l
	ld b,(hl)		;Object.yh
	ld l,e			;hl = Object.var3a or var31
	push hl
; Ret if object has not collided with quicksand
	call interactionCheckContainsPoint
	pop hl
	ret nc

	call objectGetPosition
	ld (hl),b
	inc l
	ld (hl),c
	ret

findBombOrScentSeedAddress:
	ld c,ITEM_BOMB
	call findItemWithID
	call z,objectIsItem
	ld c,ITEM_BOMB
	call findItemWithID_startingAfterH
	call z,objectIsItem
	ld c,ITEM_SCENT_SEED
	call findItemWithID
	ret nz

; Object is an item
objectIsItem:
	ld l,Item.zh
	ld e,Item.var31
	jr moveObjectIfGrounded

; ==============================================================================
; INTERAC_SOMARIA_BLOCK
;
; Loads Cane of Somaria blocks at interaction's position
; ==============================================================================
interactionCodeea:
	call checkInteractionState
	jr z,@spawnBlock

; waiting for block to despawn
@state1:
	ld a,ObjectStruct.id
	call objectGetRelatedObject1Var
; if subid is $00, then respawn the block
	ld a,(hl)
	or a
	ret nz

	ld e,Interaction.state
	ld (de),a
	ret

; state 0
@spawnBlock:
	push de
	ld de,w1Link.yh
	call getShortPositionFromDE
	pop de
	ld e,Interaction.var03
	ld (de),a
	call objectGetShortPosition
	ld b,a
	ld e,Interaction.var03
	ld a,(de)
	cp b
	ret z

	call getFreeItemSlot
	ret nz
;	ld l,Item.start
	inc (hl)
	inc l
	ld (hl),ITEM_18
	call objectCopyPosition

	ld e,Interaction.relatedObj1
	ld a,Item.start
	ld (de),a
	inc e
	ld a,h
	ld (de),a
	; Set Y/X of the new item as calculated earlier, and copy Link's Z position
	jp interactionIncState



; ==============================================================================
; INTERAC_SPRINGBLOOM_FLOWER
; ==============================================================================
interactionCodeeb:
	ld e,Interaction.state
	ld a,(de)
	;ld b,b
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3
	.dw @state4
	.dw @state5
	.dw @state6
	.dw @state7
@state0:
	ld a,$01
	ld (de),a
	ld a,(wCurrentSeason) ; wRoomStateModifier
	cp SEASON_SPRING ; or a
	jp nz,interactionDelete
	ld a,$06
	call objectSetCollideRadius
	call interactionInitGraphics
	call objectSetVisible83
@state1:
	ld a,(wcca7) ; wUnknown
	or a
	jr z,+
	ld a,$05
	jr ++
+
	ld a,(wWarpsDisabled)
	or a
	ret nz
	ld a,(wLinkObjectIndex)
	rrca ; nonzero if riding an animal, minecart
	ret c
	call objectCheckCollidedWithLink
	ret nc
	ld a,$02
	ld (wcca7),a ; wUnknown
++
	ld e,Interaction.state
	ld (de),a
	ld a,$01
	jp interactionSetAnimation
@state2:
	call interactionAnimate
	ld e,Interaction.animParameter ; $61
	ld a,(de)
	or a
	ret z
	ld a,(wLinkObjectIndex)
	cp $d0 ; nonzero if riding an animal, minecart
	jp nz,seasonsFunc_0a_5d18
	call checkLinkID0AndControlNormal
	jp nc,seasonsFunc_0a_5d18
	call objectCheckCollidedWithLink
	jp nc,seasonsFunc_0a_5d18
	ld e,Interaction.state ; $44
	ld a,$03
	ld (de),a
	call clearAllParentItems
	call dropLinkHeldItem
	call resetLinkInvincibility
	ld a,$83
	ld (wDisabledObjects),a
	ld (wWarpsDisabled),a
	call setLinkForceStateToState08
	call interactionSetAlwaysUpdateBit
	xor a
	ld e,Interaction.animParameter ; $61
	call func_5cf2
	ld e,Interaction.xh ; $4d
	ld a,(de)
	ld (w1Link.xh),a ; $d00d
	xor a
	ld (w1Link.zh),a ; $d00f
	ld a,SND_BOMB_LAND ; $52
	call playSound
	ld a,$02
	jp interactionSetAnimation
@state3:
	ld a,$10
	ld (wcc50),a
	call interactionAnimate
	ld e,Interaction.animParameter ; $61
	ld a,(de)
	inc a
	jr z,@func_5ca0
	cp $02
	call nc,func_5cf2
	ret
@func_5ca0:
	ld a,$06
	call func_5cf2
	xor a
	ld (wDisabledObjects),a
	ld e,Interaction.state
	ld a,$04
	ld (de),a
	ld a,LINK_STATE_06
	ld (wLinkForceState),a
	jp objectSetVisible83
@state4:
@state7:
	call interactionAnimate
	ld e,Interaction.animParameter ; $61
	ld a,(de)
	inc a
	ret nz
	jr seasonsFunc_0a_5d18
@state5:
	call interactionAnimate
	ld e,Interaction.animParameter ; $61
	ld a,(de)
	or a
	ret z
	ld a,SND_BOMB_LAND
	call playSound
	call interactionIncState
	ld a,$02
	jp interactionSetAnimation
@state6:
	call interactionAnimate
	ld e,Interaction.animParameter ; $61
	ld a,(de)
	inc a
	jr nz,@func_5ce8
	ld (de),a
	ld (wcca7),a
	call objectSetVisible83
	jp interactionIncState
@func_5ce8:
	dec a
	ld (wcca7),a
	cp $02
	ret c
	jp objectSetVisible82
func_5cf2:
	ld hl,table_5d08
	rst_addDoubleIndex
	xor a
	ld (de),a
	ld e,Interaction.yh ; $4b
	ld a,(de)
	add (hl)
	ld (w1Link.yh),a ; $d00b
	inc hl
	ld e,Interaction.visible ; $5a
	ld a,(de)
	and $f0
	or (hl)
	ld (de),a
	ret
table_5d08:
	; yh - xh
	.db $f9 $03
	.db $f9 $03
	.db $f8 $03
	.db $f9 $01
	.db $fa $01
	.db $ff $01
	.db $f0 $01
	.db $00 $01

seasonsFunc_0a_5d18:
	ld e,Interaction.state ; $44
	ld a,$01
	ld (de),a
	dec a
	ld (wcca7),a ; WUnknown
	call interactionSetAlwaysUpdateBit
	res 7,(hl)
	call objectSetVisible83
	ld a,$00
	jp interactionSetAnimation
