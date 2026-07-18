; ==============================================================================
; ENEMY_GLEEOK
; ==============================================================================
enemyCode7d:
	jr z,@normalStatus
	sub $03
	ret c
	jr nz,@normalStatus
	ld e,Enemy.subid
	ld a,(de)
	dec a
	jp z,enemyBoss_dead
	ld e,Enemy.collisionType ;$a4
	ld a,(de)
	or a
	jp z,enemyDie_uncounted_withoutItemDrop
	ld e,Enemy.subid
	ld a,(de)
	cp $02
	ld b,$02
	jr z,+
	ld b,$04
+
	ld a,$38		;var38
	call objectGetRelatedObject1Var
	ld a,(hl)
	or b
	ld (hl),a
	ld e,Enemy.state
	ld a,(de)
	cp $0b
	jr nz,+
	ld e,Enemy.var03 ;$83
	ld a,(de)
	cp $03
	jr nc,+
;if at state 0b and var03 is less than 03
	ld e,Enemy.subid ;$82
	ld a,(de)
	xor $01
	add $ae
	ld l,a
	ld h,(hl)
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $0b
	jr nz,+
	inc (hl)
+
	ld h,d
	ld l,Enemy.state ;$84
	ld (hl),$0e
	ld l,Enemy.collisionType; $a4
	set 7,(hl)
	inc l
	ld (hl),$04
	ld l,Enemy.health ;$a9
	ld (hl),$19
	ld l,Enemy.knockbackAngle ;$ac
	ld a,(hl)
	ld l,Enemy.angle ;$89
	ld (hl),a
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_200 ;$50
	ld l,Enemy.counter1 ;$86
	ld (hl),150 ;$96
	xor a
	jp enemySetAnimation

@normalStatus:
	call ecom_getSubidAndCpStateTo08
	jr nc,+
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
+
	dec b
	ld a,b
	rst_jumpTable
	.dw @subid1
	.dw @subid2
	.dw @subid3
	.dw @subid4
	.dw @subid5
	.dw @subid6
	.dw @subid7
	.dw @subid8
	.dw @subid9

@state0:
	ld a,b
	or a
	jp z,+
	call ecom_setSpeedAndState8AndVisible
	jp func_6c6b
+
	inc a
	ld (de),a
	ld a,ENEMY_GLEEOK
	ld b,$87
	call enemyBoss_initializeRoom

@state1:
	ld b,$09
	call checkBEnemySlotsAvailable
	ret nz
	ld b,ENEMY_GLEEOK
	call ecom_spawnUncountedEnemyWithSubid01
	ld l,$80
	ld e,l
	ld a,(de)
	ld (hl),a
	ld l,Enemy.var30 ;$b0
	ld c,h
	ld e,$08
-
	push hl
	call ecom_spawnUncountedEnemyWithSubid01
	ld a,$0a
	sub e
	ld (hl),a
	ld l,Enemy.relatedObj1 ;$96
	ld a,$80
	ldi (hl),a
	ld (hl),c
	ld a,h
	pop hl
	ldi (hl),a
	dec e
	jr nz,-
	jp enemyDelete

@stateStub:
	ret

@subid1:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@state9
	.dw @@stateA
	.dw @@stateB
	.dw @@stateC
	.dw @@stateD
	.dw @@stateE
	.dw @@stateF
	.dw @@stateG
	
@@state8:
	ld a,(wcc93)
	or a
	ret nz
	ld h,d
	ld l,e
	inc (hl)
	ld a,MUS_BOSS ;$2e
	ld (wActiveMusic),a
	jp playSound
	
@@state9:
	ld e,Enemy.var38 ;$b8
	ld a,(de)
	bit 1,a
	jr z,@@animate
	bit 2,a
	jr z,@@animate
	ld h,d
	ld l,Enemy.state ;$84
	inc (hl)
	ld l,Enemy.counter2 ;$87
	ld (hl),60 ;$3c
	ld e,Enemy.var30 ;$b0
	ld a,(de)
	ld h,a
	ld l,Enemy.health ;$a9
	xor a
	ld (hl),a
	ld l,Enemy.collisionType ;$a4
	ld (hl),a
	inc e
	ld a,(de)
	ld h,a
	xor a
	ld (hl),a
	ld l,Enemy.health ;$a9
	ld (hl),a
	ld hl,$ce16
	xor a
	ldi (hl),a
	ldi (hl),a
	ld (hl),a
	ld l,$26
	ldi (hl),a
	ldi (hl),a
	ld (hl),a
	ld a,SND_BOSS_DEAD ;$67
	call playSound
	ld a,SNDCTRL_STOPMUSIC ;$f0
	jp playSound
	
@@stateA:
	call ecom_decCounter2
	jp nz,ecom_flickerVisibility
	ld bc,$020c
	call enemyBoss_spawnShadow
	jp nz,ecom_flickerVisibility
	ld h,d
	ld l,Enemy.state ;$84
	inc (hl)
	ld l,Enemy.counter1 ;$86
	ld (hl),30 ;$1e
	ld a,$04
	call enemySetAnimation
	
@@stateB:
	call ecom_decCounter1
	jp nz,ecom_flickerVisibility
	inc (hl)
	ld l,e
	inc (hl)
	ld l,Enemy.collisionType ;$a4
	set 7,(hl)
	ld a,MUS_BOSS ;$2e
	ld (wActiveMusic),a
	call playSound
	ld e,Enemy.state ;$84
	
@@stateC:
	call ecom_decCounter1
	jr nz,+
	ld l,e
	inc (hl)
	ld bc,$fdc0
	call objectSetSpeedZ
	jp objectSetVisible81
+
	ld a,(hl)
	cp 10 ;$0a
	ret c

@@animate:
	jp enemyAnimate
	
@@stateD:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz
	ld l,Enemy.state ;$84
	inc (hl)
	ld l,Enemy.counter1 ;$86
	ld (hl),150 ;$96
	ld a,120 ;$78
	call setScreenShakeCounter
	call objectSetVisible82
	ld a,SND_STRONG_POUND ;$81
	jp playSound
	
@@stateE:
	call ecom_decCounter1
	jr z,+
	ld a,(hl)
	cp 135 ;$87
	jr c,@@animate
	ld a,($d00f)		;w1Link.zh
	rlca
	ret c
	ld hl,wLinkForceState ;$cc6a
	ld a,LINK_STATE_COLLAPSED ;$14
	ldi (hl),a		;wcc50
	ld (hl),$00
	ret
+
	ld l,e
	inc (hl)
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_200 ;$50
	call ecom_updateAngleTowardTarget
	jr @@animate
	
@@stateF:
	ld a,$01
	call ecom_getSideviewAdjacentWallsBitset
	jr nz,+
	call objectApplySpeed
	jr @@animate
+
	ld a,40 ;$28
	call setScreenShakeCounter
	ld h,d
	ld l,Enemy.state ;$84
	inc (hl)
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_80 ;$14
	ld l,Enemy.angle ;$89
	ld a,(hl)
	xor $10
	ld (hl),a
	ld bc,$fe80
	call objectSetSpeedZ
	jr @@animate
	
@@stateG:
	call ecom_applyVelocityForSideviewEnemyNoHoles
	ld c,$20
	call objectUpdateSpeedZ_paramC
	jr nz,@@animate
	ld l,Enemy.state ;$84
	ld (hl),$0c
	ld l,Enemy.counter1 ;$86
	ld (hl),60 ;$3c
	jr @@animate

@subid2:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@incStateWhenCounter1Is0
	.dw @@stateA
	.dw @@stateB
	.dw @@stateC
	.dw @@stateD
	.dw @@stateE
	.dw @@stateF
	.dw @@incStateWhenCounter1Is0
	.dw @@stateH
	
@@state8:
	ld h,d
	ld l,Enemy.angle
	ld (hl),$14		;southwest (down-left)
@@incStateEnableCollisionsSetCounterAndSpeed:
	ld l,e
	inc (hl)
	ld l,Enemy.collisionType
	set 7,(hl)
	ld l,Enemy.counter1
	ld (hl),60 ;$3c
	ld l,Enemy.speed
	ld (hl),SPEED_80
	ret
	
@@incStateWhenCounter1Is0:
	call ecom_decCounter1
	jp nz,objectApplySpeed
	ld l,e
	inc (hl)
	ret
	
@@stateA:
	ld b,$04
@@func_6905:
	ld a,$38		;Realated Object1's var38
	call objectGetRelatedObject1Var
	ld a,(hl)
	and b
	ld c,$03
	ld l,Enemy.var38 ;$b8
	jr nz,+
	bit 0,(hl)
	jr nz,++
	ld e,Enemy.subid ;$82
	ld a,(de)
	cp $03
	jr z,+
	ld b,h
	ld l,Enemy.var31 ;$b1
	ld h,(hl)
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $10
	ld h,b
	jr nc,+
	ldh a,(<hEnemyTargetX)
	cp $78
	jr nc,++
+
	ld l,Enemy.var38 ;$b8
	set 0,(hl)
	ld c,$00
++
	ldh a,(<hEnemyTargetY)
	cp $58
	ld b,$00
	jr c,+
	ld b,$02
	sub $70
	cp $40
	jr c,+
	call getRandomNumber
	and $01
	inc a
	ld b,a
+
	ld h,d
	ld l,Enemy.var03 ;$83
	ld a,c
	add b
	ld (hl),a
	ld l,Enemy.state ;$84
	inc (hl)
	inc l
	ld (hl),$00
	ret
	
@@stateB:
	ld e,Enemy.var03
	ld a,(de)
	ld e,Enemy.substate
	rst_jumpTable
	.dw @@@var03_00
	.dw @@@var03_01
	.dw @@@var03_02
	.dw @@@var03_03
	.dw @@@var03_04
	.dw @@@var03_05

@@@var03_00:
	ld a,(de)
	rst_jumpTable
	.dw @@@@substate0
	.dw @@@@substate1
	.dw @@@@substate2
	
@@@@substate0:
	ld bc,$3a60
	ld h,d
	ld l,Enemy.subid ;$82
	ld a,(hl)
	cp $02
	jr z,+
	ld c,$90
+
	ld l,Enemy.yh ;$8b
	ldi a,(hl)
	ldh (<hFF8F),a		;Enemy.yh
	inc l
	ld a,(hl)
	ldh (<hFF8E),a		;Enemy.xh
	cp c
	jr nz,+
	ldh a,(<hFF8F)		;Enemy.yh
	cp b
	jr z,++
+
	jp ecom_moveTowardPosition
++
	ld l,e		;Enemy.substate
	inc (hl)
	ret
	
@@@@substate1:
	ld h,d
	ld l,e		;Enemy.substate
	inc (hl)	;substate 2
	inc l		;Enemy.counter1
	ld (hl),30 ;$1e
	ld a,$01
	jp enemySetAnimation
	
@@@@substate2:
	call ecom_decCounter1
	jr z,+
	ld a,(hl)
	cp $08
	ret nz
	ld l,Enemy.yh ;$8b
	ld a,(hl)
	sub $04
	ld (hl),a
	ld b,PART_GLEEOK_FIRE; PART_43
	jp ecom_spawnProjectile
+
	ld l,Enemy.yh ;$8b
	ld a,(hl)
	add $04
	ld (hl),a
@@@func_69bc:
	ld a,$38		;Related Object's var38
	call objectGetRelatedObject1Var
	res 0,(hl)
	ld e,Enemy.subid ;$82
	ld a,(de)
	sub $02
	xor $01
	add $b0
	ld l,a
	ld h,(hl)
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $0b
	jr nz,+
	inc (hl)
+
	ld h,d
	ld e,l
	inc (hl)
	ld l,Enemy.subid ;$82
	ld a,(hl)
	cp $02
	ret nz
	jp @@stateC

@@@var03_01:
	ld a,(de)
	rst_jumpTable
	.dw @@@@substate0
	.dw @@@@substate1
	.dw @@@@substate2
	
@@@@substate0:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.counter1 ;$86
	ld (hl),40 ;$28
	ld a,$01
	jp enemySetAnimation
	
@@@@substate1:
	call ecom_decCounter1
	ret nz
	ld (hl),65 ;$41
	ld l,e
	inc (hl)
	ld l,Enemy.var39 ;$b9
	ldh a,(<hEnemyTargetY)
	ldi (hl),a
	ldh a,(<hEnemyTargetX)
	ld (hl),a
	ret
	
@@@@substate2:
	call ecom_decCounter1
	jr z,@@@func_69bc
	ld a,(hl)		;Enemy.subid
	and $0f
	jr z,+
	cp $08
	ret nz
	ld l,Enemy.yh ;$8b
	ld a,(hl)
	add $02
	ld (hl),a
	ret
+
	ld l,Enemy.yh ;$8b
	ld a,(hl)
	sub $02
	ld (hl),a
	call getFreePartSlot
	ret nz
	ld (hl),PART_GLEEOK_FIRE; PART_43
	inc l
	inc (hl)
	ld e,Enemy.counter1 ;$86
	ld a,(de)
	and $30
	swap a
	ld bc,@@@@table_6a54
	call addDoubleIndexToBc
	ld e,Enemy.var39 ;$b9
	ld a,(de)
	ld e,a
	ld a,(bc)
	add e
	ld l,$cb		;Related object's yh?
	ldi (hl),a
	inc l
	inc bc
	ld e,Enemy.var3a ;$ba
	ld a,(de)
	ld e,a
	ld a,(bc)
	add e
	ldi (hl),a
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_PUFF
	ld bc,$0800
	jp objectCopyPositionWithOffset

@@@@table_6a54:
	.db $ec $00
	.db $00 $ec
	.db $00 $14
	.db $14 $00

@@@var03_02:
	ld a,(de)
	rst_jumpTable
	.dw @@@@substate0
	.dw @@@@substate1
	.dw @@@@substate2

@@@@substate0:
	ld h,d
	ld l,e		;substate
	inc (hl)	;substate 1
	inc l		;counter1
	ld (hl),$08
	inc l		;counter2
	ld (hl),$02
	ld a,$01
	jp enemySetAnimation

@@@@substate1:
	call ecom_decCounter1
	ret nz
	ld l,e
	inc (hl)
	ret

@@@@substate2:
	ld b,PART_GLEEOK_FIRE; PART_43
	call ecom_spawnProjectile
	ret nz
	ld l,$c2		;Relate object's subid?
	ld (hl),$02
	call ecom_decCounter2
	jp z,@@@func_69bc
	dec l
	ld (hl),$14
	dec l
	dec (hl)
	ret

@@@var03_03:
	ld a,(de)
	rst_jumpTable
	.dw @@@var03_00@substate0
	.dw @@@@ret
@@@@ret:
	ret

@@@var03_04:
@@@var03_05:
	call @@@func_6a9f
	call z,func_6cf6
	jp objectApplySpeed
@@@func_6a9f:
	ld h,d
	ld l,Enemy.var31 ;$b1
	ld a,(hl)
	or a
	ret z
	dec (hl)
	ret
	
@@stateC:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.counter2 ;$87
	ld (hl),120 ;$78
	ld l,Enemy.var03 ;$83
	ld a,(hl)
	or a
	jr z,+
	cp $03
	jr nz,++
+
	ld l,Enemy.var30 ;$b0
	xor a
	ldi (hl),a
	ld (hl),a		;Enemy.var31
++
	xor a
	jp enemySetAnimation
	
@@stateD:
	call ecom_decCounter2
	jr nz,@@stateB@var03_04
	ld l,e
	ld (hl),$0a
	ret
	
@@stateE:
	ld a,(wFrameCounter)
	rrca
	jr c,+
	call ecom_decCounter1
	jr nz,+
	ld l,e
	inc (hl)
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_100 ;$28
+
	call objectApplySpeed
	jp ecom_bounceOffScreenBoundary
	
@@stateF:
	ld h,d
	ld l,Enemy.subid ;$82
	ld a,(hl)
	cp $02
	ld bc,$2476
	jr z,+
	ld c,$7a
+
	ld l,Enemy.yh ;$8b
	ldi a,(hl)
	ldh (<hFF8F),a		;Enemy.yh
	inc l
	ld a,(hl)
	ldh (<hFF8E),a		;Enemy.xh
	cp c
	jr nz,+
	ldh a,(<hFF8F)
	cp b
	jr z,++
+
	jp ecom_moveTowardPosition
++
	ld l,e
	inc (hl)
	ld l,Enemy.enemyCollisionMode ;$a5
	ld (hl),ENEMYCOLLISION_GLEEOK ;$0d
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_80 ;$14
	ld l,Enemy.counter1 ;$86
	ld (hl),60 ;$3c
	ld l,Enemy.var30 ;$b0
	xor a
	ldi (hl),a
	ld (hl),a
	ld l,Enemy.state ;$82
	ld a,(hl)
	cp $02
	ld a,$14
	ld b,$02
	jr z,+
	ld a,$0c
	ld b,$04
+
	ld l,Enemy.angle ;$89
	ld (hl),a
	ld a,$38
	call objectGetRelatedObject1Var
	ld a,(hl)
	xor b
	ld (hl),a
	ret
	
@@stateH:
	ld e,Enemy.subid ;$82
	ld a,(de)
	sub $02
	xor $01
	add $30
	call objectGetRelatedObject1Var
	ld h,(hl)
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $0e
	jr nc,+
	cp $0a
	jp nz,@@stateB@var03_04
+
	ld h,d
	ld (hl),$0a
	ld l,Enemy.subid ;$82
	ld a,(hl)
	cp $02
	ret nz
	jp @@stateA

@subid3:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @subid2@incStateWhenCounter1Is0
	.dw @@stateA
	.dw @subid2@stateB
	.dw @subid2@stateC
	.dw @subid2@stateD
	.dw @subid2@stateE
	.dw @subid2@stateF
	.dw @subid2@incStateWhenCounter1Is0
	.dw @subid2@stateH

@@state8:
	ld h,d
	ld l,Enemy.angle ;$89
	ld (hl),$0c
	jp @subid2@incStateEnableCollisionsSetCounterAndSpeed

@@stateA:
	ld b,$02
	jp @subid2@func_6905

@subid4:
@subid5:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@state9
	.dw @@stateA

@@state8:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.enemyCollisionMode ;$a5
	ld (hl),ENEMYCOLLISION_PODOBOO ;$04
	ld e,Enemy.subid ;$82
	ld a,(de)
	sub $04
	add $30
	call objectGetRelatedObject1Var
	ld e,Enemy.relatedObj2+1 ;$99
	ld a,(hl)
	ld (de),a
	dec e		;;Enemy.relatedObj2
	ld a,$80
	ld (de),a

@@state9:
	call func_6cb2
	call func_6cbf
	ret nz
	ld e,Enemy.yh ;$8b
	ld a,b
	add a
	add b
	add $24
	ld (de),a
	ld e,Enemy.subid ;$82
	ld a,(de)
	cp $04
	ld b,$76
	jr z,+
	ld b,$7a
+
	ld a,c
	add a
	add c
	add b
	ld e,Enemy.xh ;$8d
	ld (de),a
	ret

@@stateA:
	call func_6cb2
	ld e,$82
	ld a,(de)
	rrca
	ld bc,$0276
	jr nc,+
	ld bc,$047a
+
	ld a,$38
	call objectGetRelatedObject1Var
	ld a,(hl)
	and b
	ret nz
	ld h,d
	ld l,Enemy.state ;$84
	dec (hl)
	ld l,Enemy.collisionType ;$a4
	set 7,(hl)
	ld l,Enemy.yh ;$8b
	ld (hl),$24
	ld l,Enemy.xh ;$8d
	ld (hl),c
	jp objectSetVisible82

@subid6:
@subid7:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@state9
	.dw @subid5@stateA

@@state8:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.enemyCollisionMode ;$a5
	ld (hl),ENEMYCOLLISION_PODOBOO ;$04
	ld e,Enemy.subid ;$82
	ld a,(de)
	sub $06
	add $30
	call objectGetRelatedObject1Var
	ld e,Enemy.relatedObj2+1 ;$99
	ld a,(hl)
	ld (de),a
	dec e		;Enemy.relatedObj2
	ld a,$80
	ld (de),a

@@state9:
	call func_6cb2
	call func_6cbf
	ret nz
	ld e,Enemy.yh ;$8b
	ld a,b
	add a
	add $24
	ld (de),a
	ld e,Enemy.subid ;$82
	ld a,(de)
	cp $06
	ld b,$76
	jr z,+
	ld b,$7a
+
	ld a,c
	add a
	add b
	ld e,Enemy.xh ;$8d
	ld (de),a
	ret

@subid8:
@subid9:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@state9
	.dw @subid5@stateA
	
@@state8:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.enemyCollisionMode ;$a5
	ld (hl),ENEMYCOLLISION_PODOBOO ;$04
	ld e,Enemy.subid ;$82
	ld a,(de)
	sub $08
	add $30
	call objectGetRelatedObject1Var
	ld e,Enemy.relatedObj2+1 ;$99
	ld a,(hl)
	ld (de),a
	dec e		;Enemy.relatedObj2
	ld a,$80
	ld (de),a
	
@@state9:
	call func_6cb2
	call func_6cbf
	ret nz
	ld e,Enemy.yh ;$8b
	ld a,b
	add $24
	ld (de),a
	ld e,Enemy.subid ;$82
	ld a,(de)
	cp $08
	ld a,$76
	jr z,+
	ld a,$7a
+
	add c
	ld e,Enemy.xh ;$8d
	ld (de),a
	ret

func_6c6b:
	dec b
	jr z,func_6c8a
	ld c,$76
	ld l,Enemy.subid ;$82
	bit 0,(hl)
	jr z,+
	ld c,$7a
+
	ld l,Enemy.yh ;$8b
	ld (hl),$24
	ld l,Enemy.xh ;$8d
	ld (hl),c
	ld l,Enemy.subid ;$82
	ld a,(hl)
	cp $04
	ret c
	ld a,$02
	jp enemySetAnimation
	
func_6c8a:
	ld l,Enemy.collisionType ;$a4
	res 7,(hl)
	ld l,Enemy.collisionRadiusY ;$a6
	ld (hl),$0c
	inc l		;collisionRadiusX
	ld (hl),$0e
	ld l,Enemy.yh ;$8b
	ld (hl),$20
	ld l,Enemy.xh ;$8d
	ld (hl),$78
	ld hl,$ce16		;checked
	ld a,$0f
	ldi (hl),a		;$ce16
	ldi (hl),a		;$ce17
	ld (hl),a		;$ce18
	ld l,$26		;$ce26
	ldi (hl),a		
	ldi (hl),a		;$ce27
	ld (hl),a		;$ce28
	ld a,$03
	call enemySetAnimation
	jp objectSetVisible83

func_6cb2:
	ld a,$01
	call objectGetRelatedObject2Var
	ld a,(hl)
	cp ENEMY_GLEEOK ;$06
	ret z
	pop hl
	jp enemyDelete

func_6cbf:
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $0e
	jr nz,func_6cd8
	ld h,d
	inc (hl)
	ld l,Enemy.collisionType ;$a
	res 7,(hl)
	ld e,Enemy.visible ;$9a
	ld a,(de)
	rlca
	ld b,INTERAC_KILLENEMYPUFF
	call c,objectCreateInteractionWithSubid00
	jp objectSetInvisible
	
func_6cd8:
	ld l,Enemy.yh ;$8b
	ldi a,(hl)
	sub $24
	sra a
	sra a
	ld b,a
	inc l
	ld e,Enemy.subid ;$82
	ld a,(de)
	rrca
	ld c,$76
	jr nc,+
	ld c,$7a
+
	ld a,(hl)
	sub c
	sra a
	sra a
	ld c,a
	xor a
	ret
	
func_6cf6:
	ld e,Enemy.var30 ;$b0
	ld a,(de)
	and $1f
	jr nz,+
	call getRandomNumber
	and $20
	ld (de),a
+
	ld a,(de)
	ld hl,table_6d14
	rst_addAToHl
	ld e,Enemy.angle
	ld a,(hl)
	ld (de),a
	ld h,d
	ld l,Enemy.var30
	inc (hl)
	inc l	;Enemy.var31
	ld (hl),$06
	ret

table_6d14:
	.db $15 $16 $17 $17 $19 $19 $1a $1b
	.db $05 $06 $07 $07 $09 $09 $0a $0b
	.db $0b $0a $09 $09 $07 $07 $06 $05
	.db $1b $1a $19 $19 $17 $17 $16 $15
	.db $08 $08 $09 $09 $0a $0a $0b $0c
	.db $14 $15 $16 $16 $17 $17 $18 $18
	.db $18 $18 $19 $19 $1a $1a $1b $1c
	.db $04 $05 $06 $06 $07 $07 $08 $08