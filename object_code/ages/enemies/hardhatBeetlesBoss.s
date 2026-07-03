; ==============================================================================
; ENEMYID_HARDHAT_BEETLES_BOSS
;
; Variables:
;   counter1: number of beetles left
;   var30/var31:
;   var32:
;   var39: nonzero if all beetles defeated
; ==============================================================================

enemyCode7e:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_80,(hl)
	ret nz
	ld e,Enemy.var39
	ld a,(de)
	or a
	jr z,@normalStatus
	jp @bossDead

@normalStatus
	ld e,Enemy.state
	ld a,(de)
	rst_jumpTable
	.dw @state_uninitialized
	.dw @state0
	.dw @state1
	.dw @state2

@state_uninitialized:
	call enemyBoss_initializeRoomWithoutExtraGfx
	jp ecom_incState

@state0:
	callab commonInteractions1.clearFallDownHoleEventBuffer
	call ecom_incState
	ld l,Enemy.counter1
	ld (hl),60
	ret

@state1:
	call ecom_decCounter1
	ret nz

	; Determine total number of beetles (4 or 8) and write that to counter1
	ld (hl),$08
	call ecom_incState

	ld c,$44
	call @spawnBeetle
	ld c,$4a
	call @spawnBeetle
	ld c,$75
	call @spawnBeetle
	ld c,$78
	call @spawnBeetle
	jp enemyBoss_beginBoss
@spawnBeetle:
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_PUFF
	ld l,Interaction.yh
	call setShortPosition_paramC
	call getFreeEnemySlot
	ret nz
	ld (hl),ENEMY_HARMLESS_HARDHAT_BEETLE
	ld l,Enemy.yh
	call setShortPosition_paramC
	xor a
	ret

@state2:

	; Check which objects have fallen into holes
	ld hl,wTmpcfc0.fallDownHoleEvent.cfd8+1
	ld b,$04
---
	ldi a,(hl)
	cp ENEMY_HARMLESS_HARDHAT_BEETLE
	jr nz,@nextFallenObject

	call ecom_decCounter1
	jr z,@allBeetlesKilled
	ld a,(hl)
	cp $04
	jr c,++
	ld l,Enemy.var3a
	inc (hl)
++

@nextFallenObject:
	inc l
	dec b
	jr nz,---

	ld e,Enemy.var3a
	ld a,(de)
	or a
	jr z,++

	; Killed one of the first 4 beetles; spawn another.
	ld e,Enemy.var3b
	ld a,(de)
	ld hl,@extraBeetlePositions
	rst_addAToHl
	ld c,(hl)
	call @spawnBeetle
	jr nz,++
	ld h,d
	ld l,Enemy.var3a
	dec (hl)
	inc l
	inc (hl)
++
	jpab commonInteractions1.clearFallDownHoleEventBuffer

@allBeetlesKilled:
	; Set parent object's "var39" to indicate that the game's over
	ld l,Enemy.var39
	inc (hl)
	ret

@extraBeetlePositions:
	.db $4a $57 $75 $78

@bossDead:
	ld e,Enemy.substate
	ld a,(de)
	rst_jumpTable
	.dw substate0
	.dw substate1

substate0:
	ld h,d
	ld l,Enemy.counter1
	ld (hl),120
	ld a,$01
	ld (wDisableLinkCollisionsAndMenu),a
	ld a,SND_BOSS_DEAD
	call playSound
	jp ecom_incSubstate

substate1:
	call ecom_decCounter1
	ret nz

	call getFreePartSlot
	ret nz
	ld (hl),PART_BOSS_DEATH_EXPLOSION
	inc l
	ld e,Enemy.id
	ld a,(de)
	ld (hl),a ; [Part.subid] = [Enemy.id]

	call objectCopyPosition
	call markEnemyAsKilledInRoom

	ld e,Enemy.id
	ld a,(de)
	sub $08
	cp $68
	jr c,++
	ld a,(wActiveMusic2)
	ld (wActiveMusic),a
	call playSound
++
	jp enemyDelete
