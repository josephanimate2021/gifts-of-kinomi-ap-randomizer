;;
; @param[out]	b
;			$00 before starting quest
;			$01 if got sword
;			$02 if got satchel
;			$03 if got a trade item
;			$04 if got Harp of Ages
;			$05 if got Cane
;			$06 if got Power Gloves
;			$07 if got gift
;			$08 if got both gifts
;			$09 if game finished (unlinked only)
;ZerotoK's version
getGameProgress_Ages:
	ld hl,@itemTable2
	ldbc $09,$01 ;Essence 1
	call getGameProgress_Seasons@getProgress
	jr z,+
	dec b
	ld a,(wBraceletLevel)
	cpa $02
	call c,getGameProgress_Seasons@checkItemObtained
+
	ld a,b
	ld (wGameProgress1),a
	ret
@itemTable2:
	.db TREASURE_CANE_OF_SOMARIA
	.db TREASURE_HARP
	.db TREASURE_TRADEITEM
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
;			$08 if got both gifts
;			$09 if game finished (unlinked only)
;ZerotoK's version
getGameProgress_Seasons:
	ld hl,@itemTable1
	ldbc $09,$02 ;Essence 2
	call @getProgress
	call nz,@checkItemObtained
	ld a,b
	ld (wGameProgress2),a
	ret

@getProgress:
	push hl
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	pop hl
	ret nz

	dec b
	ld a,(wEssencesObtained)
	xor %00000011
	ret z ; return if all obtained

	dec b
	xor c ; should be $00 if right one obtained
	ret 


@checkItemObtained:
	dec b
	ret z
	;ret z

	ldi a,(hl)
	call checkTreasureObtained
	jr nc,@checkItemObtained
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
