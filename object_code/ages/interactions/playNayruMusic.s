; ==================================================================================================
; INTERAC_PLAY_NAYRU_MUSIC
; ==================================================================================================
interactionCode2f:
/*
	ld a,GLOBALFLAG_INTRO_DONE
	call checkGlobalFlag
	jp nz,interactionDelete
*/
	ld hl,wActiveMusic
	ld a,MUS_LEVEL6 ; Seasons shrine
	cp (hl)
	jr z,+

	ld (hl),a
	call playSound
+
	ld a,(wDungeonIndex)
	inc a ; Outdoors
	ld a,$02
	jr z,+
	inc a
+
	call setMusicVolume
	jp interactionDelete
