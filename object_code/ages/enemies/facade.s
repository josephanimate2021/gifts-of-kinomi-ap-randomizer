; ==============================================================================
; ENEMYID_FACADE
; ==============================================================================
;enemyCode71:
enemyCode72:
	jr z,@normalStatus
	sub $03
	ret c
	ret nz
	; dead
	ld e,Enemy.collisionType	;$a4
	ld a,(de)
	or a
	call nz,@dead
	ld e,Enemy.subid			;$82
	ld a,(de)
	or a
	jp nz,enemyDie
	jp _enemyBoss_dead

@normalStatus:
	ld e,Enemy.state			;$84
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @stateStub
	.dw @state8
	.dw @state9
	.dw @stateA
	.dw @stateB
	.dw @stateC

@state0:
	call _ecom_setSpeedAndState8
	ld l,Enemy.yh				;$8b
	ld (hl),$58
	ld l,Enemy.xh				;$8d
	ld (hl),$78
	ld e,Enemy.subid			;$82
	ld a,(de)
	or a
	ld a,$ff
	ld b,$00
	jp z,_enemyBoss_initializeRoom
	ld l,Enemy.counter1			;$86
	ld (hl),60					;$3c
	ld l,Enemy.state			;$84
	inc (hl)
	ret

@stateStub:
	ret

@state8:
	ldh a,(<hEnemyTargetX);(<hEnemyTargetY)
	cp $38;$58
	ret nc;c
	ld h,d
	ld l,e
	inc (hl)
	ld l,Enemy.counter1			;$86
	inc (hl)
	ld a,MUS_MINIBOSS			;$2d
	ld (wActiveMusic),a
	jp playSound

@state9:
	call _ecom_decCounter1
	ret nz
	ld a,120					;$78
	ld (hl),a
	ld l,e
	inc (hl)		;inc state
	ld l,Enemy.collisionType	;$a4
	set 7,(hl)
	call setScreenShakeCounter

	ld a,(wNumBombs)
	or a
	jr z,+	;if Link has no bombs, spawn beetles
	call getRandomNumber_noPreserveVars
	and $03
	ld hl,@table_48c4
	rst_addAToHl
	ld a,(hl)
+
	ld e,Enemy.var03			;$83
	ld (de),a
	ld a,SND_RUMBLE2			;$b8
	call playSound
	xor a
	call enemySetAnimation
	jp objectSetVisible83

@table_48c4:
	.db $00
	.db $01
	.db $02
	.db $02

@stateA:
	call _ecom_decCounter1
	jr z,+
	ld a,(hl)
	and $1f
	ld a,SND_RUMBLE2			;$b8
	call z,playSound
	jr ++
+
	ld l,e
	inc (hl)
	inc l
	ld (hl),$00
++
	jp enemyAnimate

; attacking state
@stateB:
	call enemyAnimate
	ld e,Enemy.var03			;$83
	ld a,(de)
	rst_jumpTable
	.dw @var03_00
	.dw @var03_01
	.dw @var03_02

; spawns beetles
@var03_00:
	ld e,Enemy.substate			;$85
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2

@@substate0:
	ld h,d
	ld l,e
	inc (hl)
	inc l		;[Enemy.counter1]
	ld (hl),20					;$14
	ret

@@substate1:
	call _ecom_decCounter1
	ret nz
	ld (hl),70					;$46
	ld l,e
	inc (hl)
	ret

@@substate2:
	call _ecom_decCounter1
	jp z,@incStateAndSetAnimation02
	ld a,(hl)
	and $0f
	ret nz
	ld l,Enemy.var30			;$b0
	ld a,(hl)
	cp $05
	ret nc
	jp @spawnBeetle

; spawns holes
@var03_01:
	ld e,Enemy.substate			;$85
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2

@@substate0:
	ld a,$01
	ld (de),a
	inc a
	jp enemySetAnimation

@@substate1:
	ld h,d
	ld l,Enemy.animParameter	;$a1
	bit 7,(hl)
	jp z,enemyAnimate
	ld l,e
	inc (hl)
	ld l,Enemy.counter1			;$86
	ld (hl),180					;$b4
	ld l,Enemy.collisionType	;$a4
	res 7,(hl)
	jp objectSetInvisible

@@substate2:
	call _ecom_decCounter1
	jp z,@incStateAndSetAnimation02
	ld a,(hl)
	and $1f
	ret nz
	jp @spawnHoles

; spawns fire projectile
@var03_02:
	ld e,Enemy.substate			;$85
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1

@@substate0:
	ld h,d
	ld l,e
	inc (hl)
	inc l		;[Enemy.counter1]
	ld (hl),240					;$f0
	ld a,$01
	jp enemySetAnimation

@@substate1:
	call _ecom_decCounter1
	jp z,@incStateAndSetAnimation02
	ld a,(hl)
	and $0f
	ret nz
	ld e,Enemy.animParameter	;$a1
	ld a,(de)
	dec a
	ret nz
	ld a,SND_THROW				;$51
	call playSound
	jp @spawnFire

@stateC:
	ld h,d
	ld l,Enemy.animParameter	;$a1
	bit 7,(hl)
	jp z,enemyAnimate
	ld l,e		;[Enemy.state]
	ld (hl),$09
	ld l,Enemy.counter1			;$86
	ld (hl),120					;$78
	ld l,Enemy.collisionType	;$a4
	res 7,(hl)
	jp objectSetInvisible

@spawnBeetle:
	ld b,ENEMYID_BEETLE
	call _ecom_spawnEnemyWithSubid01
	ret nz
	ld l,Enemy.relatedObj1		;$96
	ld a,Enemy.start			;$80
	ldi (hl),a
	ld (hl),d
	ld e,Enemy.var30			;$b0
	ld a,(de)
	inc a
	ld (de),a
	call getRandomNumber
	ld c,a
	and $70
	add $20
	ld l,Enemy.yh				;$8b
	ldi (hl),a
	inc l		;[Enemy.xh]
	ld a,c
	and $07
	swap a
	add $40
	ld (hl),a
	ret

; Spawns holes at random locations
@spawnHoles:
	ld b,PARTID_FACADE_HOLE		;PARTID_2e
	call _ecom_spawnProjectile
	ret nz
	push hl
	ld bc,$1f1f
	call _ecom_randomBitwiseAndBCE
	pop hl
	ldh a,(<hEnemyTargetY)
	add b
	sub $10
	and $f0
	add $08
	ld l,Part.yh				;$cb
	ld (hl),a
	ldh a,(<hEnemyTargetX)
	add c
	sub $10
	and $f0
	add $08
	ld l,Part.xh				;$cd
	ld (hl),a
	ret

; Spawns a rock
@spawnFire:
	ld b,PARTID_VOLCANO_ROCK
	call _ecom_spawnProjectile
	ret nz
	ld l,Part.subid				;$c2
	inc (hl)
	ret

; Increases state and sets animation to $02
@incStateAndSetAnimation02:
	ld l,Enemy.state			;$84
	inc (hl)
	ld a,$02
	jp enemySetAnimation

; Kills all remaining beetles at the death of Facade
@dead:
	ldhl FIRST_ENEMY_INDEX, Enemy.start	;$d080
-
	ld l,Enemy.id				;$81
	ld a,(hl)
	cp ENEMYID_BEETLE			;$51
	call z,_ecom_killObjectH
	inc h
	ld a,h
	cp $e0
	jr c,-
	ret