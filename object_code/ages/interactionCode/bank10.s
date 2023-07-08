m_section_free Ages_Interactions_Bank10 NAMESPACE agesInteractionsBank10

; ==============================================================================
; INTERACID_MISCELLANEOUS_2
; ==============================================================================
interactionCodedc:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw _interactiondc_subid00
	.dw _interactiondc_subid01
	.dw _stub
	.dw _stub
	.dw _stub
	.dw _interactiondc_subid05
	.dw _stub
	.dw _interactiondc_subid07
	.dw _interactiondc_subid08
	.dw _stub
	.dw _stub
	.dw _interactiondc_subid0B
	.dw _interactiondc_subid0C
	.dw _interactiondc_subid0D
	.dw _stub
	.dw _interactiondc_subid0F
	.dw _interactiondc_subid10
	.dw _interactiondc_subid11
	.dw _interactiondc_subid12
	.dw _interactiondc_subid13
	.dw _interactiondc_subid14
	.dw _interactiondc_subid15
	.dw _interactiondc_subid16
	.dw _interactiondc_subid17
	.dw _interactiondc_subid18
	.dw _interactiondc_subid19
	.dw _interactiondc_subid1a

; Heart piece spawner
_interactiondc_subid07:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete
	ld bc,TREASURE_HEART_PIECE_SUBID_00
	call createTreasure
	call objectCopyPosition
_stub:
	jp interactionDelete


; Replaces a tile at a position with a given value when destroyed
_interactiondc_subid08:
	call checkInteractionState
	jr z,@state0

@state1:
	ld e,Interaction.yh
	ld a,(de)
	ld c,a

	ld b,>wRoomLayout
	ld a,(bc)		;tile index
	ld l,a			;tile index
	ld e,Interaction.var03
	ld a,(de)		;var03 tile index
	cp l
	ret z			;ret if these two indices are the same

	call getThisRoomFlags
	ld e,Interaction.xh
	ld a,(de)
	or (hl)
	ld (hl),a		;set xh room flag when two indices are different
	jp interactionDelete

@state0:
	call getThisRoomFlags
	ld e,Interaction.xh
	ld a,(de)
	and (hl)
	jp nz,interactionDelete

	ld e,Interaction.yh
	ld a,(de)
	ld c,a
	ld b,>wRoomLayout
	ld a,(bc)
	ld e,Interaction.var03
	ld (de),a
	jp interactionIncState


; Graveyard key spawner
_interactiondc_subid00:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete
	ld a,(wNumTorchesLit)
	cp $02
	ret nz
	ld bc,TREASURE_GRAVEYARD_KEY_SUBID_00
	call createTreasure
	call objectCopyPosition
	jp interactionDelete


; Graveyard gate opening cutscene
_interactiondc_subid01:
	call checkInteractionState
	jp nz,interactionRunScript
	call getThisRoomFlags
	and $80
	jp nz,interactionDelete
  
	ld hl,mainScripts.interactiondcSubid01Script
	call interactionSetScript
	call interactionSetAlwaysUpdateBit
	jp interactionIncState




; Makes screen shake before tuni nut is restored
_interactiondc_subid05:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	ld a,GLOBALFLAG_TUNI_NUT_PLACED
	call checkGlobalFlag
	jp nz,interactionDelete

	call returnIfScrollMode01Unset

	ld a,SNDCTRL_STOPSFX
	call playSound

	ld a,$01
	ld (wScreenShakeMagnitude),a

	call @setRandomShakeDuration
	ld a,(wFrameCounter)
	rrca
	call c,interactionIncState
	jp interactionIncState

@state1:
	xor a
	call @shakeScreen
	ret nz
	call @setRandomShakeDuration
	jp interactionIncState

@state2:
	ld a,(wFrameCounter)
	and $0f
	ld a,SND_RUMBLE
	call z,playSound
	ld a,$08
	call @shakeScreen
	ret nz
	ld l,Interaction.state
	ld (hl),$01

@setRandomShakeDuration:
	call getRandomNumber
	and $7f
	sub $40
	add $60
	ld e,Interaction.counter1
	ld (de),a
	ret

@shakeScreen:
	call setScreenShakeCounter
	ld a,(wFrameCounter)
	rrca
	ret c
	jp interactionDecCounter1





; Handles floor falling in King Moblin's castle
_interactiondc_subid0B:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3

@state0:
	ld a,$01
	ld (de),a
	ld a,$18
	call objectSetCollideRadius
	ld hl,@listOfTilesToBreak
	jp interactionSetMiniScript

@state1:
	call objectCheckCollidedWithLink_ignoreZ
	ret nc
	call checkLinkCollisionsEnabled
	ret nc

	ld a,DISABLE_LINK
	ld (wDisabledObjects),a

	ld a,SND_CLINK
	call playSound

	ld hl,w1Link
	call objectTakePosition

	ld e,Interaction.counter1
	ld a,30
	ld (de),a

	ld bc,$f808
	call objectCreateExclamationMark
	jp interactionIncState

@state2:
	call interactionDecCounter1
	ret nz
	ld (hl),30 ; [counter1]
	xor a
	ld (wDisabledObjects),a
	jp interactionIncState

@state3:
	call interactionDecCounter1
	ret nz
	ld (hl),$07 ; [counter1]

	call interactionGetMiniScript
	ldi a,(hl)
	ld c,a
	call interactionSetMiniScript
	ld a,c
	or a
	jp z,interactionDelete

	ld a,TILEINDEX_WARP_HOLE
	jp breakCrackedFloor

@listOfTilesToBreak:
	.db $67 $66 $65 $64 $63 $62 $61 $51
	.db $41 $31 $21 $11 $12 $13 $23 $33
	.db $43 $44 $45 $46 $47 $48 $38 $28
	.db $18 $17 $16 $00


; Bridge handler in Rolling Ridge past (subid 0c) and present (subid 0d)
_interactiondc_subid0C:
_interactiondc_subid0D:
	call checkInteractionState
	jr z,@state0

@state1:
	ld a,(wActiveTriggers)
	or a
	ret z

	ld e,Interaction.subid
	ld a,(de)
	sub $0c
	ld bc,$0801
	ld e,$56
	jr z,++
	ld bc,$0603
	ld e,$28
++
	call getFreePartSlot
	ret nz
	ld (hl),PARTID_BRIDGE_SPAWNER
	ld l,Part.counter2
	ld (hl),b
	ld l,Part.angle
	ld (hl),c
	ld l,Part.yh
	ld (hl),e

	call getThisRoomFlags
	set 7,(hl)

	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete

@state0:
	call getThisRoomFlags
	and $80
	jp nz,interactionDelete
	jp interactionIncState





; Shows text upon entering a room (only used for sea of no return entrance and black tower turret)
_interactiondc_subid0F:
	call checkInteractionState
	jr z,@state0
	call objectCheckCollidedWithLink_notDead
	ret nc

	ld bc,TX_120a
	ld a,(wActiveRoom)
	cp $d0
	jr nz,@showText
	ld bc,TX_0209
@showText:
	call showText
	jp interactionDelete

@state0:
	ld a,(wScrollMode)
	and $02
	jp z,interactionDelete
	ld a,(w1Link.yh)
	cp $78
	jp c,interactionDelete
	ld a,$08
	call objectSetCollideRadius
	jp interactionIncState


; [edited for Room 026]
; Black tower entrance handler: warps Link to different variants of black tower.
_interactiondc_subid10:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	ld hl,wRoomLayout+$51
	xor a
	ldi (hl),a
	ld (hl),a

	ld bc,$0408	;$0410
	call objectSetCollideRadii

	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	call nc,interactionIncState
	jp interactionIncState

@state1:
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret c
	jp interactionIncState

@state2:
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc
	call checkLinkVulnerable
	ret nc

	ld e, Interaction.var03
	ld a,(de)
	or a
	jr nz,@@Room87
@@Room26:
	ld a,(wCurrentSeason)
	cp SEASON_WINTER
	ld hl,@@warp1
	jr z,+
	ld hl,@@warp2
+
	call setWarpDestVariables
	ld a,SND_ENTERCAVE
	call playSound
	jp interactionDelete

@@warp1:
	m_HardcodedWarpA ROOM_AGES_339, $93, $ff, $01
@@warp2:
	m_HardcodedWarpA ROOM_AGES_338, $93, $ff, $01


@@Room87:
	ld a,(wCurrentSeason)
	ld c,$05
	call multiplyAByC
	ld bc,@@summerWarp
	add hl,bc
	rst_addAToHl

	call setWarpDestVariables
	ld a,SND_ENTERCAVE
	call playSound
	jp interactionDelete

@@summerWarp:
	m_HardcodedWarpA ROOM_AGES_52a, $93, $91, $03
@@fallWarp:
	m_HardcodedWarpA ROOM_AGES_52d, $93, $91, $03
@@winterWarp:
	m_HardcodedWarpA ROOM_AGES_53d, $93, $91, $03
@@springWarp:
	m_HardcodedWarpA ROOM_AGES_514, $93, $91, $03	



; Gives D6 Past boss key when you get D6 Present boss key
; Sets wDungeonBossKeys,wDungeonCompasses, or wDungeonMaps
; according to Y (0-2)
;
_interactiondc_subid11:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	ret z
	ld hl,wDungeonBossKeys
	ld e,Interaction.yh
	ld a,(de)
	rst_addAToHl

	ld b,$02
	ld a,(wDungeonIndex)
	cp b
	jr nz,+
	ld b,$0b
+
	ld a,b
	jp setFlag


; Bridge handler for cave leading to Tingle
_interactiondc_subid12:
	call getThisRoomFlags
	and $40
	jp nz,interactionDelete

	ld a,(wToggleBlocksState)
	or a
	ret z

	call getFreePartSlot
	ret nz
	ld (hl),PARTID_BRIDGE_SPAWNER
	ld l,Part.counter2
	ld (hl),$0c
	ld l,Part.angle
	ld (hl),$01
	ld l,Part.yh
	ld (hl),$13

	call getThisRoomFlags
	set 6,(hl)

	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete


; Makes lava-waterfall an d4 entrance behave like lava instead of just a wall, so that the fireballs
; "sink" into it instead of exploding like on land.
_interactiondc_subid13:
	call returnIfScrollMode01Unset
	ld a,TILEINDEX_OVERWORLD_LAVA_1 ; TODO
	ld hl,wRoomLayout+$14
	ldi (hl),a
	ld (hl),a
	ld l,$24
	ldi (hl),a
	ld (hl),a
	ld l,$34
	ldi (hl),a
	ld (hl),a
	jp interactionDelete


; Spawns portal to final dungeon from maku tree
_interactiondc_subid14:
	call objectGetTileAtPosition
	cp $ed ; TODO
	ret nz
	call getThisRoomFlags
	set ROOMFLAG_BIT_80,(hl)
	ld b,INTERACID_DECORATION
	call objectCreateInteractionWithSubid00
@delete:
	jp interactionDelete



; Sets present sea of storms chest contents (changes if linked)
_interactiondc_subid15:
	call checkInteractionState
	jr z,_interactiondc_subid15And16_state0

@state1:
	call checkIsLinkedGame
	ld a,$01
	jr nz,_interactiondc_subid15And16_setChestContents
	dec a

_interactiondc_subid15And16_setChestContents:
	ld hl,@chestContents
	rst_addDoubleIndex
	ldi a,(hl)
	ld (wChestContentsOverride),a
	ld a,(hl)
	ld (wChestContentsOverride+1),a
	jp interactionDelete

@chestContents:
	dwbe TREASURE_GASHA_SEED_SUBID_01 ; Unlinked
	dwbe TREASURE_RING_SUBID_1e       ; Linked

_interactiondc_subid15And16_state0:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete
	jp interactionIncState


; Sets past sea of storms chest contents (changes if linked)
_interactiondc_subid16:
	call checkInteractionState
	jr z,_interactiondc_subid15And16_state0
	call checkIsLinkedGame
	ld a,$00
	jr nz,_interactiondc_subid15And16_setChestContents
	inc a
	jr _interactiondc_subid15And16_setChestContents


; Forces Link to be squished when he's in a wall (used in ages d5 BK room)
_interactiondc_subid17:
	call checkInteractionState
	jp z,interactionIncState

@state1:
	ld a,(w1Link.yh)
	ld b,a
	ld a,(w1Link.xh)
	ld c,a
	callab bank5.checkPositionSurroundedByWalls
	rl b
	ret nc

	ld a,(w1Link.state)
	cp LINK_STATE_NORMAL
	ret nz

	ld hl,wLinkForceState
	ld a,(hl)
	or a
	ret nz

	ld a,LINK_STATE_SQUISHED
	ldi (hl),a
	ld a,(wBlockPushAngle)
	and $08
	xor $08
	ld (hl),a ; [wcc50]
	ret

;causes warp in D3 from obtaining Rod of Seasons and D4 from obtaining Din's gift
_interactiondc_subid18:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
@state0:
	call getThisRoomFlags
	ld b,a
	and ROOMFLAG_40
	jp nz, interactionDelete
	ld a,b
	and ROOMFLAG_ITEM
	jp nz,interactionIncState

	ld e,Interaction.var03
	ld a,(de)
	ld b,a
	;ld b, TREASURE_ROD_OF_SEASONS
	ld c,$00
	call createTreasure
	jp objectCopyPosition

@state1:
	ld a,(wTextIsActive)	;$cba0
	or a
	ret nz
	ld a,$81
	ld (wDisableLinkCollisionsAndMenu),a	;$cbca
	ld (wDisabledObjects),a					;$cca4
	call interactionIncState
	ld e,Interaction.counter1	;$46
	ld a,$96						;wait 150 frames (3 seconds) $5a
	ld (de),a
	ld a,SNDCTRL_MEDIUM_FADEOUT	;$fb
	jp playSound

@state2:
	call interactionDecCounter1
	ret nz
	call getThisRoomFlags
	set ROOMFLAG_BIT_40,(hl)
	ld hl,@D3warpDestVariables
	ld e,Interaction.var03
	ld a,(de)
	cp $07
	jr z,+
	ld hl,@D4warpDestVariables
+
	call setWarpDestVariables
	ld a,SND_FADEOUT				;$b4
	call playSound
	jp interactionDelete
@D3warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_027 $00 $15 $83
@D4warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_077 $00 $46 $83


; creates interaction $dc07 when tile is destroyed
_interactiondc_subid19:
	call checkInteractionState
	jr nz,@state1

@state0:
	inc a
	ld (de),a

	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	jp nz,interactionDelete

	call objectGetTileAtPosition
	ld e,Interaction.var30
	ld (de),a

@state1:
	call objectGetTileAtPosition
	ld h,d
	ld l,Interaction.var30
	cp (hl)
	ret z

	; Tile has changed
	ldbc RUPEEVAL_COUNT-1,$00 ; instant heart piece
	call _isHeartPieceOrRupee
	call createTreasure
	call objectCopyPosition
	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete

_interactiondc_subid1a:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	jp nz,interactionDelete

	ld a,(wNumEnemies)
	or a
	ret nz

	ldbc (RUPEEVAL_COUNT-1)*2,$02 ; falling heart piece
	call _isHeartPieceOrRupee
	call createTreasure
	call objectCopyPosition
	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete

_isHeartPieceOrRupee:
	ld e,Interaction.var03
	ld a,(de)
	sub $01
	jr c,+

	add b
	ld c,a
	ld b,TREASURE_RUPEES
	ret

+	
	ld b,TREASURE_HEART_PIECE
	ret


; ==============================================================================
; INTERACID_TIMEWARP
;
; Variables:
;   var03: ?
;   relatedObj2: ?
; ==============================================================================
interactionCodedd:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw _timewarp_subid0
	.dw _timewarp_subid1
	.dw _timewarp_subid2
	.dw _timewarp_subid3
	.dw _timewarp_subid4

_timewarp_subid0:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw _timewarp_common_state0
	.dw _timewarp_subid0_state1
	.dw _timewarp_subid0_state2
	.dw _timewarp_animateUntilFinished


_timewarp_common_state0:
	call interactionInitGraphics
	call interactionIncState

	ld l,Interaction.yh
	ldh a,(<hEnemyTargetY)
	add $08
	ldi (hl),a
	inc l
	ldh a,(<hEnemyTargetX)
	ld (hl),a

	jp objectSetVisible83


_timewarp_subid0_state1:
	call _timewarp_animate
	jp z,interactionIncState
	dec a
	jr nz,+
	ret
+
	xor a
	ld (de),a ; [animParameter]

	ld b,$03

;;
; @param	b	Subid of INTERACID_TIMEWARP object to spawn
_timewarp_spawnChild:
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERACID_TIMEWARP
	inc l
	ld (hl),b ; [subid]
	inc l
	ld e,l
	ld a,(de) ; [var03]
	ld (hl),a
	ld e,Interaction.relatedObj2
	ld a,Interaction.start
	ld (de),a
	inc e
	ld a,h
	ld (de),a
	ld bc,$f800
	jp objectCopyPositionWithOffset


_timewarp_subid0_state2:
	call interactionDecCounter1
	jr z,@counterReached0

	ld a,(hl) ; [counter1]
	cp 36
	ret c
	and $07
	ret nz
	ld a,(hl)
	and $38
	rrca
	ld hl,@data
	rst_addAToHl
	ldi a,(hl)
	ld b,a
	ldi a,(hl)
	ld c,a
	ld e,(hl)

	call getFreePartSlot
	ret nz
	ld (hl),PARTID_TIMEWARP_ANIMATION
	inc l
	ld (hl),e ; [subid]

	ld e,Interaction.relatedObj2+1
	ld a,(de)
	ld l,Part.relatedObj1+1
	ldd (hl),a
	ld (hl),Interaction.start

	ld l,Part.speed
	ld (hl),b

	ld b,$00
	jp objectCopyPositionWithOffset

@counterReached0:
	ld a,$01
	call interactionSetAnimation
	ld a,Object.state
	call objectGetRelatedObject2Var
	inc (hl)
	jp interactionIncState

; Data format:
;   b0: speed
;   b1: x-offset
;   b2: subid
;   b3: unused
@data:
	.db SPEED_280, $fc, $00, $00
	.db SPEED_2c0, $09, $03, $00
	.db SPEED_240, $f7, $02, $00
	.db SPEED_2c0, $04, $01, $00
	.db SPEED_240, $fc, $00, $00
	.db SPEED_280, $04, $01, $00
	.db SPEED_2c0, $f7, $02, $00
	.db SPEED_240, $09, $03, $00


_timewarp_animateUntilFinished:
	call _timewarp_animate
	ret nz
	jp interactionDelete


_timewarp_subid1:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw _timewarp_common_state0
	.dw _timewarp_subid1_state1
	.dw _timewarp_animateUntilFinished ; TODO


_timewarp_subid1_state1:
	call _timewarp_animate
	jr z,++
	dec a
	ret z

	xor a
	ld (de),a ; [animParameter
	ld b,$04
	jp _timewarp_spawnChild
++
	ld a,Object.state
	call objectGetRelatedObject2Var
	inc (hl)
	call interactionIncState
	ld a,$01
	jp interactionSetAnimation

_timewarp_subid2:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	call interactionInitGraphics
	call interactionIncState

	ld l,Interaction.speedTmp
	ld (hl),$fc
	ld l,Interaction.counter1
	ld (hl),$06
	jp objectSetVisible81

@state1:
	call _timewarp_animate
	ret nz
	jp interactionIncState

@state2:
	call objectApplyComponentSpeed
	ld e,Interaction.yh
	ld a,(de)
	cp $f0
	jp nc,interactionDelete
	call interactionDecCounter1
	ret nz
	ld (hl),$06
	ldbc INTERACID_SPARKLE, $01
	call objectCreateInteraction
	ret nz
	ld l,Interaction.var03
	inc (hl)
	ret


_timewarp_subid3:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw _itemwarp_subid3Or4_state0
	.dw _timewarp_subid3_state1
	.dw interactionAnimate
	.dw _timewarp_subid3Or4_state3
	.dw _timewarp_subid3Or4_state4

_itemwarp_subid3Or4_state0:
	ld e,Interaction.var03
	ld a,(de)
	add $c0
	call loadPaletteHeader
	call interactionInitGraphics
	call interactionIncState
	jp objectSetVisible82

_timewarp_subid3_state1:
	call _timewarp_animate
	ret nz
	ld a,$03
	call interactionSetAnimation
	jp interactionIncState

_timewarp_subid3Or4_state3:
	call interactionIncState
	ld a,$04
	jp interactionSetAnimation

_timewarp_subid3Or4_state4:
	call _timewarp_animate
	ret nz
	jp interactionDelete


_timewarp_subid4:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw _itemwarp_subid3Or4_state0
	.dw interactionAnimate
	.dw _timewarp_subid3Or4_state3 ; Actually state 2...
	.dw _timewarp_subid3Or4_state4 ; Actually state 3...


;;
; @param[out]	a	[Interaction.animParameter]+1
_timewarp_animate:
	call interactionAnimate
	ld e,Interaction.animParameter
	ld a,(de)
	inc a
	ret


; ==============================================================================
; INTERACID_TIMEPORTAL
;
; Variables:
;   var03: Short-form position
; ==============================================================================
interactionCodede:
	ld a,$02
	ld (wcddd),a
	ld a,(wMenuDisabled)
	or a
	jp nz,objectSetInvisible

	call objectSetVisible
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	; Delete self if a timeportal exists already.
	; BUG: This only checks for timeportals in object slots before the current one. This makes
	; it possible to "stack" timeportals.
	ld c,INTERACID_TIMEPORTAL
	call objectFindSameTypeObjectWithID
	ld a,h
	cp d
	jp nz,interactionDelete

	ld a,$03
	call objectSetCollideRadius
	call objectGetShortPosition
	ld c,a

	call interactionIncState

	ld l,Interaction.var03
	ld (hl),c
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	call nc,interactionIncState
	call interactionInitGraphics
	jp objectSetVisible83

@state1:
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	jp nc,interactionIncState
	jr _timeportal_updatePalette

@state2:
	ld e,Interaction.var03
	ld a,(de)
	ld b,a
	ld a,(wPortalPos)
	cp b
	jp nz,interactionDelete

	call _timeportal_updatePalette
	ld a,(wLinkObjectIndex)
	rrca
	ret c
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc
	call checkLinkCollisionsEnabled
	ret nc

	; Link touched the portal
	ld a,$ff
	ld (wPortalGroup),a

	; Fall through

;;
; Also called by INTERACID_TIMEPORTAL_SPAWNER.
interactionBeginTimewarp:
	call resetLinkInvincibility
	ld hl,w1Link
	call objectCopyPosition
	ld l,<w1Link.direction
	ld (hl),DIR_DOWN

	ld a,DISABLE_ALL_BUT_INTERACTIONS | DISABLE_LINK
	ld (wDisabledObjects),a
	ld (wDisableLinkCollisionsAndMenu),a

	call objectGetTileAtPosition
	ld (wActiveTileIndex),a
	ld a,l
	ld (wActiveTilePos),a
	inc a
	ld (wLinkTimeWarpTile),a
	ld (wcde0),a

	ld a,CUTSCENE_TIMEWARP
	ld (wCutsceneTrigger),a
	call restartSound
	jp interactionDelete

;;
_timeportal_updatePalette:
	ld a,(wFrameCounter)
	and $01
	jr nz,@animate
	ld e,Interaction.oamFlags
	ld a,(de)
	inc a
	and $0b
	ld (de),a
@animate:
	jp interactionAnimate


; ==============================================================================
; INTERACID_NAYRU_RALPH_CREDITS
; ==============================================================================
interactionCodedf:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	ld a,$01
	ld (de),a
	call interactionInitGraphics

	ld h,d
	ld l,Interaction.speed
	ld (hl),SPEED_80
	ld l,Interaction.angle
	ld (hl),$18

	ld l,Interaction.counter1
	ld (hl),60
	ld l,Interaction.subid
	ld a,(hl)
	or a
	jp z,objectSetVisiblec2
	jp objectSetVisiblec0

@state1:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @substate0
	.dw @substate1
	.dw @substate2
	.dw @substate3
	.dw @substate4
	.dw @substate5
	.dw @substate6

@substate0:
	call interactionDecCounter1
	ret nz
	call interactionIncSubstate

@substate1:
	call interactionAnimate
	call objectApplySpeed
	cp $68 ; [xh]
	ret nz

	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),180

	ld l,Interaction.subid
	ld a,(hl)
	or a
	ret nz
	ld a,$05
	jp interactionSetAnimation

@substate2:
	call interactionDecCounter1
	ret nz
	ld hl,wTmpcfc0.genericCutscene.cfd0
	ld (hl),$01
	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),$04
	inc l
	ld (hl),$01 ; [counter2]
	jr @setRandomVar38

@substate3:
	ld h,d
	ld l,Interaction.counter1
	call decHlRef16WithCap
	jr nz,@label_10_330

	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),100

	ld b,SPEED_80 ; Nayru
	ld c,$04
	ld l,Interaction.subid
	ld a,(hl)
	or a
	jr z,++
	ld b,SPEED_180 ; Ralph
	ld c,$02
++
	ld l,Interaction.speed
	ld (hl),b
	ld a,c
	call interactionSetAnimation
	ld hl,wTmpcfc0.genericCutscene.cfd0
	ld (hl),$02
	ret

@label_10_330:
	ld l,Interaction.subid
	ld a,(hl)
	or a
	call z,interactionAnimate

.ifdef ROM_AGES
	ld l,Interaction.var38
.else
	ld l,Interaction.var37
.endif
	dec (hl)
	ret nz

	ld l,Interaction.direction
	ld a,(hl)
	xor $01
	ld (hl),a

	ld e,Interaction.subid
	ld a,(de)
	add a
	add (hl)
	call interactionSetAnimation

@setRandomVar38:
	call getRandomNumber_noPreserveVars
	and $03
	swap a
	add $20
.ifdef ROM_AGES
	ld e,Interaction.var38
.else
	ld e,Interaction.var37
.endif
	ld (de),a
	ret

@substate4:
	call interactionDecCounter1
	ret nz

	ld b,120
	ld e,Interaction.subid
	ld a,(de)
	or a
	jr nz,+
	ld b,160
+
	ld (hl),b ; [counter1]
	ld hl,wTmpcfc0.genericCutscene.cfd0
	ld (hl),$03
	jp interactionIncSubstate

@substate5:
	call interactionDecCounter1
	ret nz
	ld (hl),60 ; [counter1]
	ld hl,wTmpcfc0.genericCutscene.cfd0
	ld (hl),$04
	jp interactionIncSubstate

@substate6:
	call interactionAnimate
	call objectApplySpeed
	call interactionDecCounter1
	ret nz
	ld hl,wTmpcfc0.genericCutscene.cfdf
	ld (hl),$01
	ret


; ==============================================================================
; INTERACID_TIMEPORTAL_SPAWNER
; ==============================================================================
interactionCodee1:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3

; Portal is active
@state3:
	call objectSetVisible83
	ld b,$01
	call objectFlickerVisibility
	call interactionAnimate

	call @markSpotDiscovered

	; Wait for Link to touch the portal
	ld a,(wLinkObjectIndex)
	rrca
	ret c
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc
	call checkLinkCollisionsEnabled
	ret nc

	; Link touched the portal
	ld e,Interaction.subid
	ld a,(de)
	bit 6,a
	jr z,++
	call getThisRoomFlags
	set 1,(hl)
++
	jpab interactionBeginTimewarp
	; Above call will delete this object

@state0:
	ld e,Interaction.subid
	ld a,(de)
	and $0f
	rst_jumpTable
	.dw @commonInit
	.dw @subid1Init
	.dw @subid2Init

@subid1Init:
	ld a,GLOBALFLAG_MAKU_TREE_SAVED
	call checkGlobalFlag
	jr nz,@commonInit
	jr @setSubidBit7

@subid2Init:
	ld a,TREASURE_SEED_SATCHEL
	call checkTreasureObtained
	jr c,@commonInit

@setSubidBit7:
	ld h,d
	ld l,Interaction.subid
	set 7,(hl)

@commonInit:
	; If the portal tile is hidden, don't allow activation yet
	call objectGetTileAtPosition
	cp TILEINDEX_PORTAL_SPOT
	ret nz

	call interactionInitGraphics
	call interactionSetAlwaysUpdateBit
	ld a,$02
	call objectSetCollideRadius

	ld l,Interaction.subid
	ld b,(hl)
	bit 6,b
	jr z,@nextState

	call getThisRoomFlags
	and $02
	jr nz,@nextState

	set 7,b
@nextState:
	call interactionIncState
	bit 7,b
	ret z
	ld (hl),$03
	ret

@state1:
	ld a,(wLinkPlayingInstrument)
	dec a
	ret nz
	call interactionIncState

@markSpotDiscovered:
	call getThisRoomFlags
	set ROOMFLAG_BIT_PORTALSPOT_DISCOVERED,(hl)
	ret

@state2:
	ld a,(wLinkPlayingInstrument)
	or a
	ret nz
	ld a,SNDCTRL_STOPSFX
	call playSound
	ld a,SND_TELEPORT
	call playSound
	jp interactionIncState


; ==============================================================================
; INTERACID_KNOW_IT_ALL_BIRD
;
; Variables:
;   var36: Counter until bird should turn around?
;   var37: Set while being talked to (signal to change animation)
; ==============================================================================
interactionCodee3:
	call checkInteractionState
	jr nz,@state1

@state0:
	ld a,$01
	ld (de),a
	call interactionInitGraphics
	ld hl,mainScripts.knowItAllBirdScript
	call interactionSetScript

	call getRandomNumber_noPreserveVars
	and $01
	ld e,Interaction.direction
	ld (de),a
	call interactionSetAnimation
	call interactionSetAlwaysUpdateBit

	ld l,Interaction.var36
	ld (hl),30

	call @beginJump
	ld l,Interaction.subid
	ld a,(hl)
	ld l,Interaction.textID
	ld (hl),a

	ld hl,@oamFlagsTable
	rst_addAToHl
	ld a,(hl)
	ld e,Interaction.oamFlags
	ld (de),a
	ld a,>TX_3200
	call interactionSetHighTextIndex
	jp objectSetVisible82

@oamFlagsTable:
	.db $00 $01 $02 $03 $02 $03 $01 $00 $00 $01

@state1:
	call interactionRunScript
	call checkInteractionSubstate
	jr nz,@substate1

@substate0:
	ld e,Interaction.var37
	ld a,(de)
	or a
	jr z,@label_10_337

	; Being talked to
	call interactionIncSubstate
	ld l,Interaction.direction
	ld a,(hl)
	add $02
	jp interactionSetAnimation

@label_10_337:
	; Not being talked to; looks left and right
	call @decVar36
	jr nz,@animate
	ld l,Interaction.var36
	ld (hl),30
	call getRandomNumber
	and $07
	jr nz,@animate
	ld l,Interaction.direction
	ld a,(hl)
	xor $01
	ld (hl),a
	jp interactionSetAnimation

@animate:
	jp interactionAnimateAsNpc

@substate1:
	call interactionAnimate
	ld h,d
	ld l,Interaction.var37
	ld a,(hl)
	or a
	jp nz,@updateSpeedZ

	ld l,Interaction.var36
	ld (hl),60

	; a == 0 here
	ld l,Interaction.substate
	ld (hl),a
	ld l,Interaction.z
	ldi (hl),a
	ld (hl),a

	ld l,Interaction.direction
	ld a,(hl)
	jp interactionSetAnimation

@decVar36:
	ld h,d
	ld l,Interaction.var36
	dec (hl)
	ret

@updateSpeedZ:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz
	ld h,d

@beginJump:
	ld bc,-$c0
	jp objectSetSpeedZ


; ==============================================================================
; INTERACID_RAFT
; ==============================================================================
interactionCodee6:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw interactionDelete

@state0:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1
	.dw @subid2

@subid0:
	ld a,(wCurrentSeason)
	cp SEASON_FALL
	jp nz,interactionDelete

; Subid 1: A raft that's put there through the room's object list; it must check that
; there is no already-existing raft on the screen (either from a remembered position, or
; from Link riding it)
@subid1:
	;ld a,GLOBALFLAG_RAFTON_CHANGED_ROOMS
	;call checkGlobalFlag
	;jp z,interactionDelete

	; Check if Link's riding a raft
	ld a,(w1Companion.id)
	cp SPECIALOBJECTID_RAFT
	jp z,interactionDelete

	; Check if there's another raft interaction
	ld c,INTERACID_RAFT
	call objectFindSameTypeObjectWithID
	ld a,h
	cp d
	jp nz,interactionDelete

; Subid 2: when the raft's position was remembered
@subid2:
	ld e,Interaction.subid
	ld a,(de)
	or a
	jr nz,+
	ld a,(wCurrentSeason)
	cp SEASON_FALL
	jp nz,interactionDelete
+
	push de
	ld a,UNCMP_GFXH_3b
	call loadUncompressedGfxHeader
	pop de
	call interactionInitGraphics
	call interactionIncState
	ld e,Interaction.direction
	ld a,(de)
	and $01
	call interactionSetAnimation
	jp objectSetVisible83

@state1:
	call interactionAnimate
	ld a,$09
	call @checkLinkWithinRange
	ret nc

	ld a,(wLinkInAir)
	or a
	jr z,@mountedRaft

	ld hl,w1Link.zh
	ld a,(hl)
	cp $fd
	ret c

	ld l,<w1Link.speedZ+1
	bit 7,(hl)
	ret nz

@mountedRaft:
	; Moving onto raft?
	ld a,d
	ld (wLinkRidingObject),a
	ld a,$05
	ld (wInstrumentsDisabledCounter),a
	call @checkLinkWithinRange
	ret nc

	ld a,(w1Link.id)
	or a
	jr z,++
	xor a ; SPECIALOBJECTID_LINK
	call setLinkIDOverride
++
	ld hl,w1Companion.enabled
	ld (hl),$03
	inc l
	ld (hl),SPECIALOBJECTID_RAFT
	ld e,Interaction.direction
	ld l,<w1Link.direction
	ld a,(de)
	ldi (hl),a
	call objectCopyPosition
	jp interactionIncState


;;
; @param	a	Collision radius
@checkLinkWithinRange:
	call objectSetCollideRadius
	ld hl,w1Link.yh
	ldi a,(hl)
	add $05
	ld b,a
	inc l
	ld c,(hl) ; [w1Link.xh]
	jp interactionCheckContainsPoint

; ==============================================================================
; INTERACID_USED_ROD_OF_SEASONS
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
; INTERACID_HEROS_CAVE_SWORD_CHEST
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
	ld (hl),INTERACID_TREASURE
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
; INTERACID_MISC_STATIC_OBJECTS
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
; INTERACID_QUICKSAND
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
	call _findItemDropAddress
	call _findPirateSkullAddress
	call _findBombOrScentSeedAddress
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
	call _matchSkullNumberWithSubid
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
	.db $80|>ROOM_AGES_470 <ROOM_AGES_46b $87 ; 473 $23
	.db $80|>ROOM_AGES_472 <ROOM_AGES_472 $67 ; 
	.db $80|>ROOM_AGES_475 <ROOM_AGES_475 $34 ; 
	.db $80|>ROOM_AGES_476 <ROOM_AGES_476 $52 ; 
	.db $80|>ROOM_AGES_479 <ROOM_AGES_479 $97 ; 
	.db $80|>ROOM_AGES_47a <ROOM_AGES_47a $85 ; 


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
_matchSkullNumberWithSubid:
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
_findPirateSkullAddress:
	ld c,INTERACID_USED_ROD_OF_SEASONS		;INTERACID_PIRATE_SKULL
	call objectFindSameTypeObjectWithID
	ret nz
	ld l,Interaction.zh
	ld e,Interaction.var3a
	jr _moveObjectIfGrounded
_findItemDropAddress:
	ld h,$d0
-
	ld l,Part.id
	ld a,(hl)
	cp PARTID_ITEM_DROP
	call z,_objectIsPart
	inc h
	ld a,h
	cp $e0
	jr c,-
	ret

; Object is a part
_objectIsPart:
	ld l,Part.zh
	ld e,Part.var31

; Param     hl      Object.zh
; Param     e       Object's yh variable to tell it to move toward quicksand
_moveObjectIfGrounded:
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

_findBombOrScentSeedAddress:
	ld c,ITEMID_BOMB
	call findItemWithID
	call z,_objectIsItem
	ld c,ITEMID_BOMB
	call findItemWithID_startingAfterH
	call z,_objectIsItem
	ld c,ITEMID_SCENT_SEED
	call findItemWithID
	ret nz

; Object is an item
_objectIsItem:
	ld l,Item.zh
	ld e,Item.var31
	jr _moveObjectIfGrounded

; ==============================================================================
; INTERACID_SOMARIA_BLOCK
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
	ld (hl),ITEMID_18
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
; INTERACID_SPRINGBLOOM_FLOWER
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
	call _func_5cf2
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
	call nc,_func_5cf2
	ret
@func_5ca0:
	ld a,$06
	call _func_5cf2
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
_func_5cf2:
	ld hl,_table_5d08
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
_table_5d08:
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




.ends
