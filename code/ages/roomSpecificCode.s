;;
runRoomSpecificCode:
	ld a,GLOBALFLAG_MAKE_MENU_ERROR
	call unsetGlobalFlag
	ld a,(wActiveRoom)
	ld hl, _roomSpecificCodeGroupTable
	call findRoomSpecificData
	ret nc
	rst_jumpTable
	.dw _disableMapMenu
	.dw _setMinimapVars_Group3Map08
	.dw _setMinimapVars_Group3Map18
	.dw _setMinimapVars_Group3Map78
	.dw _setMinimapVars_Group0Map78
	.dw _setMinimapVars_Group3Map79
	.dw _setRoomFlags_Group5Map30
	.dw _setMinimapVars_Group0Map77
	.dw _setMinimapVars_Group1Map02
;	.dw _roomSpecificCode5
;	.dw setDeathRespawnPoint
;	.dw _roomSpecificCode7
;	.dw _roomSpecificCode8
;	.dw _roomSpecificCode9
;	.dw _roomSpecificCodeA
;	.dw _roomSpecificCodeB
;	.dw _roomSpecificCodeC

	; Random stub not called by anything?
	ret

_roomSpecificCodeGroupTable:
	.dw _roomSpecificCodeGroup0Table
	.dw _roomSpecificCodeGroup1Table
	.dw _roomSpecificCodeGroup2Table
	.dw _roomSpecificCodeGroup3Table
	.dw _roomSpecificCodeGroup4Table
	.dw _roomSpecificCodeGroup5Table
	.dw _roomSpecificCodeGroup6Table
	.dw _roomSpecificCodeGroup7Table

; Format: room index

_roomSpecificCodeGroup0Table:
	.db <ROOM_AGES_008 $00
	.db <ROOM_AGES_018 $00
	.db <ROOM_AGES_028 $00
	.db <ROOM_AGES_038 $00
	.db <ROOM_AGES_068 $00
	.db <ROOM_AGES_078 $04
	.db <ROOM_AGES_084 $07
	.db <ROOM_AGES_085 $07
	.db <ROOM_AGES_086 $07
	.db <ROOM_AGES_087 $07
;	.db $93 $00
;	.db $38 $06
;	.db $39 $08
;	.db $3a $09
	.db $00
_roomSpecificCodeGroup1Table:
	.db <ROOM_AGES_103 $08
	.db <ROOM_AGES_113 $08
	.db <ROOM_AGES_123 $08
;	.db $81 $03
;	.db $38 $06
;	.db $97 $07
;	.db $0e $0a
	.db $00
_roomSpecificCodeGroup2Table:
;	.db $0e $05
	.db $00
_roomSpecificCodeGroup3Table:
	.db $49 $00
	.db $59 $00
	.db $58 $00
	.db $68 $00
	.db $1a $00
	.db $08 $01
	.db $18 $02
	.db $78 $03
	.db $79 $05

;	.db $0f $0b
	.db $00
_roomSpecificCodeGroup4Table:
;	.db $60 $01
;	.db $52 $02
;	.db $e6 $0c
	.db $00
_roomSpecificCodeGroup5Table:
	.db $30 $06
	.db $3c $06
	.db $20 $06
	.db $14 $06
;	.db $d2 $04
_roomSpecificCodeGroup6Table:
_roomSpecificCodeGroup7Table:
	.db $00

;;
_disableMapMenu:
	ld a,GLOBALFLAG_MAKE_MENU_ERROR
	jp setGlobalFlag

;;
_setMinimapVars_Group3Map08:
	ld a,$24
_setMiniMapVarsGroup0:
	ld b,$00
_setMiniMapVars:
	ld hl,wMinimapRoom
	ldd (hl),a
	ld (hl),b
	ret

_setMinimapVars_Group3Map18:
	ld a,<ROOM_AGES_016
	jr _setMiniMapVarsGroup0

_setMinimapVars_Group3Map78:
	ld a,<ROOM_AGES_027
	jr _setMiniMapVarsGroup0

_setMinimapVars_Group3Map79:
	ld a,<ROOM_AGES_006
	jr _setMiniMapVarsGroup0
	
_setMinimapVars_Group0Map78:
	ld a,GLOBALFLAG_DONT_UPDATE_MINIMAP
	call setGlobalFlag
_setMinimapVars_Group0Map77:
	ld a,<ROOM_AGES_077
	jr _setMiniMapVarsGroup0


_setMinimapVars_Group1Map02:
	ld a,<ROOM_AGES_102
	ld b,>ROOM_AGES_102
	jr _setMiniMapVars


_setRoomFlags_Group5Map30:
	call getThisRoomFlags
	and ROOMFLAG_80
	ret z

	ld l,$14
	set ROOMFLAG_BIT_80,(hl)
	ld l,$20
	set ROOMFLAG_BIT_80,(hl)
	;ld l,$30
	;set ROOMFLAG_BIT_80,(hl)
	ld l,$3c
	set ROOMFLAG_BIT_80,(hl)

	ld hl,wRoomLayout + $1c
  	ld (hl),$47
	ret


/*
;;
;_roomSpecificCode0:
	ld a,GLOBALFLAG_WON_FAIRY_HIDING_GAME
	call checkGlobalFlag
	ret nz
	ld hl,$cfd0
	ld b,$10
	jp clearMemory

;;
;_roomSpecificCode1:
	ld a, GLOBALFLAG_D3_CRYSTALS
	call checkGlobalFlag
	ret nz
---
	; Create spinner object
	call getFreeInteractionSlot
	ret nz
	ld (hl),$7d
	ld l,Interaction.yh
	ld (hl),$57
	ld l,Interaction.xh
	ld (hl),$01
	ret

;;
;_roomSpecificCode2:
	ld a,GLOBALFLAG_D3_CRYSTALS
	call checkGlobalFlag
	ret z
	; Create spinner if the flag is UNset
	jr ---

;;
;_roomSpecificCode3:
	call getThisRoomFlags
	bit 6,a
	ret nz
	ld a,TREASURE_MYSTERY_SEEDS
	call checkTreasureObtained
	ret nc
	ld hl,wcc05
	res 1,(hl)
	call getFreeInteractionSlot
	ret nz
	ld (hl),$40
	inc l
	ld (hl),$0a
	ld a,$01
	ld (wDiggingUpEnemiesForbidden),a
	ret

;;
_roomSpecificCode7:
	ld a,GLOBALFLAG_GAVE_ROPE_TO_RAFTON
	call checkGlobalFlag
	ret z
	call getThisRoomFlags
	bit 6,a
	ret nz
	ld a,MUS_RALPH
	ld (wActiveMusic2),a
	ret

;;
_roomSpecificCode5:
	ld a,GLOBALFLAG_SAVED_NAYRU
	call checkGlobalFlag
	ret nz
	ld a,MUS_SADNESS
	ld (wActiveMusic2),a
	ret

;;
; Something in ambi's palace
;_roomSpecificCode4:
	ld a,$06
	ld (wMinimapRoom),a
	ld hl,wPastRoomFlags+$06
	set 4,(hl)
	ret

;;
; Check to play ralph music for ralph entering portal cutscene
_roomSpecificCode8:
	ld a,(wScreenTransitionDirection)
	cp DIR_RIGHT
	ret nz
	ld a, GLOBALFLAG_RALPH_ENTERED_PORTAL
	call checkGlobalFlag
	ret nz
	ld a, MUS_RALPH
	ld (wActiveMusic2),a
	ret

;;
; Play nayru music on impa's house screen, for some reason
_roomSpecificCode9:
	ld a,GLOBALFLAG_FINISHEDGAME
	call checkGlobalFlag
	ret z
	ld a, MUS_NAYRU
	ld (wActiveMusic2),a
	ret

;;
; Correct minimap in mermaid's cave present
_roomSpecificCodeA:
	ld hl,wMinimapGroup
	ld (hl),$00
	inc l
	ld (hl),$3c
	ret

;;
; Correct minimap in mermaid's cave past
_roomSpecificCodeB:
	ld hl,wMinimapGroup
	ld (hl),$01
	inc l
	ld (hl),$3c
	ret

;;
; Something happening on vire black tower screen
_roomSpecificCodeC:
	ld hl,wActiveMusic
	ld a,(hl)
	or a
	ret nz
	ld (hl),$ff
	ret
*/