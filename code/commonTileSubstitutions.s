; This is included at the end of the "code/<game>/tileSubstitutions.s" file.

;;
; Replaces a shutter link is about to walk on to with empty floor.
replaceShutterForLinkEntering:
	ld a,(wDungeonIndex)
	inc a
	ldbc >wRoomLayout, (LARGE_ROOM_HEIGHT-1)<<4 + (LARGE_ROOM_WIDTH-1)
	jr nz,+
	ldbc >wRoomLayout, (SMALL_ROOM_HEIGHT-1)<<4 + (SMALL_ROOM_WIDTH-1)
+
--
	ld a,(bc)		;a is tile index
	push bc
	sub TILEINDEX_SHUTTER_DOOR_UP	;$78
	cp TILERANGE_SHUTTER_DOORS 	;$0c
	call c,@temporarilyOpenDoor
	pop bc
	dec c
	jr nz,--
	ret

; Replaces a door at position bc with empty floor, and adds an interaction to
; re-close it when link moves away (for minecart doors only)
@temporarilyOpenDoor:
		;a is tile index minus $78

	ld de,@shutterData
	call addDoubleIndexToDe
	ld a,(de)
	ldh (<hFF8B),a
	inc de
	ld a,(de)
	ld e,a
	ld a,(wScrollMode)
	and $08
	jr z,@doneReplacement

	ld a,(wLinkObjectIndex)
	ld h,a
	ld a,(wScreenTransitionDirection)
	xor $02
	ld d,a
	ld a,e
	and $03
	cp d
	ret nz

	ld a,(wScreenTransitionDirection)
	bit 0,a
	jr nz,@horizontal
; vertical
	and $02
	ld l,<w1Link.xh
	ld a,(hl)
	jr nz,@down
@up:
	and $f0
	swap a
	or $a0
	jr @doReplacement
@down:
	and $f0
	swap a
	jr @doReplacement

@horizontal:
	and $02
	ld l,<w1Link.yh
	ld a,(hl)
	jr nz,@left
@right:
	and $f0
	jr @doReplacement
@left:
	and $f0
	or $0e

@doReplacement:
	; Only replace if link is standing on the tile.
	cp c
	jr nz,@doneReplacement

	push bc
	ld c,a
	ld a,(bc)
	ld (wDoorTileIndex),a
	sub TILEINDEX_SHUTTER_DOOR_UP	;$78
	cp TILERANGE_SHUTTER_DOORS 	;$0c
	jr nc,+

	ldh a,(<hFF8B)
	ld (bc),a
+
	pop bc

@doneReplacement:
	; If bit 7 is set, don't add an auto-shutter interaction.
	ld a,e
	bit 7,a
	ret nz

	and $7f
	ld e,a

	; If not in a dungeon, don't add an auto-shutter.
	;ld a,(wTilesetFlags)
	;bit TILESETFLAG_BIT_DUNGEON,a
	;ret z

	call getFreeInteractionSlot
	ret nz

	ld (hl),INTERAC_DOOR_CONTROLLER
	inc l
	ld (hl),e
	ld l,Interaction.yh
	ld (hl),c
	ret

; Data format:
; Byte 1 - tile to replace shutter with
; Byte 2 - bit 7: don't auto-close, bits 0-6: low byte of interaction id
@shutterData:
	.db $a0 $80 ; Normal shutters
	.db $a0 $81
	.db $a0 $82
	.db $a0 $83
	.db $5e $0c ; Minecart shutters
	.db $5d $0d
	.db $5e $0e
	.db $5d $0f
	.db $a0 $80 ; Red shutters
	.db $a0 $81
	.db $a0 $82
	.db $a0 $83

;;
replaceOpenedChest:
	ld a,(wActiveGroup)
	or a
	jr nz,@noException
	ld a,(wPastRoomFlags+<ROOM_AGES_120)
	bit ROOMFLAG_BIT_LAYOUTSWAP,a
	jr nz,@noException
	ld a,(wActiveRoom)
	ld e,a
	ld hl,@exceptionTable
	call findByteAtHl
	ret c
@noException:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	ret z

	call getChestData
	ld d,>wRoomLayout
	ld a,TILEINDEX_CHEST_OPENED
	ld (de),a
	ret

@exceptionTable:
	.db <ROOM_AGES_040, <ROOM_AGES_051, <ROOM_AGES_060, <ROOM_AGES_061, <ROOM_AGES_070, $00

;;
; Replaces switch tiles and whatever they control if the switch is set.
; Groups 4 and 5 only.
replaceSwitchTiles:
	ld hl,@group4SwitchData
	ld a,(wActiveGroup)
	sub NUM_SMALL_GROUPS
	jr z,+

	dec a
	ret nz

	ld hl,@group5SwitchData
+
	ld a,(wActiveRoom)
	ld b,a
	ld a,(wSwitchState)
	ld c,a
	ld d,>wRoomLayout
@next:
	ldi a,(hl)
	or a
	ret z

	; Check room
	cp b
	jr nz,@skip3Bytes

	; Check if corresponding bit of wSwitchState is set
	ldi a,(hl)
	and c
	jr z,@skip2Bytes

	ldi a,(hl)
	ld e,(hl)
	inc hl
	ld (de),a
	jr @next

@skip3Bytes:
	inc hl
@skip2Bytes:
	inc hl
	inc hl
	jr @next

; Data format:
; Room, Switch bit, new tile index, position of tile to replace

@group4SwitchData:
	.db <ROOM_AGES_415 $01 $5b $7a
	.db <ROOM_AGES_415 $01 $0b $5b
	.db <ROOM_AGES_416 $04 $0b $27
	.db <ROOM_AGES_416 $04 $5d $3a
	.db <ROOM_AGES_412 $02 $5a $88


;	.db $2f $02 $0b $79
;	.db $2f $02 $5a $6c
;	.db $3b $20 $af $79
;	.db $4c $01 $0b $38
;	.db $4e $02 $0b $68
;	.db $53 $04 $0b $6a
;	.db $72 $01 $af $8d
;	.db $89 $04 $0b $62
;	.db $89 $04 $5d $67
;	.db $8f $08 $0b $81
;	.db $8f $08 $5e $52
;	.db $c7 $01 $0b $68
	.db $00

@group5SwitchData:
	.db $68 $01 $0b $91
	.db $68 $01 $50 $8c
	.db $51 $01 $0b $8c
	.db $51 $01 $52 $42

	.db $6e $40 $0b $11
	.db $6e $40 $d0 $33
	.db $6e $04 $0b $1d
	.db $6e $04 $d0 $3b
	.db $6e $08 $0b $9d
	.db $6e $08 $d0 $7b
	.db $6e $10 $0b $91
	.db $6e $10 $d0 $54

	.db $6c $20 $0b $58
	.db $6c $20 $60 $99
	.db $6c $20 $60 $17
	.db $6c $20 $d0 $64
	.db $6c $20 $d0 $4c

	.db $50 $80 $0b $7d
	.db $5a $40 $d0 $27

	.db $28 $01 $0b $7d
	.db $28 $01 $52 $58
	.db $2b $01 $0b $2b
	.db $2b $01 $b2 $75

	.db <ROOM_AGES_567 $02 $0b $2c

	;.db $6a $01 $57 $23
	;.db $6a $01 $57 $24
	.db $00

;;
applySingleTileChanges:
	ld a,(wActiveRoom)
	ld b,a
	call getThisRoomFlags
	ld c,a
	ld d,>wRoomLayout
	ld a,(wActiveGroup)
	ld hl,singleTileChangeGroupTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
@next:
	; Check room
	ldi a,(hl)
	cp b
	jr nz,@notMatch

	ld a,(hl)
	cp $f0
	jr z,@unlinkedOnly

	cp $f1
	jr z,@linkedOnly

	cp $f2
	jr z,@finishedGameOnly

	sub $e0
	jr c,+
	cp $08
	jr c,@slateRoom
+
	ld a,(hl)
	and c
	jr z,@notMatch

@match:
	inc hl
	ldi a,(hl)
	ld e,a
	ldi a,(hl)
	ld (de),a
	jr @next

@notMatch:
	ld a,(hl)
	or a
	ret z

	inc hl
	inc hl
	inc hl
	jr @next

@unlinkedOnly:
	call checkIsLinkedGame
	jr nz,@notMatch
	jr @match

@linkedOnly:
	call checkIsLinkedGame
	jr z,@notMatch
	jr @match

@finishedGameOnly:
	ld a,GLOBALFLAG_FINISHEDGAME
	push hl
	call checkGlobalFlag
	pop hl
	ret z
	jr @match

@slateRoom:
	push hl
	ld hl,wNumPlacedSlates
	call checkFlag
	pop hl
	jr nz,@match
	jr @notMatch
