; ==============================================================================
; INTERACID_D7_4_ARMOS_BUTTON_PUZZLE
; ==============================================================================
interactionCode27:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1
@subid1:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @@state0
	.dw @@state1
@@state0:
; Interaction.state = $01
	ld a,$01
	ld (de),a

	call interactionInitGraphics
; 2nd armos tile
	ld a,$26
	call objectMimicBgTile
	ld a,$06
	call objectSetCollideRadius
	ld l,Interaction.speed		;$50
	ld (hl),SPEED_100			;$28
	ld l,Interaction.counter1	;$46
	ld (hl),16					;$10
	inc l	;Interaction.counter2
	ld (hl),2					;$02
	ld l,Interaction.yh			;$4b
	dec (hl)
	dec (hl)
	push de
	call @@func_55c8
	pop de
	ld a,SND_MOVEBLOCK			;$71
	call playSound
	jp objectSetVisible82
@@state1:
	call objectApplySpeed
	call objectPreventLinkFromPassing
	call interactionDecCounter1
	ret nz
	ld (hl),16					;$10
	inc l
;Passes through on the second interation
	dec (hl)
	jr z,+
	call interactionCheckAdjacentTileIsSolid
	ret z
+
	call objectGetShortPosition
	ld c,a
; 2nd armos tile
	ld a,$26
	call setTile
	jp interactionDelete
@@func_55c8:
	call objectGetShortPosition
	ld c,a
	ld a,$03
	ld ($ff00+R_SVBK),a
	ld b,>w3RoomLayoutBuffer		;$df
	ld a,(bc)
	ld b,a
	xor a
	ld ($ff00+R_SVBK),a
	ld a,b
	jp setTile
@subid0:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @@state0
	.dw @@state1
	.dw @@state2
@@state0:
	ld e,Interaction.state
	ld a,$01
	ld (de),a
	ld a,$03
	ld ($ff00+R_SVBK),a
	ld b,>w3RoomLayoutBuffer			;$df
	ld hl,@@table_5610
	ld a,TILEINDEX_DUNGEON_a3			;$a3
-
	ld c,(hl)
	inc hl
	ld (bc),a
	dec e
	jr nz,-
; hl == w3RoomLayoutBuffer
; changes all underlying tiles
	ld h,b
	ld l,$16							;$17
	ld (hl),TILEINDEX_STANDARD_FLOOR	;$a0
	ld l,$3a							;$3b
	ld (hl),TILEINDEX_STANDARD_FLOOR	;$a0
	ld l,$5a							;$5b
	ld (hl),TILEINDEX_STANDARD_FLOOR	;$a0
	ld l,$56							;$57
	ld (hl),TILEINDEX_DUNGEON_a2		;$a2
	xor a
	ld ($ff00+R_SVBK),a
	ret
@@table_5610:
	.db $34 $36 $38 $54					;$35 $37 $39 $55
	.db $58 $74 $76 $78					;$59 $75 $77 $79
@@state1:
	ld hl,wActiveTriggers
	bit 4,(hl)
	jr nz,+
	bit 0,(hl)
	jr z,+
	set 4,(hl)
; Top-west button
	ld c,$31				;$32
	call nz,_func_5694
+
	ld hl,wActiveTriggers
	bit 5,(hl)
	jr nz,+
	bit 1,(hl)
	jr z,+
	set 5,(hl)
; Bottom-west button
	ld c,$51				;$52
	call nz,_func_5694
+
	ld hl,wActiveTriggers
	bit 6,(hl)
	jr nz,+
	bit 2,(hl)
	jr z,+
	set 6,(hl)
; South-left button
	ld c,$94				;$95
	call nz,_func_56a5
+
	ld hl,wActiveTriggers
	bit 7,(hl)
	jr nz,+
	bit 3,(hl)
	jr z,+
	set 7,(hl)
; South-right button
	ld c,$96				;$97
	call nz,_func_56a5
+
; continues if all triggers have been activated
	ld a,(wActiveTriggers)
	inc a
	ret nz
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,(hl)
	jp nz,interactionDelete
	ld e,Interaction.counter1	;$46
	ld a,60						;$3c
	ld (de),a
	jp interactionIncState
@@state2:
; puzzle is solved by the revelation of center tile
	call interactionDecCounter1
	ret nz
	ld a,TILEINDEX_DUNGEON_a3		;$a3
	call findTileInRoom
	jr nz,+
	ld a,SND_ERROR 					;$5a
	call playSound
	jp interactionDelete
+
; falling key
	ldbc TREASURE_SMALL_KEY $01
	call createTreasure
	call objectCopyPosition
	jp interactionDelete

_func_5694:
	ld b,>wRoomLayout		;$cf
-
	ld a,(bc)
; 2nd armos tile
	cp $26
	ld e,ANGLE_LEFT	;$18
	call z,_func_56b8
; c == tile short position
; reading, going right
	inc c
	ld a,c
	and $0f
	ret z
	jr -
_func_56a5:
	ld b,$cf
-
	ld a,(bc)
; 2nd armos tile
	cp $26
	ld e,ANGLE_DOWN	;$10
	call z,_func_56b8
; c == tile short position
; reading, going up
	ld a,c
	sub $10
	ld c,a
	and $f0
	ret z
	jr -
_func_56b8:
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_D7_4_ARMOS_BUTTON_PUZZLE
	inc l
; subid = $01
	ld (hl),$01
	push bc
	ld l,Interaction.yh		;$4b
	call setShortPosition_paramC
	pop bc
	ld l,Interaction.angle	;$49
	ld (hl),e
	ret
