; ==============================================================================
; ENEMY_MANHANDLA
; 	var2a:
; 	var30: Stored Animation Index, based off of subid, in @table_7828
; 	var31-36:
; 	var36:
; 	var37:
; 	var38:
;	var39:
;	var3a: counter to reset Manhandla's collision after being hit by boomerang
; ==============================================================================

enemyCode7a:
;enemycode7d:
	jr z,@normalStatus
	sub $03
	ret c
	dec a
	jr z,+
	dec a
	jr z,@normalStatus
	ld e,Enemy.subid			;$82
	ld a,(de)
	dec a
	jp z,enemyBoss_dead
	dec a
	call z,ecom_killRelatedObj1
	jp enemyDie_uncounted
+
	call _func_7a44
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
	.dw @subid1	;body
	.dw @subid2
	.dw @subid3 ;top 	right head
	.dw @subid4 ;bottom right head
	.dw @subid5 ;bottom	left  head
	.dw @subid6 ;top	left  head

@state0:
; initialize room and spawn subids 1-6 if subid is $00
	ld a,b
	or a
	jr nz,+
	ld a,ENEMY_MANHANDLA		;$7d
	ld b,PALH_85;cb				;$85
	call enemyBoss_initializeRoom
	jr @state1
+
	dec a
	ld hl,@table_7828
	rst_addAToHl
	ld e,Enemy.var30			;$b0
	ld a,(hl)
	ld (de),a
	call enemySetAnimation
	call ecom_setSpeedAndState8
	ld e,Enemy.subid			;$82
	ld a,(de)
	cp $03			;special interaction with subids >$03
	jr nc,+
	dec a
	jr z,++
	jp objectSetInvisible
+
	call _func_7a14
	ld e,Enemy.var31			;$b1
	ld a,$03
	ld (de),a
	ld e,Enemy.subid			;$82
	ld a,(de)
	sub $04
	cp $02
	jp c,objectSetVisible82
++
	jp objectSetVisible83

@table_7828:
	.db $00 $05 $09
	.db $0d $0b $07

; spawns subids 1-6
@state1:
	ld b,$06
	call checkBEnemySlotsAvailable
	ret nz
	ld b,ENEMY_MANHANDLA
	call ecom_spawnUncountedEnemyWithSubid01
	ld l,Enemy.enabled		;$80
	ld e,l
	ld a,(de)
	ld (hl),a
	call objectCopyPosition
	push hl
	ld c,h
	call ecom_spawnUncountedEnemyWithSubid01
	inc (hl)
	call objectCopyPosition
	call _setRelatedObj1
	ld a,h
	ld hl,hFF8A				;$ff8a
	ldi (hl),a
	ld a,$04
; hFF8F: repeat counter
-
	ldh (<hFF8F),a
	push hl
	call ecom_spawnUncountedEnemyWithSubid01
	call _func_7a1f
	ld a,h
	pop hl
	ldi (hl),a
	ldh a,(<hFF8F)
	dec a
	jr nz,-

; a == 0
	pop hl
	ld bc,hFF8A				;$ff8a
	ld l,Enemy.var31		;$b1
	ld e,$05
; Copies from hFF8A-hFF8F to var31-var36
-
	ld a,(bc)
	ldi (hl),a
	inc c
	dec e
	jr nz,-
	jp enemyDelete

@stateStub:
	ret

; Manhandla's Body
@subid1:
	call _func_7ac8
	ld e,Enemy.state		;$84
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
	
@@state8:
; Return if doors are not shut
	ld a,(wcc93)
	or a
	ret nz

	ld h,d
	ld l,Enemy.speed		;$90
	ld (hl),SPEED_40		;$0a
	ld l,Enemy.enemyCollisionMode	;$a5
	ld (hl),ENEMYCOLLISION_MANHANDLA_BODY_INVULNERABLE;$61
	ld l,Enemy.var36		;$b6
	ld (hl),$04
	inc l		;[var37]
	ld (hl),$58
	inc l		;[var38]
	ld (hl),$78
	inc l		;[var39]
	ld (hl),$ff
	call @@func_78ce
	ld a,MUS_BOSS			;$2e
	ld (wActiveMusic),a
	jp playSound
	
; moves Manhandla in preset angle
@@state9:
	call ecom_decCounter1
	jr nz,@@bounceAndApplySpeed
	ld (hl),120				;$78
	ld l,e
	inc (hl)
	xor a
	call enemySetAnimation
@@bounceAndApplySpeed:
	call ecom_bounceOffWallsAndHoles
	call objectApplySpeed
@@animate:
	jp enemyAnimate

; stationary; resets angle at counter1 == 0
@@stateA:
	call ecom_decCounter1
	ret nz
	
@@func_78ce:
	ld l,e
	ld (hl),$09
	call getRandomNumber_noPreserveVars
	and $07
	ld hl,@@table_78f6
	rst_addAToHl
	ld e,Enemy.counter1		;$86
	ld a,(hl)
	ld (de),a
	ld bc,$5078		;General Center of room
	call objectGetRelativeAngle
	push af
	call getRandomNumber_noPreserveVars
	and $01
	pop af
	jr z,+
	sub $02
	and $1f
+
	ld e,Enemy.angle		;$89
	ld (de),a
	jr @@animate

@@table_78f6:
	.db $a0 $b0 $c0 $d0
	.db $d0 $e0 $f0 $00
	
; Headless Body
@@stateB:
	call _func_7ab4
	jr nc,+
	ld l,e
	inc (hl)
	ld l,Enemy.angle		;$89
	ld (hl),ANGLE_UP		;$00
	ld l,Enemy.counter1		;$86
	ld (hl),4				;$04
	ld l,Enemy.speed		;$90
	ld (hl),SPEED_220		;$55
	jr @@animate
+
	call objectGetRelativeAngleWithTempVars
	ld e,Enemy.angle		;$89
	ld (de),a
	jr @@bounceAndApplySpeed
	
@@stateC:
	call ecom_decCounter1
	jr nz,@@bounceAndApplySpeed
	ld (hl),4				;$04
	ld l,Enemy.var39		;$b9
	ld e,Enemy.angle		;$89
	ld a,(de)
	add (hl)
	and $1f
	ld (de),a
	or a
	jr nz,@@bounceAndApplySpeed
	ld a,(hl)
	cpl
	inc a
	ld (hl),a
	jr @@bounceAndApplySpeed
	
@@stateD:
	call ecom_decCounter1
	jr nz,@@animateAndUpdateMovingPlatform
	ld (hl),60				;$3c
; decrease animation index by 1, set state to $0b when reaching $00
	ld l,Enemy.var30		;$b0
	ld a,(hl)
	dec a
	ld (hl),a
	jr nz,+
	ld l,Enemy.state		;$84
	ld (hl),$0b
+
	jp enemySetAnimation
	
@@stateE:
	call ecom_decCounter1
	jr nz,+
	inc (hl)
	ld l,Enemy.state		;$84
	dec (hl)
	ld l,Enemy.collisionType	;$a4
	ld (hl),$80|ENEMY_MANHANDLA;$fd
; decrease animation index by 1
	ld l,Enemy.var30		;$b0
	dec (hl)
	ld a,(hl)
	call enemySetAnimation
	jp objectSetVisible82
+
	ld a,(hl)
	cp 120					;$78
	jr nz,@@animateAndUpdateMovingPlatform
; increase animation index by 1
	ld l,Enemy.var30		;$b0
	inc (hl)
	ld a,(hl)
	jp enemySetAnimation
@@animateAndUpdateMovingPlatform:
	call enemyAnimate
	jp ecom_updateMovingPlatform

@subid2:
	call _func_7ad6
	ld e,Enemy.state		;$84
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
	ld l,Enemy.collisionType	;$a4
	res 7,(hl)
	inc l		;[Enemy.enemyCollisionMode]
	ld (hl),ENEMYCOLLISION_MANHANDLA_CORE;$63
	ret

@@state9:
	ld a,ObjectStruct.state		;$04
	call objectGetRelatedObject1Var
	ld a,(hl)
	cp $0e
	ret nz
	ld h,d
	ld l,Enemy.state		;$84
	inc (hl)
	ld l,Enemy.collisionType	;$a4
	set 7,(hl)
	ld l,Enemy.zh			;$8f
	ld (hl),$f9		;[-7]
	ld l,Enemy.speedZ		;$94
	xor a
	ldi (hl),a
	ld (hl),a
	call objectSetVisible81
	ld a,$05
	jp enemySetAnimation

@@stateA:
	ld a,ObjectStruct.state		;$04
	call objectGetRelatedObject1Var
	ld a,(hl)
	cp $0d
	jr nz,+
	ld h,d
	ld l,Enemy.state		;$84
	dec (hl)
	ld l,Enemy.collisionType	;$a4
	res 7,(hl)
	jp objectSetInvisible
+
	ld l,Enemy.counter1		;$86
	ld a,(hl)
	cp 120					;$78
	ret nc
	add $03
	and $0c
	rrca
	rrca
	ld hl,@@table_79d9
	rst_addAToHl
	ld e,Enemy.xh			;$8d
	ld a,(de)
	add (hl)
	ld (de),a
	ret

@@table_79d9:
	.db $00 $02 $00 $fe

@subid3:
@subid4:
@subid5:
@subid6:
	ld a,(de)
	sub $08
	rst_jumpTable
	.dw @@state8
	.dw @@state9
	
@@state8:
	call ecom_decCounter1
	jr nz,@@toFunc7ad6
	call checkOpenMouth;_func_7b1c
	jr c,@@toFunc7ad6
--
; mouth opened, set random timer
	call getRandomNumber_noPreserveVars
	and $50
	add 90							;$5a
	ld e,Enemy.counter1				;$86
	ld (de),a
@@toFunc7ad6:
	jp _func_7ad6
	
@@state9:
	call ecom_decCounter1
	jr z,+
	ld a,(hl)
	cp 90							;$5a
	jr nz,@@toFunc7ad6
	ld b,PART_GOPONGA_PROJECTILE
	call ecom_spawnProjectile
	jr @@toFunc7ad6
+
; decrease animation index by 1
	ld l,Enemy.var30				;$b0
	dec (hl)
	ld a,(hl)
	call enemySetAnimation

_func_7a14:
	ld h,d
	ld l,Enemy.state				;$84
	ld (hl),$08
	ld l,Enemy.enemyCollisionMode	;$a5
	ld (hl),ENEMYCOLLISION_TWINROVA	;$0a
	jr --

; param		hl		Enemy.subid
_func_7a1f:
	push bc
	push hl
	ldh a,(<hFF8F)
	ld b,a
	ld a,$07
	sub b
	ld (hl),a
	call _func_7af2
	ld e,Enemy.yh					;$8b
	ld a,(de)
	add (hl)
	ld b,a
	inc hl		;[Enemy.var03]
	ld e,Enemy.xh					;$8d
	ld a,(de)
	add (hl)
	ld c,a
	pop hl		;[Enemy.subid]
	ld l,e
	ld (hl),c
	ld l,Enemy.yh					;$8b
	ld (hl),b
	pop bc

_setRelatedObj1:
	ld l,Enemy.relatedObj1			;$96
	ld a,Enemy.start				;$80
	ldi (hl),a
	ld (hl),c
	ret

_func_7a44:
	ld h,d
	ld l,Enemy.var2a				;$aa
	ld e,Enemy.subid				;$82
	ld a,(de)
	dec a
	jr z,_func_7a70
; Return if subid == $02
	dec a
	ret z
; Return if not dead
	ld l,Enemy.health				;$a9
	ld a,(hl)
	or a
	ret nz

	ld a,ObjectStruct.var36 		;$36
	call objectGetRelatedObject1Var
	dec (hl)
	jr z,headsDefeated;_func_7a63
	ld l,Enemy.speed				;$90
	ld a,(hl)
	add SPEED_80					;$14
	ld (hl),a
	ret
	
headsDefeated:;_func_7a63:
	ld l,Enemy.state				;$84
	ld (hl),$0b
	ld l,Enemy.speed				;$90
	ld (hl),SPEED_200				;$50
	ld l,Enemy.enemyCollisionMode	;$a5
	ld (hl),ENEMYCOLLISION_MANHANDLA_BODY_VULNERABLE	;$4c
	ret

; For subid 01
_func_7a70:
	ld l,Enemy.var2a				;$aa
	ld a,(hl)
	cp $80|ITEMCOLLISION_ELECTRIC_SHOCK;$a0
	jr nz,+
	ld l,Enemy.var3a				;$ba
	ld (hl),60						;$3c
+
	ld l,Enemy.health				;$a9
	ld (hl),$40
	ld l,Enemy.var36				;$b6
	ld a,(hl)
	or a
	ret nz
	ld l,Enemy.var2a				;$aa
	ld a,(hl)
	cp $80|ITEMCOLLISION_L2_BOOMERANG;ITEMCOLLISION_SE_16		;$96
	ret nz
; increase animation index by 1, and jump if larger than $03
	ld l,Enemy.var30				;$b0
	ld a,(hl)
	inc a
	cp $03
	ld (hl),a
	jr nc,_func_7aa1
	ld l,Enemy.counter1				;$86
	ld (hl),60						;$3c
	ld l,Enemy.state				;$84
	ld (hl),$0d
	call enemySetAnimation
	jp objectSetVisible81
	
; param		hl		Enemy.var30
_func_7aa1:
; set stored animation index to $03
	ld (hl),$03
	ld l,Enemy.state				;$84
	ld (hl),$0e
	ld l,Enemy.counter1				;$86
	ld (hl),180						;$b4
	ld l,Enemy.collisionType		;$a4
	ld (hl),$80|ENEMY_PODOBOO		;$29/$a9 ;become invincible
	ld a,$03
	jp enemySetAnimation
	
_func_7ab4:
	ld h,d
	ld l,Enemy.var37				;$b7
	call ecom_readPositionVars
	sub c
	add $04
	cp $09
	ret nc
	ldh a,(<hFF8F)
	sub b
	add $04
	cp $09
	ret

; if var3a is nonzero, decrement it until it reaches zero again and set bit 7 of collisionType 
_func_7ac8:
	ld h,d
	ld l,Enemy.var3a				;$ba
	ld a,(hl)
	or a
	ret z

	pop bc
	dec (hl)
	ret nz
	ld l,Enemy.collisionType		;$a4
	set 7,(hl)
	ret

_func_7ad6:
	ld a,ObjectStruct.yh			;$0b
	call objectGetRelatedObject1Var
	ld b,(hl)
	ld l,Enemy.xh					;$8d
	ld c,(hl)
	ld l,Enemy.animParameter		;$a1
	ld e,Enemy.subid				;$82
	ld a,(de)
	call _func_7af2
	ld e,Enemy.yh					;$8b
	ldi a,(hl)
	add b
	ld (de),a
	ld e,Enemy.xh					;$8d
	ld a,(hl)
	add c
	ld (de),a
	ret
	
_func_7af2:
	sub $02
	ld e,a
	add a
	add e
	add a
	add (hl)
	ld hl,_table_7afe
	rst_addAToHl
	ret

_table_7afe:
	.db $0a $00 $0a $00 $0a $00 ; subid2
	.db $f0 $0a $f2 $0a $f1 $0a ; subid3
	.db $00 $0b $02 $0b $01 $0b ; subid4
	.db $00 $f5 $01 $f5 $02 $f5 ; subid5
	.db $f0 $f6 $f1 $f6 $f2 $f6 ; subid6

; opens the mouth of a Manhandla head if facing angle is away from Link
; makes vulnerable to boomerang
; sets c flag if mouth opened
checkOpenMouth;_func_7b1c:
	call objectGetAngleTowardEnemyTarget ; $7b1c
	ld b,a
	ld e,Enemy.subid				;$82
	ld a,(de)
	sub $03
	swap a
	rrca
	sub b
	cp $f8
	ret nc
	ld h,d
	ld l,Enemy.state				;$84
	inc (hl)
	ld l,Enemy.enemyCollisionMode	;$a5
	ld (hl),ENEMYCOLLISION_MANHANDLA_HEAD_VULNERABLE	;$62
	ld l,Enemy.counter1				;$86
	ld (hl),120						;$78
; increase animation index by 1
	ld l,Enemy.var30				;$b0
	inc (hl)
	ld a,(hl)
	call enemySetAnimation
	scf
	ret