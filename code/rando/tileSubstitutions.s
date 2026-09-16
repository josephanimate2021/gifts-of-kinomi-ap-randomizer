applyExtraTileSubstitutions: 
	push bc
	push de
	call getThisRoomFlags
	ld e,a
	ld hl,@tileSubTable_dummy
	ld a,(wActiveGroup)
	ld b,a
	ld a,(wActiveRoom)
	ld c,a

@loop:
	ldi a,(hl)
	cp $ff
	jr z,@done
	cp b
	jr nz,@groupMismatch
	ldi a,(hl)
	cp c
	jr nz,@roomMismatch
	ldi a,(hl)
	and e
	jr nz,@flagMismatch
	push de
	ld d,$cf
	ldi a,(hl)
	ld e,a
	ldi a,(hl)
	ld (de),a
	pop de
	jr @loop

@groupMismatch:
	inc hl

@roomMismatch:
	inc hl

@flagMismatch:
	inc hl
	inc hl
	jr @loop

@done:
	pop de
	pop bc
	call applyAllTileSubstitutions
	ret

; Single-tile change data format: group; room; flags; yx; tile.
; "flags" are usually $10 (ROOMFLAG_VISITED) which applies the change always.
@tileSubTable_dummy:
	.db $ff
