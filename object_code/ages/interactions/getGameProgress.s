;;
; @param[out]	b
;			$00 before starting quest
;			$01 if got sword
;			$02 if got satchel
;			$03 if got bracelet
;			$04 if got a trade item
;			$05 if got Harp of Ages
;			$06 if got Cane
;			$07 if got gift
;			$08 if game finished (unlinked only)
;ZerotoK's version
getGameProgress_Ages:
	push de
	ld de,wGameProgress2
	ld hl,@itemTable2
	ldbc $08,$02 ;Essence 2
	jr getGameProgress_Seasons@getProgress
@itemTable2:
	.db TREASURE_CANE_OF_SOMARIA
	.db TREASURE_HARP
	.db TREASURE_TRADEITEM
	.db TREASURE_BRACELET
	.db TREASURE_SEED_SATCHEL
	.db TREASURE_SWORD
	.db $00

;;
; @param[out]	b
;			$00 before starting quest
;			$01 if got sword
;			$02 if got bombs
;			$03 if got boomerang
;			$04	if got Rod of Seasons
;			$05 if got flippers
;			$06 if got feather
;			$07 if got gift
;			$08 if game finished (unlinked only)
;ZerotoK's version
getGameProgress_Seasons:
	push de
	ld de,wGameProgress1
	ld hl,@itemTable1
	ldbc $08,$01 ;Essence 1
@getProgress:
	push hl
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	pop hl
	jr nz,@ret
	dec b
	ld a,(wEssencesObtained)
	and c
	jr nz,@ret

@checkItemObtained:
	dec b
	jr z,@ret
	ldi a,(hl)
	call checkTreasureObtained
	jr nc,@checkItemObtained
	ld a,b
	ld (de),a
@ret:
	pop de
	ret

@itemTable1:
	.db TREASURE_FEATHER
	.db TREASURE_FLIPPERS
	.db TREASURE_ROD_OF_SEASONS
	.db TREASURE_BOOMERANG
	.db TREASURE_BOMBS
	.db TREASURE_SWORD
	.db $00

;;
; @param[out]	b	$00 before beating d3;
;			$01 if beat d3
;			$02 if saved Nayru;
;			$03 if beat d7;
;			$04 if got the maku seed (saw twinrova cutscene);
;			$05 if game finished (unlinked only)
getGameProgress_1:
	ld b,$05
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	ret nz

	dec b
	ld a,GLOBALFLAG_SAW_TWINROVA_BEFORE_ENDGAME
	call checkGlobalFlag
	ret nz

	ld a,TREASURE_ESSENCE
	call checkTreasureObtained
	jr nc,@noEssences

	call getHighestSetBit
	ld c,a
	ld b,$03
	cp $06
	ret nc

	dec b
	ld a,GLOBALFLAG_SAVED_NAYRU
	call checkGlobalFlag
	ret nz

	dec b
	ld a,c
	cp $02
	ret nc

@noEssences:
	ld b,$00
	ret
