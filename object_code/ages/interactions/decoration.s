; ==================================================================================================
; INTERAC_DECORATION
; ==================================================================================================
interactionCode80:
	call checkInteractionState
	jr z,@state0

@state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw interactionAnimate
	.dw interactionAnimate
	.dw interactionAnimate
	.dw interactionAnimate
	.dw interactionAnimate
	.dw interactionAnimate
	.dw interactionAnimate
	.dw @deleteIfGotRoomItem
	.dw @deleteIfGotRoomItem
	.dw interactionAnimate
	.dw interactionAnimate
	.dw @setSwordVisibilityAndAnimate
	.dw @setSwordVisibilityAndAnimate

@state0:
	call interactionInitGraphics
	call interactionIncState
	call objectSetVisible83
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @stub
	.dw @deleteIfMoblinsKeepDestroyed
	.dw @stub
	.dw @stub
	.dw @deleteIfRoomFlagBit7Unset
	.dw @stub
	.dw @deleteIfRoomFlagBit7Unset
	.dw @deleteIfGotRoomItem
	.dw @deleteIfGotRoomItem
	.dw @stub
	.dw @subid0a
	.dw @setSwordVisibility
	.dw @setSwordVisibility

@stub:
	ret

; Subid $01 (moblin's keep flag)
@deleteIfMoblinsKeepDestroyed:
	ld a,(wPastRoomFlags + <ROOM_AGES_120)
	bit ROOMFLAG_BIT_LAYOUTSWAP,a
	ret z
	jp interactionDelete

; Subid $04, $06 (scent seedling & tokay eyeball)
@deleteIfRoomFlagBit7Unset:
	call getThisRoomFlags
	bit 7,a
	ret nz
	jp interactionDelete

@deleteIfGotRoomItem:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	ret z
	jp interactionDelete

@setSwordVisibilityAndAnimate:
	call interactionAnimate
@setSwordVisibility:
	ld a,(wSwordLevel)
	ld b,a
	ld a,(de)
	sub $09
	cp b
	jp z,objectSetInvisible
	jp objectSetVisiblec3


; Fountain "stream": decide which palette to used based on whether this is the "ruined"
; symmetry city or not
@subid0a:
	call objectSetVisible80
	call @isSymmetryCityRoom
	jr c,@isSymmetryCity

@normalPalette:
	ld a,PALH_7d
	jp loadPaletteHeader

@isSymmetryCity:
	ld a,(wActiveGroup)
	or a
	jr nz,@ruinedSymmetryPalette
	call getThisRoomFlags
	and $01
	jr nz,@normalPalette

@ruinedSymmetryPalette:
	ld a,PALH_7c
	jp loadPaletteHeader

@isSymmetryCityRoom:
	ld a,(wActiveRoom)
	ld e,a
	ld hl,@symmetryCityRooms
	jp lookupKey

@symmetryCityRooms:
	.db $12 $00
	.db $13 $00
	.db $14 $00
	.db $00


; ==============================================================================
; INTERACID_SWORDS_DECORATION
; ==============================================================================
interactionCode85:
	ld e,Interaction.enabled
	ld a,(de)
	or $80
	ld (de),a
	ld e,Interaction.state
	ld a,(de)

	rst_jumpTable
	.dw @checkObtainedSword
	.dw @spawnSword

@checkObtainedSword:
	ld e,Interaction.subid
	ld a,(de)	;subid
	ld b,a
	ld a,(wSwordLevel)
	dec a
	cp b
	jp c,interactionIncState		;nz if don't have sword, inc state
	;delete sword
	ld e,Interaction.relatedObj1
	ld a,(de)
	ld d,a
	jp objectSetInvisible

@spawnSword:
	xor a
	ld (de),a
	ld e,Interaction.relatedObj1
	ld a,(de)
	or a
	jr nz,+
;spawn the sword
	ld e,Interaction.subid
	ld a,(de)	;subid
	ld c,a
	ld b,TREASURE_SWORD
	call createTreasure
	call objectCopyPosition

	ld e,Interaction.relatedObj1;+1
	;ld a,l
	;and $40
	;ld (de),a
	;dec e
	ld a,h
	ld (de),a

	ld e,Interaction.var03
	ld a,$ff
	ld (de),a
	ret
+
	;ld e,Interaction.relatedObj1
	ld a,(de)
	ld d,a
	jp objectSetVisiblec0
