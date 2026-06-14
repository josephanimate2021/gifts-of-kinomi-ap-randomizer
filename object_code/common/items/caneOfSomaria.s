;;
; ITEM_CANE_OF_SOMARIA
itemCode04:
	call itemTransferKnockbackToLink
	ld e,Item.state
	ld a,(de)
	rst_jumpTable

	.dw @state0
	.dw @state1
	.dw @state2

@state0:
.ifdef ROM_AGES
	ld a,UNCMP_GFXH_AGES_1c
.else
	ld a,UNCMP_GFXH_CANE_OF_SOMARIA
.endif
	call loadWeaponGfx
	call loadAttributesAndGraphicsAndIncState

	ld a,SND_SWORDSLASH
	call playSound

	xor a
	call itemSetAnimation
	jp objectSetVisible82

@state1:
	; Wait for a particular part of the swing animation
	ld a,(w1ParentItem2.animParameter)
	cp $06
	ret nz

	call itemIncState

	ld c,ITEM_18
	call findItemWithID
	jr nz,+

	; Set var2f of any previous instance of ITEM_18 (triggers deletion?)
	ld l,Item.var2f
	set 5,(hl)
+
	; Get in bc the place to try to make a block
	ld a,(w1Link.direction)
	ld hl,@somariaCreationOffsets
	rst_addDoubleIndex
	ld a,(w1Link.yh)
	add (hl)
	ld b,a
	inc hl
	ld a,(w1Link.xh)
	add (hl)
	ld c,a

	call getFreeItemSlot
	ret nz
	inc (hl)
	inc l
	ld (hl),ITEM_18

	; Set Y/X of the new item as calculated earlier, and copy Link's Z position
	ld l,Item.yh
	ld (hl),b
	ld a,(w1Link.zh)
	ld l,Item.zh

	jp caneHook1

	ldd (hl),a
	dec l
	ld (hl),c

@state2:
	ret

; Offsets relative to link's position to try to create a somaria block?
@somariaCreationOffsets:
	.dw $00ec ; DIR_UP
	.dw $1300 ; DIR_RIGHT
	.dw $0013 ; DIR_DOWN
	.dw $ec00 ; DIR_LEFT


;;
; ITEM_18 (somaria block object)
itemCode18:
	ld e,Item.state
	ld a,(de)
	rst_jumpTable

	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3
	.dw @state4


; State 0: initialization
@state0:
	call itemMergeZPositionIfSidescrollingArea
	call @alignOnTile
	call itemLoadAttributesAndGraphics
	xor a
	call itemSetAnimation
	call itemIncState
	ld a,SND_MYSTERY_SEED
	;call playSound
	call caneHook2
	jp objectSetVisible83


; State 1: phasing in
@state1:
	call @checkBlockCanAppear
	call z,@pushLinkAway

	; Wait for phase-in animation to complete
	call itemAnimate
	ld e,Item.animParameter
	ld a,(de)
	or a
	ret z

	; Animation done

	ld h,d
	ld l,Item.oamFlagsBackup
	ld a,$0d
	ldi (hl),a
	ldi (hl),a

	; Item.oamTileIndexBase
	ld (hl),$36

	; Enable collisions with enemies?
	ld l,Item.collisionType
	set 7,(hl)

@checkCreateBlock:
	call @checkBlockCanAppear
	jr nz,@deleteSelfWithPuff
	call @createBlockIfNotOnHazard
	jr nz,@deleteSelfWithPuff

	; Note: a = 0 here

	ld h,d
	ld l,Item.zh
	ld (hl),a

	; Set [state]=3, [substate]=0
	ld l,Item.substate
	ldd (hl),a
	ld (hl),$03

	ld l,Item.collisionRadiusY
	ld a,$04
	ldi (hl),a
	ldi (hl),a

	ld l,Item.var2f
	ld a,(hl)
	and $f0
	ld (hl),a

	ld a,$01
	jp itemSetAnimation


; State 4: block being pushed
@state4:
	ld e,Item.substate
	ld a,(de)
	rst_jumpTable

	.dw @state4Substate0
	.dw @state4Substate1

@state4Substate0:
	call itemIncSubstate
	call itemUpdateAngle

	; Set speed & counter1 based on bracelet level
	ldbc SPEED_80, $20
	ld a,(wBraceletLevel)
	cp $02
	jr nz,+
	ldbc SPEED_c0, $15
+
	ld l,Item.speed
	ld (hl),b
	ld l,Item.counter1
	ld (hl),c

	ld a,SND_MOVEBLOCK
	call playSound
	call @removeBlock

@state4Substate1:
	call itemUpdateDamageToApply
	jr c,@deleteSelfWithPuff
	call @checkDeletionTrigger
	jr nz,@deleteSelfWithPuff

	call objectApplySpeed
	call @pushLinkAway
	call itemDecCounter1

	ld l,Item.collisionRadiusY
	ld a,$04
	ldi (hl),a
	ld (hl),a

	; Return if counter1 is not 0
	ret nz

	jr @checkCreateBlock


@removeBlockAndDeleteSelfWithPuff:
	call @removeBlock
@deleteSelfWithPuff:
	; OOH hack: when the somaria block deletes itself, it actually creates an instance
	; of ITEMID_1f which will attempt to replace hole tiles.
	ld h,d
	ld l,Item.var2f
	bit 4,(hl)
	;call z,objectCreatePuff
	call caneHook3
@deleteSelf:
	jp itemDelete


; State 2: being picked up / thrown
@state2:
	ld e,Item.substate
	ld a,(de)
	rst_jumpTable

	.dw @state2Substate0
	.dw @state2Substate1
	.dw @state2Substate2
	.dw @state2Substate3

; Substate 0: just picked up
@state2Substate0:
	call itemIncSubstate
	call @removeBlock
	call objectSetVisiblec1
	ld a,$02
	jp itemSetAnimation

; Substate 1: being lifted
@state2Substate1:
	call itemUpdateDamageToApply
	ret nc
	call dropLinkHeldItem
	jr @deleteSelfWithPuff

; Substate 2/3: being thrown
@state2Substate2:
@state2Substate3:
	call objectCheckWithinRoomBoundary
	jr nc,@deleteSelf

	call bombUpdateThrowingLaterally
	;; call @checkDeletionTrigger
	;; jr nz,@deleteSelfWithPuff

	; var39 = gravity
	ld h,d
	ld l,Item.var39
	ld c,(hl)
	jp caneHook4
	jr c,@deleteSelf

	ret z
	jr @deleteSelfWithPuff


; State 3: block is just sitting around
@state3:
	call @checkBlockInPlace
	jr nz,@deleteSelfWithPuff

	; Check if health went below 0
	call itemUpdateDamageToApply
	jr c,@removeBlockAndDeleteSelfWithPuff

	; Check bit 5 of var2f (set when another somaria block is being created)
	call @checkDeletionTrigger
	jr nz,@removeBlockAndDeleteSelfWithPuff

	; If Link somehow ends up on this tile, delete the block
	ld a,(wActiveTilePos)
	ld l,Item.var32
	cp (hl)
	jr z,@removeBlockAndDeleteSelfWithPuff

	; If in a sidescrolling area, check that the tile below is solid
	ld a,(wTilesetFlags)
	and TILESETFLAG_SIDESCROLL
	jr z,++

	ld a,(hl)
	add $10
	ld c,a
	ld b,>wRoomCollisions
	ld a,(bc)
	cp $0f
	jr nz,@removeBlockAndDeleteSelfWithPuff
++
	ld l,Item.var2f
	bit 0,(hl)
	jp z,objectAddToGrabbableObjectBuffer

	; Link pushed on the block
	ld a,$04
	jp itemSetState

;;
; @param[out]	zflag	Unset if slated for deletion
@checkDeletionTrigger:
	ld h,d
	ld l,Item.var2f
	bit 5,(hl)
	ret

;;
@pushLinkAway:
	ld e,Item.collisionRadiusY
	ld a,$07
	ld (de),a
	ld hl,w1Link
	jp preventObjectHFromPassingObjectD

;;
; @param[out]	zflag	Set if the cane of somaria block is present, and is solid?
@checkBlockInPlace:
	ld e,Item.var32
	ld a,(de)
	ld l,a
.ifdef ROM_AGES
	ld h,>wRoomLayout
	ld a,(hl)
	cp TILEINDEX_SOMARIA_BLOCK
.else
	call getSomariaBlockIndex
	ld h,>wRoomLayout
	ld a,(hl)
	cp b
.endif
	ret nz

	ld h,>wRoomCollisions
	ld a,(hl)
	cp $0f
	ret

;;
@removeBlock:
	call @checkBlockInPlace
	ret nz

	; Restore tile
	ld e,Item.var32
	ld a,(de)
	call getTileIndexFromRoomLayoutBuffer
	jp setTile

;;
; @param[out]	zflag	Set if the block can appear at this position
@checkBlockCanAppear:
; If Link is on the same tile
	call objectGetShortPosition
	ld c,a
	ld a,(wActiveTilePos)
	cp c
	jr z,@@disallow

.ifdef ROM_AGES
	; Disallow cane of somaria usage if in patch's minigame room
	ld a,(wActiveGroup)
	cp >ROOM_AGES_5e8
	jr nz,+
	ld a,(wActiveRoom)
	cp <ROOM_AGES_5e8
	jr z,@@disallow
+
.endif
	; Must be close to the ground
	ld e,Item.zh
	ld a,(de)
	dec a
	cp $fc
	jr c,@@disallow

	; Can't be in a wall
	call objectGetTileCollisions
	ret nz

.ifdef ROM_AGES
	; If underwater, never allow it
	ld a,(wTilesetFlags)
	bit TILESETFLAG_BIT_UNDERWATER,a
	ret nz
.endif
	; If in a sidescrolling area, check for floor underneath
	and TILESETFLAG_SIDESCROLL
	ret z

	ld a,l
	add $10
	ld l,a
	ld a,(hl)
	cp $0f
	ret

@@disallow:
	or d
	ret

;;
; @param[out]	zflag	Set on success
@createBlockIfNotOnHazard:
	call @alignOnTile
	call objectGetTileAtPosition
	push hl
	ld hl,hazardCollisionTable
	call lookupCollisionTable
	pop hl
	jr c,++

	; Overwrite the tile with the somaria block
.ifdef ROM_AGES
	ld b,(hl)
	ld (hl),TILEINDEX_SOMARIA_BLOCK
.else
	call getSomariaBlockIndex
	ld a,b
	ld b,(hl)
	ld (hl),a
.endif
	ld h,>wRoomCollisions
	ld (hl),$0f

	; Save the old value of the tile to w3RoomLayoutBuffer
	ld e,Item.var32
	ld a,l
	ld (de),a
	ld c,a
	call setTileInRoomLayoutBuffer
	xor a
	ret
++
	or d
	ret

@alignOnTile:
	call objectCenterOnTile
	ld l,Item.yh
	dec (hl)
	dec (hl)
	ret

caneHook1:
	ldd (hl),a
	dec l
	ld (hl),c

	; Also copy direction so the cane knows which way to create blocks
	ld l,Item.direction
	ld e,l
	ld a,(de)
	ld (hl),a
	ret

caneHook2:
	; Only play the sound if we're not creating floors.
	call objectGetTileAtPosition
	ld hl,somariaHoleTiles
	call lookupCollisionTable
	ret c
	ld a,SND_MYSTERY_SEED
	call playSound
	ret

; This is the list of tiles that the cane of somaria will replace with floor.
somariaHoleTiles:
	.dw @collisions0
	.dw @collisions1
	.dw @collisions2
	.dw @collisions3
	.dw @collisions4
	.dw @collisions5

@collisions0: ; Overworld
	.db $f3 $3a ; Hole

	;.db $e4 $3a ; Lava
	;.db $e5 $3a
	;.db $e6 $3a
	;.db $e7 $3a
	;.db $e8 $3a
	.db $00

@collisions1: ; Indoors, dungeons
@collisions2:
	.db $48 $a0 ; Floor-transfer holes
	.db $49 $a0
	.db $4a $a0
	.db $4b $a0

	;.db $61 $a0 ; Lava
	;.db $62 $a0
	;.db $63 $a0
	;.db $64 $a0
	;.db $65 $a0

	.db $f3 $a0 ; Normal holes
	.db $f4 $a0
	.db $f5 $a0
	.db $f6 $a0
	.db $f7 $a0
	.db $00

@collisions3: ; Sidescrolling
@collisions4: ; Underwater
@collisions5: ; ?
	.db $00



; Cane of somaria creating a "bridge"
itemCode1f:
	ld e,Item.state
	ld a,(de)
	rst_jumpTable

	.dw @state0
	.dw @state1

@state0:
	call objectCenterOnTile
	call itemIncState

	; Delete self if too high up
	ld e,Item.zh
	ld a,(de)
	or a
	jr z,++
	cp $fc
	jr c,@delete
++

	ld e,Item.counter1
	ld a,1
	ld (de),a
	ret

@state1:
	call itemDecCounter1
	ret nz

	ld a,15
	ld (hl),a

	; Check that this tile is a hole (and get the tile to replace it with if so)
	call objectGetTileAtPosition
	ld hl,somariaHoleTiles
	call lookupCollisionTable
	jr nc,@delete

	; Store tile to change to for later
	ld e,Item.var03
	ld (de),a

	; Check that we're not on the screen boundary
	call objectGetShortPosition
	ld b,a
	and $0f
	jr z,@delete
	ld c,a
	ld a,b
	swap a
	and $0f
	jr z,@delete
	ld b,a

	ld a,(wActiveGroup)
	cp NUM_SMALL_GROUPS
	jr c,@small
@large:
	ld a,b
	cp LARGE_ROOM_HEIGHT-1
	jr z,@delete
	ld a,c
	cp LARGE_ROOM_WIDTH-1
	jr z,@delete
	jr ++
@small:
	ld a,b
	cp SMALL_ROOM_HEIGHT-1
	jr z,@delete
	ld a,c
	cp SMALL_ROOM_WIDTH-1
	jr z,@delete
++
	; Replace tile
	call objectGetShortPosition
	ld c,a
	ld e,Item.var03
	ld a,(de)
	call setTile

	; Set z position to 0
	ld e,Item.zh
	xor a
	ld (de),a

	; Create puff
	call objectCreatePuff

	; Update position
	ld e,Item.direction
	ld a,(de)
	ld hl,@directionOffsets
	rst_addDoubleIndex

	ld e,Item.yh
	ld a,(de)
	add (hl)
	ld (de),a
	inc hl
	ld e,Item.xh
	ld a,(de)
	add (hl)
	ld (de),a

	ld e,Item.var3f
	ld a,1
	ld (de),a
	ret

@delete:
	ld e,Item.var3f
	ld a,(de)
	or a
	call z,objectCreatePuff
	jp itemDelete

@directionOffsets:
	.db -16,   0 ; DIR_UP
	.db   0,  16 ; DIR_RIGHT
	.db  16,   0 ; DIR_DOWN
	.db   0, -16 ; DIR_DOWN


; This is the list of tiles that the cane of somaria will replace with floor.
_somariaHoleTiles:
	.dw @collisions0
	.dw @collisions1
	.dw @collisions2
	.dw @collisions3
	.dw @collisions4
	.dw @collisions5

@collisions0: ; Overworld
	.db $f3 $3a ; Hole

	;.db $e4 $3a ; Lava
	;.db $e5 $3a
	;.db $e6 $3a
	;.db $e7 $3a
	;.db $e8 $3a
	.db $00

@collisions1: ; Indoors, dungeons
@collisions2:
	.db $48 $a0 ; Floor-transfer holes
	.db $49 $a0
	.db $4a $a0
	.db $4b $a0

	;.db $61 $a0 ; Lava
	;.db $62 $a0
	;.db $63 $a0
	;.db $64 $a0
	;.db $65 $a0

	.db $f3 $a0 ; Normal holes
	.db $f4 $a0
	.db $f5 $a0
	.db $f6 $a0
	.db $f7 $a0
	.db $00

@collisions3: ; Sidescrolling
@collisions4: ; Underwater
@collisions5: ; ?
	.db $00


caneHook1:
	ldd (hl),a
	dec l
	ld (hl),c

	; Also copy direction so the cane knows which way to create blocks
	ld l,Item.direction
	ld e,l
	ld a,(de)
	ld (hl),a
	ret

caneHook2:
	; Only play the sound if we're not creating floors.
	call objectGetTileAtPosition
	ld hl,somariaHoleTiles
	call lookupCollisionTable
	ret c
	ld a,SND_MYSTERY_SEED
	call playSound
	ret

caneHook3:
	bit 4,(hl)
	ret nz

	call getFreeItemSlot
	ret nz
	ld (hl),1
	inc l
	ld (hl),ITEMID_1f
	ld e,Item.direction
	ld l,e
	ld a,(de)
	ld (hl),a
	call objectCopyPosition
	ret

caneHook4:
	call itemCode.itemUpdateThrowingVerticallyAndCheckHazards
	jr nc,++		; $5d9a

	; Fell into a hazard; delete the object that the above function call created,
	; we'll create a "puff" instead.
	push de
	ld d,h
	call interactionDelete
	pop de

	; Calculate direction to copy to ITEMID_1f before deleting self
	ld e,Item.angle
	ld a,(de)
	call convertAngleToDirection
	ld e,Item.direction
	ld (de),a
	jp itemCode.itemCode18@deleteSelfWithPuff

++
	ret z			; $5d9c
; Landed, but not in hazard

	; Jump if the item is not on the ground
;	jr z,+

	; If on the ground...
	call _itemBounce
	ret nc
;	jr c,@stoppedBouncing

	; No idea what this function is for
;+
;	jp bombUpdateAnimation

@stoppedBouncing:
	; Bomb goes to state 1 (motionless on the ground)
	ld h,d
	ld l,Item.state
	xor a
	ld (hl),a

	ld l,Item.speedZ
	ld (hl),a
	ld l,Item.var37
	ldi (hl),a	;var37
; var 38
	ldi (hl),a	;var38
; var 39
	ldi (hl),a	;var39
	inc l
	ldi (hl),a
	inc l
	ldi (hl),a
	ldi (hl),a

	ret

@deleteSelfWithPuff:
;	jp itemCode.itemCode18@deleteSelfWithPuff
