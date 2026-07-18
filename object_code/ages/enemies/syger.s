
; ==============================================================================
; ENEMY_SYGER
; ==============================================================================
enemyCode73:
	jr z,@normalStatus
	sub $03
	ret c
	sub $01
	jr z,@justHit
	jr nc,@normalStatus
	ld e,Enemy.subid ;$82
	ld a,(de)
	dec a
	jr nz,@normalStatus
	ld a,Object.state ;$04
	call objectGetRelatedObject2Var
	ld a,$0a
	cp (hl)
	jr c,+
	ld (hl),a
	ld a,SND_bd;$d1
	call playSound
+
	jp enemyBoss_dead
@justHit:
	ld e,Enemy.subid ;$82
	ld a,(de)
	dec a
	jr z,@normalStatus
	ld a,Object.invincibilityCounter ;$2b
	call objectGetRelatedObject1Var
	ld e,l
	ld a,(de)
	ld (hl),a
	ld l,Enemy.state ;$84
	ld a,(hl)
	cp $09
	jr nz,+
	ld l,Enemy.counter1 ;$86
	ld (hl),28 ;$1c
+
	ld l,Enemy.health ;$a9
	ld e,l
	ld a,(de)
	ld (hl),a
	or a
	jr nz,@normalStatus
	ld l,Enemy.speedZ ;$a4
	res 7,(hl)
@normalStatus:
	call ecom_getSubidAndCpStateTo08
	jr c,+
	dec b
	jp z,sygerSubId01
	jp sygerSubId00
+
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	
@state0:
	ld a,$01
	ld (de),a
	ld e,Enemy.subid ;$82
	ld a,(de)
	or a
	jp nz,ecom_setSpeedAndState8
	ld a,ENEMY_SYGER ;$74
	jp enemyBoss_initializeRoom
	
@state1:
	ld b,$02
	call checkBEnemySlotsAvailable
	ret nz
	ld b,ENEMY_SYGER
	call ecom_spawnUncountedEnemyWithSubid01
	ld c,h
	call ecom_spawnUncountedEnemyWithSubid01
	inc (hl)
	ld l,Enemy.relatedObj1 ;$96
	ld a,Enemy.start ;$80
	ldi (hl),a
	ld (hl),c
	ld b,h
	ld h,c
	ld l,Enemy.relatedObj2 ;$98
	ldi (hl),a
	ld (hl),b
	call objectCopyPosition
	jp enemyDelete
	
@stateStub:
	ret
	
sygerSubId01:
	ld e,Enemy.state ;$84
	ld a,(de)
	sub $08
	cp $03
	jr c,@state8toA
	call func_54b5
	ld e,Enemy.var35
	ld a,(de)
	ld e,Enemy.state ;$84
	rst_jumpTable
	.dw @var35_00
	.dw @var35_01
	.dw @var35_02
@state8toA:
	rst_jumpTable
	.dw @state8
	.dw @state9
	.dw @stateA
	
@state8:
	inc e ; Enemy.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2
	
@@substate0:
	ldbc $01, $08
	call enemyBoss_spawnShadow
	ret nz
	call ecom_setZAboveScreen
	ld l,Enemy.substate ;$85
	inc (hl)
	ld l,Enemy.enemyCollisionMode ;$a5
	ld (hl),SE_ENEMYCOLLISION_5b;$5b ;CHANGE
	ld a,$02
	call setVar30AndLoadAnimation
	jp objectSetVisible81
	
@@substate1:
	ld c,$18 ; Gravity
	call objectUpdateSpeedZAndBounce
	jr nz,@animate
	jr nc,+
	ld h,d
	ld l,Enemy.substate ;$85
	inc (hl)
	inc l ; Enemy.counter1
	ld (hl),90 ;$5a
	xor a
	call setVar30AndLoadAnimation
	ld a,MUS_MINIBOSS ;$2d
	ld (wActiveMusic),a
	call playSound
+
	ld a,SND_ENEMY_JUMP ;$8f
	call playSound
	jr @animate
	
@@substate2:
	call ecom_decCounter1
	jr z,+
	ld a,(hl)
	cp $46
	ld a,SND_bd ;$d1
	call z,playSound
	jr @animate
+
	ld l,e
	ld (hl),$00 ; sets substate back to 0
	dec l ; Enemy.state
	ld (hl),$0b
	call savePositionToVar33And34
	jr @animate
	
@state9:
	call ecom_decCounter1
	jr nz,+
	inc l
	ldd a,(hl)
	ld (hl),a
	ld l,e
	inc (hl)
	dec a
	jr z,@animate
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_300 ;$78
	ld a,$02
	ld l,Enemy.counter2 ;$87
	ld (hl),a
	jp setVar30AndLoadAnimation
+
	ld l,Enemy.counter1 ;$86
	ld a,(hl)
	cp 150 ;$96
	jr nc,@animate
	call chooseAngle
	call ecom_bounceOffWallsAndHoles
	call objectApplySpeed
@animate:
	jp enemyAnimate
	
@stateA:
	call ecom_decCounter1
	jr z,+
	ld c,$12 ; Gravity
	call objectUpdateSpeedZ_paramC
	jp nz,seasonsFunc_0e_5523
	ld a,SND_ENEMY_JUMP ;$8f
	call playSound
	ld h,d
	ld l,Enemy.counter2 ;$87
	dec (hl)
	jr z,+
	dec l ; Enemy.counter1
	ld (hl),240 ;$f0
	ld l,Enemy.speedZ ;$94
	ld a,$40
	ldi (hl),a ; Enemy.speedZ + 1
	ld (hl),$fe
	jr @animate
+
	ld l,Enemy.state ;$84
	inc (hl)
	jp savePositionToVar33And34
	
; rush at Link from center of room twice
@var35_00:
	inc e ; Enemy.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2

@@substate0:
	ld h,d
	ld l,e
	inc (hl)
	inc l ; Enemy.counter1
	ld (hl),30 ;$1e
	ld l,Enemy.collisionRadiusY ;$a6
	ld a,$09
	ldi (hl),a ; Enemy.collisionRadiusX
	ld (hl),a
	ld a,$03
	call setVar30AndLoadAnimation

@@substate1:
	call ecom_decCounter1
	jp nz,seasonsFunc_0e_557b
	ld (hl),180 ;120 ;$78 ; Enemy.counter1
	inc l ; Enemy.counter2
	ld (hl),$02
	ld l,e ; Enemy.substate
	inc (hl)
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_1c0 ;$46
	call ecom_updateAngleTowardTarget
	jr @animate

@@substate2:
	call ecom_decCounter1
	jr nz,@func_5365
	ld (hl),45 ;$2d ; Enemy.counter1
	inc l	; Enemy.counter2
	dec (hl)
	jp z,func_54c6
	call ecom_updateAngleTowardTarget
	jr @animate
	
; move in a randomly-picked pattern
@var35_01:
	inc e ; Enemy.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2

@@substate0:
	ld h,d
	ld l,e ; Enemy.substate
	inc (hl)
	inc l ; Enemy.counter1
	ld (hl),15 ;$0f
	ld l,Enemy.collisionRadiusY ;$a6
	ld a,$09
	ldi (hl),a ; Enemy.collisionRadiusX
	ld (hl),a
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_300 ;$78
	ld a,$03
	call setVar30AndLoadAnimation

@@substate1:
	call seasonsFunc_0e_557b
	call ecom_decCounter1
	ret nz
	ld l,Enemy.substate ;$85
	inc (hl)
	call getRandomNumber_noPreserveVars
	and $03 ;$01
	ld hl,sygerMovementTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a

	ld e,Enemy.angle ;$89
	ldi a,(hl)
	ld (de),a
	ld e,Enemy.var38 ;$b8
	ldi a,(hl)
	ld (de),a

; sets var31 and 32 as a pointer back to the next byte in table
@@func_5339:
	ld e,Enemy.counter1 ;$86
	ldi a,(hl)
	ld (de),a
	ld e,Enemy.var31 ;$b1
	ld a,l
	ld (de),a
	inc e ; Enemy.var32
	ld a,h
	ld (de),a
	ret

@@substate2:
	call ecom_decCounter1
	jp nz,@func_5365
	ld e,Enemy.var31 ;$b1
	ld a,(de)
	ld l,a
	inc e ; Enemy.var32
	ld a,(de)
	ld h,a
	ld a,(hl)
	inc a
	jp z,func_54c6 ; jump if a was $ff
	ld e,Enemy.var38 ;$b8
	ld a,(de)
	ld b,a
	ld e,Enemy.angle ;$89
	ld a,(de)
	add b ; add var38 to angle
	and $1f
	ld (de),a
	call @@func_5339
@func_5365:
	call setPositionFromVar33And34
	call ecom_bounceOffWallsAndHoles
	call objectApplySpeed
	call savePositionToVar33And34
	jp seasonsFunc_0e_557b
	
; dash at Link vertically 3 times
@var35_02:
	inc e ; Enemy.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2
	.dw @@substate3
	.dw @@substate4
	.dw @@substate5
	
@@substate0:
	ld h,d
	ld l,e
	inc (hl)
	inc l ; Enemy.counter1
	ld (hl),60 ;$3c
	inc l ; Enemy.counter2
	ld (hl),_sizeof_dashXLocations + $01 ; number of dashes + 1
	ld l,Enemy.collisionRadiusY ;$a6
	ld a,$09
	ldi (hl),a ; Enemy.collisionRadiusX
	ld (hl),a
	ret
	
@@substate1:
	call ecom_decCounter2
	ld l,Enemy.speedZ ;$94
	ld a,$80
	ldi (hl),a ; Enemy.speedZ + 1
	ld (hl),$fe
	ld l,e ; Enemy.substate
	jr nz,+
	ld (hl),$05
	ret
+
	inc (hl)
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_280 ;$64
	ld l,Enemy.counter2 ;$87
	ld a,(hl)
	dec a
	ld bc,dashXLocations
	call addAToBc
	ld l,Enemy.var36 ;$b6
	ld a,(bc)
	ldi (hl),a
	ldh a,(<hEnemyTargetX)
	ld b,$18
	cp b
	jr c,+
	ld b,$d8 ; -$18
	cp b
	jr nc,+
	ld b,a
+
	ld (hl),b ; Enemy.var37
	ld e,Enemy.counter2 ;$87
	ld a,(de)
	and $01
	inc a
	jp setVar30AndLoadAnimation
	
@@substate2:
	ld c,$12 ; gravity
	call objectUpdateSpeedZ_paramC
	jp nz,seasonsFunc_0e_5518
	ld l,Enemy.substate ;$85
	inc (hl)
	inc l
	ld (hl),30 ;$1e
	ld l,Enemy.counter2 ;$877
	ld a,(hl)
	and $01
	swap a
	ld l,Enemy.angle ;$89
	ld (hl),a
	ld a,SND_ENEMY_JUMP ;$8f
	call playSound
@@animate:
	jp enemyAnimate
	
@@substate3:
	call ecom_decCounter1
	jr z,++
	ld a,(hl)
	cp $14
	jr nc,+
	call enemyAnimate
	ld a,(wFrameCounter)
	and $07
	ld a,SND_SWORDSPIN ;$6b
	call z,playSound
+
	jr @@animate
++
	ld l,e
	inc (hl)
	ld a,SND_BEAM2 ;$bb
	call playSound
	jr @@animate
	
@@substate4:
	call enemyAnimate
	call ecom_applyVelocityForSideviewEnemyNoHoles
	call nz,ecom_applyVelocityForSideviewEnemyNoHoles
	ret nz
	ld e,Enemy.substate ;$85
	ld a,$01
	ld (de),a
	ret
	
@@substate5:
	ld c,$12 ; gravity
	call objectUpdateSpeedZ_paramC
	jr nz,@@animate
	ld a,SND_ENEMY_JUMP ;$8f
	call playSound
	jp func_54c9
	
sygerSubId00:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @state8
	.dw @state9
	.dw @stateA
	.dw @stateB

@state8:
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.collisionRadiusY ;$a6
	ld (hl),$03
	inc l ; Enemy.collisionRadiusX
	ld (hl),$08
	ld a,$04
	jp enemySetAnimation

@state9:
	call enemyAnimate
	ld a,Object.var30 ;$30
	call objectGetRelatedObject1Var
	ld a,(hl)
	or a
	ld e,Enemy.var30 ;$b0
	jr z,+
	ld a,$01
	ld (de),a
	ld h,d
	ld l,Enemy.collisionType ;$a4
	res 7,(hl) ; invincible
	jp objectSetInvisible
+
	ld a,(de)
	dec a
	jr nz,+
	ld (de),a
	call getRandomNumber
	and $01
	inc a
	xor $01
	ld bc,table_559c
	call addAToBc
	ld e,Enemy.var31 ;$b1
	ld a,(bc)
	ld (de),a
	inc e
	inc bc
	ld a,(bc)
	ld (de),a
	inc bc
	ld a,(bc)
	push hl
	call enemySetAnimation
	pop hl
+
	ld e,Enemy.var31 ;$b1
	ld a,(de)
	ld b,a
	inc e
	ld a,(de)
	ld c,a
	call objectTakePositionWithOffset
	ld h,d
	ld l,Enemy.collisionType ;$a4
	set 7,(hl)
	jp objectSetVisible82

@stateA:
	ld h,d
	ld l,Enemy.visible ;$9a
	bit 7,(hl)
	jp z,enemyDelete
	ld l,Enemy.collisionType ;$a4
	res 7,(hl)
	ld l,e ; Enemy.state
	inc (hl)

@stateB:
	ld a,Object.id ;$01
	call objectGetRelatedObject1Var
	ld a,(hl)
	cp ENEMY_SYGER ;$74
	jp nz,enemyDelete
	ld l,Enemy.visible ;$9a
	ld e,l
	ld a,(hl)
	ld (de),a
	ret
	
func_54b5:
	ld e,Enemy.var35 ;$b5
	ld a,(de)
	cp $02
	ret z
	ld a,(wFrameCounter)
	and $07
	ret nz
	ld a,SND_CUTGRASS ;$6d
	jp playSound

func_54c6:
	call setPositionFromVar33And34
func_54c9:
; randomize angle
	ld bc,$1f01
	call ecom_randomBitwiseAndBCE
	ld h,d
	ld l,Enemy.speed ;$90
	ld (hl),SPEED_80 ;$14
	ld l,Enemy.angle ;$89
	ld (hl),b
; randomly pick next action from var35 using previous selection
; can never pick the same action twice
	ld e,Enemy.var35 ;$b5
	ld a,(de)
	add a
	add c
	ld hl,var35Output
	rst_addAToHl
	ld e,Enemy.var35 ;$b5
	ld a,(hl)
	ld (de),a
	dec a
	jr z,+
	call savePositionToVar33And34
	ld l,Enemy.state ;$84
	ld (hl),$09
	inc l ; Enemy.substate
	ld (hl),$00
	inc l ; Enemy.counter1 ;ld l,$86
	ld (hl),180 ;$b4
	inc l ; Enemy.counter2
	ld (hl),$01
	jr ++
	call setPositionFromVar33And34
+
	ldbc $fe, $20
	call objectSetSpeedZ
	ld l,Enemy.state; $84
	ld (hl),$09
	inc l ; Enemy.substate
	ld (hl),$00
	inc l ; Enemy.counter1 ;ld l,$86
	ld (hl),120 ;$78
	inc l ; Enemy.counter2
	ld (hl),240 ;$f0
++
	xor a
	
setVar30AndLoadAnimation:
	ld e,Enemy.var30 ;$b0
	ld (de),a
	jp enemySetAnimation

seasonsFunc_0e_5518:
	call enemyAnimate
	ld h,d
	ld l,Enemy.var36 ;$b6
	call ecom_readPositionVars
	jr +

seasonsFunc_0e_5523:
	call enemyAnimate
	ldbc $38, $78
	ld h,d
	ld l,Enemy.yh ;$8b
	ldi a,(hl) ; Enemy.x
	ldh (<hFF8F),a
	inc l ; Enemy.xh
	ld a,(hl)
	ldh (<hFF8E),a
+
	sub c
	add $02
	cp $05
	jp nc,ecom_moveTowardPosition
	ldh a,(<hFF8F)
	sub b
	add $02
	cp $05
	jp nc,ecom_moveTowardPosition
	ld (hl),c
	ld l,Enemy.yh ;$8b
	ld (hl),b
	ret

chooseAngle:
	push hl
	ld hl,@scentSeedProbability
	call getRandomIndexFromProbabilityDistribution
	pop hl
	dec b
	jr nz,+

	ld a,(wScentSeedActive) ; $ccf0
	or a
	jr z,+
	inc (hl)
	jp ecom_updateAngleToScentSeed
+
	ld a,(wFrameCounter)
	and $3f
	ret nz
	call getRandomNumber_noPreserveVars
	and $1f
	ld e,Enemy.angle ;$89
	ld (de),a
	ret

@scentSeedProbability:
	.db $d0 $30

;sets position from var33 and var34
setPositionFromVar33And34:
	ld h,d
	ld l,Enemy.var33 ;$b3
	ld e,Enemy.yh ;$8b
	ldi a,(hl)
	ld (de),a
	ld e,Enemy.xh ;$8d
	ld a,(hl)
	ld (de),a
	ret

;saves position to var33 and var34
savePositionToVar33And34:
	ld h,d
	ld l,Enemy.var33 ;$b3
	ld e,Enemy.yh ;$8b
	ld a,(de)
	ldi (hl),a ; Enemy.34
	ld e,Enemy.xh ;$8d
	ld a,(de)
	ld (hl),a
	ret

seasonsFunc_0e_557b:
	call enemyAnimate
	call setPositionFromVar33And34
	ld e,Enemy.animParameter ;$a1
	ld a,(de)
	ld hl,table_5594
	rst_addAToHl
	ld e,Enemy.yh ;$8b
	ld a,(de)
	add (hl)
	ld (de),a
	inc hl
	ld e,Enemy.xh ;$8d
	ld a,(de)
	add (hl)
	ld (de),a
	ret

table_5594:
	.db $04 $04 $04 $fc
	.db $fc $fc $fc $04

table_559c:
	.db $f6 $10 $04
	.db $f6 $f0 $05

var35Output:
	.db $01 $02 $00
	.db $02 $00 $01

dashXLocations:
	.db $1c $64 $4c $94 $4c $64 $1c ;$1c $94 $1c

sygerMovementTable:
	.dw @sygerMovement00
	.dw @sygerMovement01
	.dw @sygerMovement02
	.dw @sygerMovement03

;;
;	b0: initial angle
;	b1: var38 - added to angle 
;	b2 and on: counter1
;	$ff ends the table
@sygerMovement00:
	.db $10 $f8 $0a		;ANGLE_DOWN, Right Turn, 10
	.db $07 $05 $0e $0a
	.db $1b $14 $28 $1e
	.db $32 $21 $3b $25
	.db $ff

@sygerMovement01:
	.db $0c $02 $40
	.db $07 $07 $07 $26
	.db $0b $0c $0c $2d
	.db $05 $05 $05 $2d
	.db $0a $0a $0a $46
	.db $ff

@sygerMovement02:
	.db $00 $08 $04
	.db $1e $21 $32 $1e
	.db $28 $14 $1b $0a
	.db $0e $05 $07 $0a
	.db $ff

@sygerMovement03:
	.db $14 $fe $40
	.db $07 $07 $07 $26
	.db $0b $0c $0c $2d
	.db $05 $05 $05 $2d
	.db $0a $0a $0a $46
	.db $ff	
