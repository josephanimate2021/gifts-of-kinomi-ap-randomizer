; ==================================================================================================
; PART_GROTTO_CRYSTAL
; ==================================================================================================
partCode24:
	push af
;  push de
	ld e,Part.subid
	ld a,(de)
	or a
	jr z,@subid00
;  pop de
	pop af  ; Restore AF

;; Original behavior
	jr z,@normalStatus
	ld a,(wSwitchState)
	ld h,d
	ld l,Part.subid
	xor (hl)
	ld (wSwitchState),a
	ld l,Part.collisionType
	res 7,(hl)
	ld a,$01
	call partSetAnimation
	; sarcophagus when it breaks
	ldbc, INTERAC_SARCOPHAGUS $80
	jp objectCreateInteraction
@normalStatus:
	ld e,Part.state
	ld a,(de)
	or a
	ret nz
	inc a
	ld (de),a
	call getThisRoomFlags
	bit 6,(hl)
	jr z,+
	ld h,d
	ld l,$e4
	res 7,(hl)
	ld a,$01
	call partSetAnimation
+
	call objectMakeTileSolid
	ld h,$cf
	ld (hl),$0a
	jp objectSetVisible83

;; Custom behavior - swaps the player between groups 0 and 1 when struck
@subid00:
;  pop de
	pop af  ; Restore AF

	jr z,@normalStatus01
	ld b,b

	ld a,CUTSCENE_TIMEWARP
	ld (wCutsceneTrigger),a

	ld a,DISABLE_LINK|DISABLE_ENEMIES|DISABLE_8|DISABLE_COMPANION|DISABLE_40
	ld (wDisabledObjects),a
	ld (wDisableLinkCollisionsAndMenu),a
	ld (wcde0),a
	jp clearAllItemsAndPutLinkOnGround
	;jp _specialObjectAnimate

@normalStatus01:
	call objectMakeTileSolid
	ld h,$cf
	ld (hl),$0a
	call objectSetVisible83

	ld e,Part.var2a
	ld a,(de)
	bit 7,a
	ret z
	inc a
	ld a,CUTSCENE_TIMEWARP
	ld (wCutsceneTrigger),a

	ld a,DISABLE_LINK|DISABLE_ENEMIES|DISABLE_8|DISABLE_COMPANION|DISABLE_40
	ld (wDisabledObjects),a
	ld (wDisableLinkCollisionsAndMenu),a
	ld (wcde0),a
	call clearAllItemsAndPutLinkOnGround

	ret
