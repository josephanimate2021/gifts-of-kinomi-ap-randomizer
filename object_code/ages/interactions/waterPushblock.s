; ==================================================================================================
; INTERAC_WATER_PUSHBLOCK
; ==================================================================================================
interactionCode9e:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1

@subid0:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @subid0State0
	.dw @state1
	.dw @state2
	.dw @subid0State3
	.dw objectPreventLinkFromPassing

@subid0State0:
	call getThisRoomFlags
	and $01
	jp z,interactionDelete

@initialize:
	call interactionInitGraphics
	call objectMarkSolidPosition
	ld a,$06
	call objectSetCollideRadius

	ld l,Interaction.speed
	ld (hl),SPEED_80
	ld l,Interaction.counter1
	ld (hl),30

	call objectSetVisible82
	jp interactionIncState


; Check if Link is pushing against the block
@state1:
	call objectPreventLinkFromPassing
	jr nc,@@notPushing
	call objectCheckLinkPushingAgainstCenter
	jr nc,@@notPushing

	; Link is pushing against in
	ld a,$01
	ld (wForceLinkPushAnimation),a
	call interactionDecCounter1
	ret nz
	jr @@pushedLongEnough

@@notPushing:
	ld e,Interaction.counter1
	ld a,30
	ld (de),a
	ret

@@pushedLongEnough:
	ld c,$28
	call objectCheckLinkWithinDistance
	ld b,a
	ld e,Interaction.subid
	ld a,(de)
	or a
	ld c,$02
	jr z,+
	ld c,$06
+
	ld a,b
	cp c
	ret nz
	ld e,Interaction.direction
	xor $04
	ld (de),a

	ld h,d
	ld l,Interaction.direction
	ld a,(hl)
	add a
	add a
	ld l,Interaction.angle
	ld (hl),a

	ld l,Interaction.counter1
	ld (hl),$20  ;$40

	ld a,DISABLE_ALL_BUT_INTERACTIONS | DISABLE_LINK
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	ld a,SNDCTRL_STOPMUSIC
	call playSound
	ld a,SND_MOVEBLOCK
	call playSound
	jp interactionIncState


; Link has pushed the block; waiting for it to move to the other side
@state2:
	call objectApplySpeed
	call objectPreventLinkFromPassing
	call interactionDecCounter1
	ret nz
	ld (hl),70
	jp interactionIncState


; Pushed block from right to left
@subid0State3:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @substate0
	.dw @substate1
	.dw @subid0Substate2
	.dw @substate3
	.dw @substate4
	.dw @subid0Substate5
	.dw @substate6
	.dw @subid0Substate7

@substate0:
	call interactionDecCounter1
	ret nz
	ld (hl),$08

	call interactionIncSubstate
	call objectSetReservedBit1
	ld a,$01
	ld (wScreenShakeMagnitude),a
	ld hl,mainScripts.waterPushblock_screenShake
	call interactionSetScript
	jp @setState0eDisableAllSorts

@substate1:
	ld a,(wActiveRoom)
	cp <ROOM_AGES_120
	jp nz,interactionDelete
	call interactionRunScript
	ret nc

	ld a,SND_FLOODGATES
	call playSound
	jp interactionIncSubstate

@subid0Substate2:
	call interactionIncSubstate
	ld hl,scriptHelp.simpleScript_waterfallFillingAbove
	jp interactionSetSimpleScript

@substate3:
	call @runScriptWhenCounterZero
	ret nz
	call interactionRunSimpleScript
	ret nc
	jp interactionIncSubstate

@substate4:
;	call interactionDecCounter1
;	ret nz
	ld (hl),$08
	call interactionIncSubstate

	ld a,<ROOM_AGES_130
	ld b,DIR_DOWN
	call loadRoomWithDirection
	jp @disableAllSorts

@subid0Substate5:
	ld a,(wScrollMode)		;$cd00
	and $01
	ret z
	call objectSetInvisible

	call interactionIncSubstate
	ld hl,scriptHelp.simpleScript_waterfallFillingBelow
	jp interactionSetSimpleScript

@substate6:
	ld a,60
	call setScreenShakeCounter

	call @runScriptWhenCounterZero
	ret nz
	call interactionRunSimpleScript
	ret nc
	jp interactionIncSubstate

@subid0Substate7:
	ld hl,@subid0WarpDestVariables
	call setWarpDestVariables
	jp @playPuzzleSound

@subid0WarpDestVariables:
	.db $80|>ROOM_AGES_120 <ROOM_AGES_120 $01 $55 $03					;$c0 $0d $01 $23 $03

@playPuzzleSound:
	ld a,SNDCTRL_STOPSFX
	call playSound
	ld a,SND_SOLVEPUZZLE
	call playSound

	ld a,(wActiveMusic)
	call playSound
	xor a
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	call @swapRoomLayouts
	jp interactionIncState

@runScriptWhenCounterZero:
	ld h,d
	ld l,Interaction.counter1		;$46
	ld a,(hl)
	or a
	ret z
	dec (hl)
	ret

@setState0eDisableAllSorts:
	ld a,LINK_STATE_0e
	ld (wLinkForceState),a
@disableAllSorts:
	ld a,$01
	ld (wMenuDisabled),a		;$cc02
	ld (wcc8b),a				;$cca5
	ld a,$ff
	ld (wDisabledObjects),a		;$cca4
	jp interactionSetAlwaysUpdateBit

@subid1:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @subid1State0
	.dw @state1
	.dw @state2
	.dw @subid1State3
	.dw objectPreventLinkFromPassing

@subid1State0:
	call getThisRoomFlags
	and $01
	jp nz,interactionDelete
	jp @initialize

; Pushed block from left to right
@subid1State3:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @substate0
	.dw @substate1
	.dw @subid1Substate2
	.dw @substate3
	.dw @substate4
	.dw @subid1Substate5
	.dw @substate6
	.dw @subid1Substate7

@subid1Substate2:
	call interactionIncSubstate
	ld hl,scriptHelp.simpleScript_waterfallEmptyingAbove
	jp interactionSetSimpleScript

@subid1Substate5:
	ld a,(wScrollMode)		;$cd00
	and $01
	ret z
	call objectSetInvisible

	call interactionIncSubstate
	ld hl,scriptHelp.simpleScript_waterfallEmptyingBelow
	jp interactionSetSimpleScript

@subid1Substate7:
	call interactionRunSimpleScript
	ret nc
	ld hl,@subid1WarpDestVariables
	call setWarpDestVariables
	jp @playPuzzleSound

@subid1WarpDestVariables:
	.db $80|>ROOM_AGES_120 <ROOM_AGES_120 $01 $52 $03					;$c0 $0d $01 $23 $03

;;
; Swap the room layouts in all rooms affected by the flooding.
@swapRoomLayouts:
	call getThisRoomFlags
	ld bc,$000f
	ld l,<ROOM_AGES_120
	call @@xor
	add hl,bc	;130
	call @@xor
	add hl,bc	;140
	call @@xor
	add hl,bc	;150
	call @@xor
	add hl,bc	;160
	call @@xor

	dec h
	ld l,<ROOM_AGES_020
	call @@xor
	add hl,bc	;030
	call @@xor
	add hl,bc	;040
	call @@xor
	add hl,bc	;050
	call @@xor
	call @@xor
	call @@xor
	call @@xor
	ld l,<ROOM_AGES_060
	call @@xor
	call @@xor
	call @@xor
	call @@xor
	ld l,<ROOM_AGES_070
	call @@xor
	call @@xor
	call @@xor

@@xor:
	ld a,(hl)
	xor ROOMFLAG_LAYOUTSWAP
	ldi (hl),a
	ret
