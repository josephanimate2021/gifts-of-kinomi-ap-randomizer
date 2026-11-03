; ==================================================================================================
; BALLADE: le Terrier des Serpents (donjon facultatif, index $0b, salles 4:d0-d7 ; idée de Denis : le
; gantelet des âmes d'Onimusha, le nom en clin d'œil à Snake). Voir story/salles/terrier.txt.
;
; - Le Gantelet des âmes ($0d), sur son socle (4:d1) : A devant, Link le prend (bit 0 de
;   wBalladeSoulState). Ensuite, chaque ennemi battu laisse une âme ($0b) qui vole jusqu'à Link :
;   le gantelet l'absorbe (wBalladeSouls). Une jarre ($0e), dans le coin de l'écran, se remplit.
; - Le contrôleur de chaque salle ($0a) : les âmes des ennemis qui meurent ; les ennemis qui
;   reviennent toujours (@config) ; les portes des âmes (le volet du haut, $07) qui s'ouvrent à 4, 8
;   et 12 âmes ; dans l'arène (4:d7), à 16 âmes, le boss (Denis : « tu demandes 16 âmes et j'en fais
;   à peine 8 » : c'était 6, 12, 18 et 24). Les serpents (ENEMY_ROPE) sont gris (la palette 6) et
;   tiennent quatre coups d'épée.
; - Le boss ($0c) : une machine de guerre (clin d'œil à Metal Gear REX), possédée par un fantôme.
;   Elle danse (Denis, 03/11/2026 : « un jeu de rythme, genre Dance Dance Revolution ; 5 manches ») :
;   cinq morceaux de la série, des flèches ($27) qui montent vers quatre cibles ($28) ; voir plus
;   bas. Cinq manches gagnées : elle explose ; le gantelet absorbe l'âme du fantôme : une relique,
;   le Bracelet des Âmes (bit 1 de wBalladeSoulState ; l'attaque tourbillon aspire les âmes). Puis
;   Link revient à l'entrée du Terrier (Denis : pas tout le chemin à l'envers).
; ==================================================================================================

.define TERRIER_BOSS_SOULS	16	; les âmes qu'il faut pour que le boss apparaisse
.define TERRIER_BOSS_HP		12
.define TERRIER_GHOST_HP	3
.define TERRIER_RESPAWN		100	; un ennemi revient toutes les 100 images (s'il en manque)
.define TERRIER_SNAKE_HP	8	; un serpent : quatre coups d'épée (l'épée L-1 enlève 2)

;;
; Le contrôleur d'une salle du Terrier (d = le contrôleur). var31 l'ennemi qui revient, var32
; combien au plus, var33 la porte des âmes (0 : pas de porte), var34-var35 les ennemis déjà
; comptés (un bit par emplacement), var36 le texte de la porte est dit, var37 le boss est là
controller:
	ld e,Interaction.state
	ld a,(de)
	or a
	jp nz,@run

	inc a
	ld (de),a
	ld a,PALH_TERRIER
	call loadPaletteHeader
	; La configuration de la salle
	ld a,(wActiveRoom)
	ld b,a
	ld hl,@config
-
	ldi a,(hl)
	cp $ff
	jr z,@configDone
	cp b
	jr z,+
	inc hl
	inc hl
	inc hl
	jr -
+
	ld e,Interaction.var31
	ldi a,(hl)
	ld (de),a
	inc e
	ldi a,(hl)
	ld (de),a
	inc e
	ld a,(hl)
	ld (de),a
@configDone:
	ld e,Interaction.counter1
	ld a,TERRIER_RESPAWN
	ld (de),a
	; La jarre des âmes, si Link a le gantelet
	ld a,(wBalladeSoulState)
	rrca
	jr nc,+
	ld b,$0e
	call createTerrierObject
+
	; L'arène, une fois le boss battu : plus d'ennemis
	ld a,(wActiveRoom)
	cp $d7
	jr nz,+
	ld a,(wBalladeSoulState)
	bit 1,a
	jr z,+
	ld e,Interaction.var31
	xor a
	ld (de),a
+
	ret

@texts:
	; (les serpents gris dès qu'ils sont là, même pendant que l'écran défile)
	call @snakes
	; Les textes en arrivant (la salle prête) : l'entrée (une fois), l'arène (une fois)
	ld a,(wPaletteThread_mode)
	or a
	ret nz
	ld a,(wScrollMode)
	cpl
	and $01
	ret nz
	ld e,Interaction.state
	ld a,$02
	ld (de),a
	ld a,(wActiveRoom)
	cp $d0
	ld b,$04
	ld hl,TX_5a18
	jr z,@onceText
	cp $d7
	ld b,$08
	ld hl,TX_5a1b
	ret nz
	ld a,(wBalladeSoulState)
	bit 1,a
	ret nz
@onceText:
	ld a,(wBalladeSoulState)
	and b
	ret nz
	ld a,(wBalladeSoulState)
	or b
	ld (wBalladeSoulState),a
	ld b,h
	ld c,l
	jp showText

@run:
	cp $01
	jr z,@texts
	ld a,(wTextIsActive)
	or a
	ret nz
	call @snakes
	call @absorb
	call @respawn
	call @gate
	ld a,(wActiveRoom)
	cp $d7
	ret nz
	jp @arena

;;
; Les serpents du Terrier : gris (la palette 6, PALH_TERRIER) et solides (TERRIER_SNAKE_HP), une
; fois qu'ils sont initialisés (Enemy.state non nul ; la palette 6 dit qu'ils sont déjà réglés)
@snakes:
	ld h,FIRST_ENEMY_INDEX
-
	ld l,Enemy.enabled
	ld a,(hl)
	or a
	jr z,+
	inc l
	ld a,(hl)
	cp ENEMY_ROPE
	jr nz,+
	ld l,Enemy.state
	ld a,(hl)
	or a
	jr z,+
	ld l,Enemy.oamFlagsBackup
	ld a,(hl)
	and $07
	cp $06
	jr z,+
	ld a,(hl)
	and $f8
	or $06
	ldi (hl),a		; oamFlagsBackup, puis oamFlags
	ld (hl),a
	ld l,Enemy.health
	ld (hl),TERRIER_SNAKE_HP
+
	inc h
	ld a,h
	cp LAST_ENEMY_INDEX+1
	jr c,-
	ret

;;
; Les âmes : chaque ennemi qui meurt laisse une âme, si Link a le gantelet. (Un ennemi battu
; disparaît aussitôt : on guette le nuage qu'il laisse, PART_ENEMY_DESTROYED, une âme par nuage.)
@absorb:
	ld a,(wBalladeSoulState)
	rrca
	ret nc
	ld b,$00		; b = l'emplacement (0-15)
@nextSlot:
	ld a,b
	add FIRST_PART_INDEX
	ld h,a
	ld l,Part.enabled
	ld a,(hl)
	or a
	jr z,@clear
	inc l
	ld a,(hl)
	cp PART_ENEMY_DESTROYED
	jr nz,@clear
	; déjà compté ?
	call @markAddress
	and (hl)
	jr nz,@next
	ld a,c
	or (hl)
	ld (hl),a
	; une âme, là où il est tombé
	ld a,b
	add FIRST_PART_INDEX
	ld h,a
	ld l,Part.yh
	ld a,(hl)
	ld l,Part.xh
	ld l,(hl)
	ld h,a
	push bc
	ld b,$0b
	call createTerrierObjectAt
	pop bc
	jr @next
@clear:
	call @markAddress
	cpl
	and (hl)
	ld (hl),a
@next:
	inc b
	ld a,b
	cp $10
	jr c,@nextSlot
	ret

;;
; @param	b	L'emplacement
; @param[out]	hl	Son octet dans var34-var35
; @param[out]	a,c	Son bit
@markAddress:
	ld a,b
	srl a
	srl a
	srl a
	add Interaction.var34
	ld l,a
	ld h,d
	ld a,b
	and $07
	ld c,$01
	jr z,++
-
	sla c
	dec a
	jr nz,-
++
	ld a,c
	ret

;;
; Les ennemis qui reviennent toujours (s'il en manque)
@respawn:
	ld e,Interaction.var31
	ld a,(de)
	or a
	ret z
	ld c,a			; c = l'ennemi
	; combien en vie ?
	ld b,$00
	ld h,FIRST_ENEMY_INDEX
-
	ld l,Enemy.enabled
	ld a,(hl)
	or a
	jr z,+
	inc l
	ld a,(hl)
	cp c
	jr nz,+
	ld l,Enemy.health
	ld a,(hl)
	or a
	jr z,+
	inc b
+
	inc h
	ld a,h
	cp LAST_ENEMY_INDEX+1
	jr c,-
	ld e,Interaction.var32
	ld a,(de)
	cp b
	ret z
	ret c
	; un de moins : il revient dans un moment
	call interactionDecCounter1
	ret nz
	ld (hl),TERRIER_RESPAWN
	; dans un coin, loin de Link
	call getRandomNumber
	and $03
	ld b,a
	ld a,(w1Link.yh)
	cp $58
	ld a,b
	jr c,+
	and $01			; Link en bas : un coin du haut
	jr ++
+
	or $02			; Link en haut : un coin du bas
++
	add a
	ld hl,@corners
	rst_addAToHl
	ldi a,(hl)
	ld b,a
	ld a,(hl)
	ld c,a
	push bc
	call getFreeEnemySlot
	pop bc
	ret nz
	ld e,Interaction.var31
	ld a,(de)
	ldi (hl),a		; l'ennemi
	ld (hl),$00		; sous-type
	ld l,Enemy.yh
	ld (hl),b
	ld l,Enemy.xh
	ld (hl),c
	; un nuage là où il apparaît
	ld h,b
	ld l,c
	ld b,$10		; (sous-type inutilisé : seulement le nuage)
	jp createTerrierPuffAt

@corners:
	.db $28 $28, $28 $c8, $88 $28, $88 $c8	; haut gauche, haut droite, bas gauche, bas droite

;;
; La porte des âmes (le volet du haut, $07) : elle s'ouvre quand le gantelet a assez d'âmes ; sinon,
; en entrant, la porte dit combien il en faut
@gate:
	ld e,Interaction.var33
	ld a,(de)
	or a
	ret z
	ld b,a
	ld a,(wRoomLayout+$07)
	cp $78
	ret nz
	ld a,(wBalladeSouls)
	cp b
	jr c,@notEnough
	ld c,$07
	ld a,$a0
	call setTile
	ld a,SND_SOLVEPUZZLE
	jp playSound
@notEnough:
	ld e,Interaction.var36
	ld a,(de)
	or a
	ret nz
	inc a
	ld (de),a
	; (combien il en manque encore, en BCD, pour \num1)
	ld a,(wBalladeSouls)
	cpl
	inc a
	add b
	call hexToDec
	ld (wTextNumberSubstitution),a
	xor a
	ld (wTextNumberSubstitution+1),a
	ld bc,TX_5a1a
	jp showText

;;
; L'arène : à 24 âmes, les ennemis s'en vont et le boss apparaît
@arena:
	ld e,Interaction.var37
	ld a,(de)
	or a
	ret nz
	ld a,(wBalladeSoulState)
	bit 1,a
	ret nz
	ld a,(wBalladeSouls)
	cp TERRIER_BOSS_SOULS
	ret c
	ld a,$01
	ld (de),a
	ld e,Interaction.var31
	xor a
	ld (de),a
	; les ennemis : en fumée
	ld h,FIRST_ENEMY_INDEX
-
	ld l,Enemy.enabled
	ld a,(hl)
	or a
	jr z,+
	push hl
	ld l,Enemy.yh
	ld a,(hl)
	ld l,Enemy.xh
	ld l,(hl)
	ld h,a
	call createTerrierPuffAt
	pop hl
	ld l,Enemy.enabled
	ld (hl),$00
+
	inc h
	ld a,h
	cp LAST_ENEMY_INDEX+1
	jr c,-
	; le boss, au milieu en haut
	ld hl,$4078
	ld b,$0c
	call createTerrierObjectAt
	ld a,SND_STRONG_POUND
	call playSound
	ld a,$20
	call setScreenShakeCounter
	ld bc,TX_5a1c
	jp showText

; salle, l'ennemi qui revient, combien au plus, la porte des âmes (0 : pas de porte)
@config:
	.db $d2, ENEMY_ROPE, 3, 4
	.db $d4, ENEMY_GHINI, 2, 8
	.db $d6, ENEMY_KEESE, 3, 12
	.db $d7, ENEMY_ROPE, 3, 0
	.db $ff


;;
; Crée un objet du Terrier à la position du contrôleur... (b = son sous-type)
createTerrierObject:
	ld hl,$0808
;;
; Crée un objet du Terrier (b = son sous-type) à la position h (y), l (x)
createTerrierObjectAt:
	ld a,b
	ld (wBalladeTerrierTmp),a
	ld a,h
	ld (wBalladeTerrierTmp+1),a
	ld a,l
	ld (wBalladeTerrierTmp+2),a
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_BALLADE_CREUSE
	inc l
	ld a,(wBalladeTerrierTmp)
	ld (hl),a
	ld l,Interaction.yh
	ld a,(wBalladeTerrierTmp+1)
	ld (hl),a
	ld l,Interaction.xh
	ld a,(wBalladeTerrierTmp+2)
	ld (hl),a
	ret

;;
; Un nuage de fumée à la position h (y), l (x)
createTerrierPuffAt:
	push hl
	call getFreeInteractionSlot
	pop bc
	ret nz
	ld (hl),INTERAC_PUFF
	ld l,Interaction.yh
	ld (hl),b
	ld l,Interaction.xh
	ld (hl),c
	ret


;;
; a (0-99) -> a en BCD
hexToDec:
	ld b,$00
-
	cp 10
	jr c,+
	sub 10
	inc b
	jr -
+
	ld c,a
	ld a,b
	swap a
	or c
	ret


;;
; La première image d'un objet du Terrier : son dessin, visible
terrierObjectInit:
	ld e,Interaction.state
	ld a,(de)
	or a
	ret nz
	inc a
	ld (de),a
	call interactionInitGraphics
	jp objectSetVisible82

;;
; a -> |a| (signé)
terrierAbs:
	bit 7,a
	ret z
	cpl
	inc a
	ret


;;
; Une âme ($0b) : elle vole jusqu'à Link (2 pixels par image), et le gantelet l'absorbe
soul:
	call terrierObjectInit
	ld a,(wTextIsActive)
	or a
	ret nz
	ld h,d
	ld l,Interaction.yh
	ld a,(w1Link.yh)
	call @step
	ld l,Interaction.xh
	ld a,(w1Link.xh)
	call @step
	ld l,Interaction.yh
	ld a,(w1Link.yh)
	sub (hl)
	call terrierAbs
	cp $06
	ret nc
	ld l,Interaction.xh
	ld a,(w1Link.xh)
	sub (hl)
	call terrierAbs
	cp $06
	ret nc
	ld hl,wBalladeSouls
	ld a,(hl)
	cp 99
	jr nc,+
	inc (hl)
+
	ld a,SND_GETSEED
	call playSound
	jp interactionDelete

; (hl) va vers a : deux pixels (un seul s'il est à un pixel)
@step:
	sub (hl)
	ret z
	jr c,@minus
	cp $01
	jr z,+
	inc (hl)
+
	inc (hl)
	ret
@minus:
	cp $ff
	jr z,+
	dec (hl)
+
	dec (hl)
	ret


;;
; Le Gantelet des âmes ($0d) sur son socle : A devant, Link le prend
gauntlet:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,@waitA
	ld a,(wBalladeSoulState)
	rrca
	jp c,interactionDelete
	call interactionInitGraphics
	call interactionIncState
	ld h,d
	ld l,Interaction.collisionRadiusY
	ld (hl),$06
	inc l
	ld (hl),$06
	call objectMarkSolidPosition
	ld e,Interaction.pressedAButton
	call objectAddToAButtonSensitiveObjectList
	jp objectSetVisiblec2
@waitA:
	ld e,Interaction.pressedAButton
	ld a,(de)
	or a
	ret z
	xor a
	ld (de),a
	ld hl,wBalladeSoulState
	set 0,(hl)
	call objectUnmarkSolidPosition
	ld e,Interaction.start
	call objectRemoveFromAButtonSensitiveObjectList
	ld a,SND_GETITEM
	call playSound
	ld b,$0e
	call createTerrierObject
	ld bc,TX_5a19
	call showText
	jp interactionDelete


;;
; La jarre des âmes ($0e) : fixe à l'écran (en haut à droite), elle se remplit ; pleine à chaque
; porte des âmes (4, 8, 12) et pour le boss (16). var30 : le dessin de la jarre vide
jar:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,+
	inc a
	ld (de),a
	call interactionInitGraphics
	call objectSetVisible80
	ld e,Interaction.oamTileIndexBase
	ld a,(de)
	ld e,Interaction.var30
	ld (de),a
+
	ldh a,(<hCameraY)
	add $18
	ld e,Interaction.yh
	ld (de),a
	ldh a,(<hCameraX)
	add $90
	ld e,Interaction.xh
	ld (de),a
	ld a,(wBalladeSouls)
	cp TERRIER_BOSS_SOULS
	ld b,$04
	jr nc,++
	and $03
	ld hl,@fill
	rst_addAToHl
	ld b,(hl)
++
	ld a,b
	add a
	add a
	ld b,a
	ld e,Interaction.var30
	ld a,(de)
	add b
	ld e,Interaction.oamTileIndexBase
	ld (de),a
	ret

@fill:
	.db 0, 1, 2, 3


; ==================================================================================================
; Le boss ($0c) : la machine possédée, en grand, au fond de l'arène : 7 x 5 briques du décor
; (tools/make_rex.py) qui sortent de l'ombre quand elle apparaît. Puis elle danse (Denis, 03/11/2026 :
; « on devrait en faire un jeu de rythme le boss, genre Dance Dance Revolution ; 5 manches ») :
; cinq morceaux de la série (balladeDanseRounds, data/ages/balladeDanseCharts.s, écrit par
; tools/make_music.py : la Berceuse de Zelda, la Ballade de la Déesse, le Chant des Tempêtes, la
; Vallée Gerudo, le Château de Lorule). Des flèches ($27) montent vers les quatre cibles grises ($28,
; en haut de l'écran) ; la croix dans la bonne direction quand une flèche touche sa cible (à
; DANSE_WINDOW images près) = coup juste : la voix du thème s'entend jusqu'à la flèche suivante
; (sinon elle est coupée, NR51, comme le prototype balladeRhythm.s). Les deux tiers de coups justes :
; la machine a mal (une manche de moins) ; sinon elle frappe du pied, Link perd un cœur (jamais le
; dernier quart) et la manche recommence. Cinq manches gagnées : elle explose.
; Le temps : wBalladeRhythmClock (compté par le moteur son), remis à zéro au début du morceau ;
; avant, DANSE_TRAVEL images d'avance (un temps négatif) pour que les premières flèches montent.
;
; var30 les manches qui restent, var31 la rangée de briques (en apparaissant, en disparaissant),
; var32 l'étape de la danse (0 Marine explique, 1 la manche s'annonce, 2 l'avance, 3 le morceau,
; 4 la fin du morceau), var33-34 la prochaine flèche à lancer, var35-36 la prochaine à juger,
; var37-38 le temps où la voix se tait, var39 les coups justes, var3a les flèches jugées,
; var3b le temps où elle reste blanche (touchée) ou les yeux fermés (un coup juste), var3c sa voix (NR51), var3d sa musique,
; var3e-3f le temps « maintenant » ; counter1 l'avance, la fin du morceau
; ==================================================================================================

.include "data/ages/balladeDanseCharts.s"

.define REX_HP		5	; les manches
.define REX_BRICK	$c0	; ses briques ($c0-$e2, tools/make_rex.py), 7 par rangée
.define REX_POS		$14	; la brique en haut à gauche (ligne 1, colonne 4)
.define REX_BOTTOM	$60	; (en pixels : le bas, la gauche, la droite de la machine)
.define REX_LEFT	$40
.define REX_RIGHT	$b0

.define DANSE_WINDOW	10	; un coup juste : à 10 images près
.define DANSE_TRAVEL	56	; une flèche met 56 images à monter jusqu'à sa cible (2 pixels par image)
.define DANSE_TARGET_Y	$18	; les cibles, à l'écran (sous la barre du haut)
.define DANSE_CENTER_X	$50	; le milieu des quatre cibles (à 16 pixels l'une de l'autre)
.define DANSE_LINK_Y	$80	; Link danse ici, figé (l'écran ne bouge plus)
.define DANSE_LINK_X	$78

rex:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @init
	.dw @rise
	.dw @danse
	.dw @explode
	.dw @vanish
	.dw @relic

@init:
	call interactionIncState
	ld h,d
	ld l,Interaction.var30
	ld (hl),REX_HP
	ld a,PALH_REX
	call loadPaletteHeader
	; Link pas dans la machine
	ld a,(w1Link.yh)
	cp REX_BOTTOM+$10
	jr nc,+
	ld a,$88
	ld (w1Link.yh),a
+
	ld a,MUS_MINIBOSS
	jp playSound

; Elle sort de l'ombre : une rangée de briques toutes les 8 images, de bas en haut
@rise:
	ld a,(wFrameCounter)
	and $07
	ret nz
	ld h,d
	ld l,Interaction.var31
	ld a,(hl)
	cp $05
	jp nc,interactionIncState
	inc (hl)
	ld b,a
	ld a,$04
	sub b
	ld e,$01
	call @drawRow
	ld a,SND_STRONG_POUND
	call playSound
	ld a,$08
	jp setScreenShakeCounter

;;
; Une rangée de briques : la machine (e = 1) ou le sol (e = 0)
; @param	a	La rangée (0-4)
@drawRow:
	ld c,a
	swap a
	add REX_POS
	ld b,a			; b = la position de la première brique
	ld a,c
	add a
	add a
	add a
	sub c
	add REX_BRICK
	ld c,a			; c = sa brique
	ld a,$07
--
	push af
	push bc
	push de
	ld a,e
	or a
	ld a,c
	jr nz,+
	ld a,$a0
+
	ld c,b
	call setTile
	pop de
	pop bc
	inc b
	inc c
	pop af
	dec a
	jr nz,--
	ret

; ----- La danse -----
@danse:
	ld a,(wTextIsActive)
	or a
	ret nz
	; touchée : elle reste blanche un instant ; un coup juste : elle ferme les yeux
	ld h,d
	ld l,Interaction.var3b
	ld a,(hl)
	or a
	jr z,+
	dec (hl)
	ld a,PALH_REX
	call z,loadPaletteHeader
+
	ld e,Interaction.var32
	ld a,(de)
	rst_jumpTable
	.dw @explain
	.dw @announce
	.dw @preroll
	.dw @play
	.dw @tail

; Marine explique (une fois) ; Link se met face à la machine, figé
@explain:
	ld a,SNDCTRL_STOPMUSIC
	call playSound
	ld a,(wDisabledObjects)
	or DISABLE_LINK
	ld (wDisabledObjects),a
	ld a,$01
	ld (wMenuDisabled),a
	ld a,DANSE_LINK_Y
	ld (w1Link.yh),a
	ld a,DANSE_LINK_X
	ld (w1Link.xh),a
	ld a,DIR_UP
	ld (w1Link.direction),a
	ld b,$28
	call createTerrierObject
	call @nextStep
	ld bc,TX_5c40
	jp showText

; La manche s'annonce (son nom) ; ses flèches, sa musique
@announce:
	ld e,Interaction.var30
	ld a,(de)
	ld b,a
	ld a,REX_HP
	sub b			; a = la manche (0-4)
	push af
	add a
	add a
	ld hl,balladeDanseRounds
	rst_addAToHl
	ld e,Interaction.var3d
	ldi a,(hl)
	ld (de),a
	ld e,Interaction.var3c
	ldi a,(hl)
	ld (de),a
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	ld e,Interaction.var33
	call @storeHl
	call @storeHl		; (var35-36 : la même)
	; var37-38 : la voix se tait (-DANSE_TRAVEL : avant le tout début de l'avance)
	ld a,$100-DANSE_TRAVEL
	ld (de),a
	inc e
	ld a,$ff
	ld (de),a
	inc e
	xor a
	ld (de),a		; var39, var3a
	inc e
	ld (de),a
	ld e,Interaction.counter1
	ld a,DANSE_TRAVEL
	ld (de),a
	call @nextStep
	pop af
	ld bc,TX_5c41
	add c
	ld c,a
	jp showText

; L'avance : un temps négatif, les premières flèches montent ; puis le morceau commence
@preroll:
	ld h,d
	ld l,Interaction.counter1
	ld a,(hl)
	cpl
	inc a
	ld l,Interaction.var3e
	ldi (hl),a
	ld (hl),$ff
	call @frame
	call interactionDecCounter1
	ret nz
	ld e,Interaction.var3d
	ld a,(de)
	ld (wActiveMusic),a
	di
	call playSound
	xor a
	ld (wBalladeRhythmClock),a
	ld (wBalladeRhythmClock+1),a
	ei
	jr @nextStep

; Le morceau : jusqu'à la dernière flèche jugée
@play:
	call @now
	call @frame
	ld e,Interaction.var35
	call @loadHl
	ldi a,(hl)
	and (hl)
	inc a
	ret nz
	ld e,Interaction.counter1
	ld a,60
	ld (de),a
@nextStep:
	ld e,Interaction.var32
	ld a,(de)
	inc a
	ld (de),a
	ret

; La fin du morceau (une seconde), puis le résultat de la manche
@tail:
	call @now
	call @voices
	call interactionDecCounter1
	ret nz
	ld a,SNDCTRL_STOPMUSIC
	call playSound
	ld a,$ff
	ld ($ff00+R_NR51),a
	call @clearArrows
	; les deux tiers de coups justes ?
	ld h,d
	ld l,Interaction.var39
	ld a,(hl)
	ld b,a
	add a
	add b
	ld b,a			; b = coups justes x 3
	inc l
	ld a,(hl)
	add a			; a = flèches x 2
	ld l,Interaction.var32
	ld (hl),$01		; (la manche suivante, ou la même)
	cp b
	jr z,@hurt
	jr c,@hurt
	; ratée : elle frappe du pied, Link perd un cœur (jamais le dernier quart)
	ld a,SND_STRONG_POUND
	call playSound
	ld a,$20
	call setScreenShakeCounter
	ld a,(wLinkHealth)
	sub $04
	jr z,+
	jr nc,++
+
	ld a,$01
++
	ld (wLinkHealth),a
	ld bc,TX_5c47
	jp showText

@hurt:
	ld l,Interaction.var3b
	ld (hl),30
	ld a,PALH_REX_HIT
	call loadPaletteHeader
	ld a,SND_BOSS_DAMAGE
	call playSound
	ld a,$20
	call setScreenShakeCounter
	ld h,d
	ld l,Interaction.var30
	dec (hl)
	ld bc,TX_5c46
	jp nz,showText
	; Cinq manches : elle explose ; Link est libre
	ld l,Interaction.state
	ld (hl),$03
	ld l,Interaction.counter1
	ld (hl),80
	ld a,(wDisabledObjects)
	and ~DISABLE_LINK
	ld (wDisabledObjects),a
	xor a
	ld (wMenuDisabled),a
	jp @clearTargets

;;
; Une image de la danse : les flèches à lancer, la flèche à juger, puis la voix
@frame:
	call @spawn
	call @judge

;;
; La voix du thème : entendue jusqu'au temps var37-38, coupée ensuite
@voices:
	call @voiceOver
	ld a,$ff
	jr nc,+
	ld e,Interaction.var3c
	ld a,(de)
	cpl
+
	ld ($ff00+R_NR51),a
	ret

;;
; @param[out]	cf	1 si le temps var37-38 est passé
@voiceOver:
	ld h,d
	ld l,Interaction.var3e
	ld c,(hl)
	inc l
	ld b,(hl)
	ld l,Interaction.var37
	ld a,(hl)
	sub c
	ld c,a
	inc l
	ld a,(hl)
	sbc b
	bit 7,a
	scf
	ret nz			; (négatif : passé)
	or c
	scf
	ret z			; (zéro : passé)
	xor a
	ret

;;
; Maintenant = l'horloge du moteur son
@now:
	di
	ld a,(wBalladeRhythmClock)
	ld c,a
	ld a,(wBalladeRhythmClock+1)
	ei
	ld h,d
	ld l,Interaction.var3e
	ld (hl),c
	inc l
	ld (hl),a
	ret

;;
; hl = l'adresse en (de) ; e avance de 2
@loadHl:
	ld a,(de)
	ld l,a
	inc e
	ld a,(de)
	ld h,a
	inc e
	ret

;;
; (de) = hl ; e avance de 2
@storeHl:
	ld a,l
	ld (de),a
	inc e
	ld a,h
	ld (de),a
	inc e
	ret

;;
; La flèche dont l'adresse est en (de) :
; @param[out]	hl	Son temps - maintenant
; @param[out]	b	Sa direction (0-3 : gauche, bas, haut, droite)
; @param[out]	c	Combien de temps la voix s'entend après un coup juste
; @param[out]	cf	1 : plus de flèches
@chartDelta:
	call @loadHl
	ldi a,(hl)
	ld c,a
	ldi a,(hl)
	ld b,a
	and c
	inc a
	scf
	ret z
	push hl
	ld h,d
	ld l,Interaction.var3e
	ld a,c
	sub (hl)
	ld c,a
	inc l
	ld a,b
	sbc (hl)
	pop hl
	ld e,a			; (e : le poids fort)
	ldi a,(hl)
	ld b,a
	ld a,(hl)
	ld h,e
	ld l,c
	ld c,a
	or a
	ret

;;
; Les flèches à lancer : celles qui touchent leur cible dans DANSE_TRAVEL images ou moins
@spawn:
	ld e,Interaction.var33
	call @chartDelta
	ret c
	bit 7,h
	jr nz,+			; déjà en retard : tout de suite, sur sa cible
	ld a,h
	or a
	ret nz
	ld a,l
	cp DANSE_TRAVEL+1
	ret nc
	jr ++
+
	xor a
++
	add a
	add DANSE_TARGET_Y
	ld c,a			; c = sa hauteur à l'écran
	ld a,b
	call @laneX
	ldh a,(<hCameraY)
	add c
	ld h,a
	ld b,$27
	call createTerrierObjectAt
	; la suivante
	ld h,d
	ld l,Interaction.var33
	ld a,(hl)
	add $04
	ldi (hl),a
	ld a,(hl)
	adc $00
	ld (hl),a
	jr @spawn

;;
; l = le x (dans la salle) de la cible a (0-3)
@laneX:
	swap a
	add DANSE_CENTER_X-24
	ld l,a
	ldh a,(<hCameraX)
	add l
	ld l,a
	ret

;;
; La flèche à juger : un appui sur la croix près d'elle, ou elle est passée
@judge:
	ld e,Interaction.var35
	call @chartDelta
	ret c
	; hl = son temps - maintenant : à DANSE_WINDOW images près ?
	bit 7,h
	jr nz,@late
	ld a,h
	or a
	ret nz			; (trop tôt : rien)
	ld a,l
	cp DANSE_WINDOW+1
	ret nc
	jr @near
@late:
	ld a,h
	inc a
	jr nz,@judged		; (très en retard : ratée)
	ld a,l
	cp $100-DANSE_WINDOW
	jr c,@judged		; trop tard : ratée
@near:
	ld a,(wGameKeysJustPressed)
	and BTN_UP|BTN_DOWN|BTN_LEFT|BTN_RIGHT
	ret z
	ld e,a
	ld a,b
	ld hl,@laneButtons
	rst_addAToHl
	ld a,(hl)
	and e
	jr z,@judged		; la mauvaise direction : ratée
	; juste ! la voix s'entend jusqu'à la flèche suivante ; la flèche disparaît
	ld h,d
	ld l,Interaction.var39
	inc (hl)
	ld l,Interaction.var3e
	ld a,(hl)
	add c
	ld e,a
	inc l
	ld a,(hl)
	adc $00
	ld l,Interaction.var37
	ld (hl),e
	inc l
	ld (hl),a
	ld a,b
	call @hitArrow
	; ses yeux clignotent (elle a senti le coup)
	ld h,d
	ld l,Interaction.var3b
	ld (hl),8
	ld a,PALH_REX_STUN
	call loadPaletteHeader
@judged:
	ld h,d
	ld l,Interaction.var3a
	inc (hl)
	ld l,Interaction.var35
	ld a,(hl)
	add $04
	ldi (hl),a
	ld a,(hl)
	adc $00
	ld (hl),a
	ret

@laneButtons:
	.db BTN_LEFT, BTN_DOWN, BTN_UP, BTN_RIGHT

;;
; La flèche la plus haute de la cible a disparaît (dans un petit nuage, sans bruit : la musique)
@hitArrow:
	call @laneX
	ld c,l			; c = son x
	ld b,$ff		; b = la plus haute
	ld e,$00		; e = son objet
	ld h,FIRST_INTERACTION_INDEX
-
	call @isArrow
	jr nz,+
	ld l,Interaction.xh
	ld a,(hl)
	cp c
	jr nz,+
	ld l,Interaction.yh
	ld a,(hl)
	cp b
	jr nc,+
	ld b,a
	ld e,h
+
	inc h
	ld a,h
	cp LAST_INTERACTION_INDEX+1
	jr c,-
	ld a,e
	or a
	ret z
	ld h,a
	ld l,Interaction.yh
	ld b,(hl)
	ld l,Interaction.xh
	ld c,(hl)
	push bc
	call @deleteObject
	call getFreeInteractionSlot
	pop bc
	ret nz
	ld (hl),INTERAC_PUFF
	inc l
	ld (hl),$80		; (sans son)
	ld l,Interaction.yh
	ld (hl),b
	ld l,Interaction.xh
	ld (hl),c
	ret

;;
; z si l'objet h est une flèche ($27)
@isArrow:
	ld l,Interaction.enabled
	ld a,(hl)
	or a
	jr z,@notObject
	inc l
	ld a,(hl)
	cp INTERAC_BALLADE_CREUSE
	jr nz,@notObject
	inc l
	ld a,(hl)
	cp $27
	ret

;;
; z si l'objet h est un objet de la danse de sous-type c
@isObjectC:
	ld l,Interaction.enabled
	ld a,(hl)
	or a
	jr z,@notObject
	inc l
	ld a,(hl)
	cp INTERAC_BALLADE_CREUSE
	jr nz,@notObject
	inc l
	ld a,(hl)
	cp c
	ret
@notObject:
	or $01
	ret

;;
; L'objet h disparaît (vidé en entier, comme le jeu)
@deleteObject:
	ld l,Interaction.enabled
	xor a
-
	ldi (hl),a
	bit 7,l
	jr z,-
	ret

;;
; Les flèches qui restent disparaissent (et les cibles)
@clearArrows:
	ld c,$27
	jr @clearObjects
@clearTargets:
	call @clearArrows
	ld c,$28
@clearObjects:
	ld h,FIRST_INTERACTION_INDEX
-
	call @isObjectC
	call z,@deleteObject
	inc h
	ld a,h
	cp LAST_INTERACTION_INDEX+1
	jr c,-
	ret

; Elle explose : des explosions partout sur elle (blanche un instant, puis ses couleurs)
@explode:
	ld e,Interaction.counter1
	ld a,(de)
	cp 50
	ld a,PALH_REX
	call z,loadPaletteHeader
	ld a,(wFrameCounter)
	and $07
	jr nz,+
	call getRandomNumber
	and $3f
	add $18
	ld h,a
	call getRandomNumber
	and $5f
	add REX_LEFT+8
	ld l,a
	call createTerrierPuffAt
	ld a,SND_EXPLOSION
	call playSound
	ld a,$08
	call setScreenShakeCounter
+
	call interactionDecCounter1
	ret nz
	ld l,Interaction.var31
	ld (hl),$00
	ld a,SND_BIG_EXPLOSION
	call playSound
	jp interactionIncState

; Elle disparaît : le sol, une rangée toutes les 8 images
@vanish:
	ld a,(wFrameCounter)
	and $07
	ret nz
	ld h,d
	ld l,Interaction.var31
	ld a,(hl)
	cp $05
	jr nc,@done
	inc (hl)
	push af
	ld b,a
	swap b
	; une explosion sur la rangée
	ld a,b
	add $18
	ld h,a
	ld l,$78
	call createTerrierPuffAt
	pop af
	ld e,$00
	jp @drawRow
@done:
	; Le gantelet absorbe l'âme du fantôme : la relique, le Bracelet des Âmes
	ld hl,wBalladeSoulState
	set 1,(hl)
	ld a,SND_SOLVEPUZZLE
	call playSound
	ld bc,TX_5a1d
	call showText
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),90
	ret

; Les textes finis (et la réplique de Marine, INTERAC_MARINE $08) : Link revient à l'entrée du
; Terrier (Denis : pas tout le chemin à l'envers)
@relic:
	ld a,(wTextIsActive)
	or a
	jr z,+
	ld e,Interaction.counter1
	ld a,90
	ld (de),a
	ret
+
	call interactionDecCounter1
	ret nz
	ld a,$84
	ld (wWarpDestGroup),a
	ld a,$d0
	ld (wWarpDestRoom),a
	ld a,$97
	ld (wWarpDestPos),a
	xor a
	ld (wWarpTransition),a
	ld a,$03 ; fondu
	ld (wWarpTransition2),a
	ld a,SND_TELEPORT
	call playSound
	jp interactionDelete


;;
; Une flèche de la danse ($27) : elle monte de 2 pixels par image jusqu'au-dessus des cibles. Sa
; direction vient de son x (un objet tout neuf est vidé avant sa première image : la machine la
; crée sous sa cible). Image 7 de art/rex.txt : la flèche du haut ($1c), celle de gauche ($1e) ;
; retournées, celles du bas et de droite
danseArrow:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,@run
	inc a
	ld (de),a
	call interactionInitGraphics
	call objectSetVisible80
	ldh a,(<hCameraX)
	ld b,a
	ld e,Interaction.xh
	ld a,(de)
	sub b
	sub DANSE_CENTER_X-24
	swap a
	and $03
	add a
	ld hl,@lanes
	rst_addAToHl
	ld e,Interaction.oamTileIndexBase
	ld a,(de)
	add (hl)
	ld (de),a
	inc hl
	ld a,(hl)
	ld e,Interaction.oamFlagsBackup
	ld (de),a
	inc e
	ld (de),a
@run:
	ld h,d
	ld l,Interaction.yh
	dec (hl)
	dec (hl)
	ldh a,(<hCameraY)
	add DANSE_TARGET_Y-$18
	cp (hl)
	ret c
	jp interactionDelete

; l'image en plus, les retournements et la palette : gauche, bas, haut, droite
@lanes:
	.db $02, $02
	.db $00, $41
	.db $00, $01
	.db $02, $22

;;
; Les quatre cibles grises de la danse ($28) : fixes à l'écran, en haut
danseTargets:
	call terrierObjectInit
	ldh a,(<hCameraY)
	add DANSE_TARGET_Y
	ld e,Interaction.yh
	ld (de),a
	ldh a,(<hCameraX)
	add DANSE_CENTER_X
	ld e,Interaction.xh
	ld (de),a
	ret


;;
; Les projectiles de la machine ($0f ; plus utilisés depuis qu'elle danse) : var3e 0 un missile (il file vers là où était Link), 1 un
; rocher (son ombre, puis il tombe), 2 une étincelle. Images (spr_ballade_rex, art/rex.txt) : 0-1 le
; missile, 2 le rocher, 3 son ombre, 4-5 l'étincelle
ghost:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,@run
	inc a
	ld (de),a
	call interactionInitGraphics
	; son type, d'après là où il apparaît (un objet tout neuf est vidé avant sa première image :
	; la machine ne peut pas le lui dire) : un rocher devant la machine, un missile au lance-missiles,
	; sinon une étincelle
	ld e,Interaction.yh
	ld a,(de)
	ld b,$01
	cp REX_BOTTOM+$08
	jr nc,++
	ld b,$02
	cp $28
	jr nz,++
	ld e,Interaction.xh
	ld a,(de)
	cp $68
	jr z,+
	cp $88
	jr nz,++
+
	ld b,$00
++
	ld e,Interaction.var3e
	ld a,b
	ld (de),a
	ld hl,@first
	rst_addAToHl
	ld b,(hl)
	ld a,(de)
	ld hl,@time
	rst_addAToHl
	ld c,(hl)
	ld h,d
	ld l,Interaction.counter1
	ld (hl),c
	ld a,b
	call @image
	ld e,Interaction.var3e
	ld a,(de)
	or a
	jr nz,+
	; le missile : vers Link
	call objectGetAngleTowardLink
	ld e,Interaction.angle
	ld (de),a
	ld e,Interaction.speed
	ld a,SPEED_180
	ld (de),a
+
	jp objectSetVisible81

@first:
	.db 0, 3, 4
@time:
	.db 120, 64, 20

; a = l'image
@image:
	add a
	add a
	ld h,d
	ld l,Interaction.var3f
	ld b,a
	ld a,(hl)
	or a
	jr nz,+
	ld l,Interaction.oamTileIndexBase
	ld a,(hl)
	ld l,Interaction.var3f
	ld (hl),a		; var3f : la première tuile (l'image 0)
+
	ld a,(hl)
	add b
	ld l,Interaction.oamTileIndexBase
	ld (hl),a
	ret

@run:
	ld a,(wTextIsActive)
	or a
	ret nz
	ld e,Interaction.var3e
	ld a,(de)
	rst_jumpTable
	.dw @missileRun
	.dw @rockRun
	.dw @sparkRun

@missileRun:
	call objectApplySpeed
	; la flamme : deux images
	ld a,(wFrameCounter)
	and $04
	rrca
	rrca
	call @image
	ld a,$0a
	call @touch
	ld a,$fc
	jr c,@hit
	call interactionDecCounter1
	jr z,@puff
	ld e,Interaction.yh
	ld a,(de)
	cp $a8
	jr nc,@puff
	ret

@rockRun:
	call interactionDecCounter1
	jr z,@landed
	ld a,(hl)
	cp 24
	jr nc,@shadow
	jr nz,+
	; il tombe, de haut
	ld a,2
	call @image
	ld h,d
	ld l,Interaction.zh
	ld (hl),-48
+
	ld h,d
	ld l,Interaction.zh
	ld a,(hl)
	add $02
	ld (hl),a
	ret
@shadow:
	; l'ombre, qui clignote
	ld h,d
	ld l,Interaction.visible
	set 7,(hl)
	ld a,(wFrameCounter)
	and $02
	ret z
	res 7,(hl)
	ret
@landed:
	ld a,SND_STRONG_POUND
	call playSound
	ld a,$06
	call setScreenShakeCounter
	ld a,$0c
	call @touch
	ld a,$f8
	jr c,@hit
	jr @puff

@sparkRun:
	ld a,(wFrameCounter)
	and $04
	rrca
	rrca
	add $04
	call @image
	call interactionDecCounter1
	ret nz
	jp interactionDelete

; Il touche Link : des dégâts (a), puis un nuage
@hit:
	ld b,a
	ld a,(w1Link.invincibilityCounter)
	or a
	jr nz,@puff
	ld a,b
	ld (w1Link.damageToApply),a
	ld a,$30
	ld (w1Link.invincibilityCounter),a
	ld a,SND_DAMAGE_LINK
	call playSound
@puff:
	ld h,d
	ld l,Interaction.yh
	ld a,(hl)
	ld l,Interaction.xh
	ld l,(hl)
	ld h,a
	call createTerrierPuffAt
	jp interactionDelete

; cf : Link est à moins de a pixels
@touch:
	ld b,a
	ld h,d
	ld l,Interaction.yh
	ld a,(w1Link.yh)
	sub (hl)
	call terrierAbs
	cp b
	ret nc
	ld l,Interaction.xh
	ld a,(w1Link.xh)
	sub (hl)
	call terrierAbs
	cp b
	ret


;;
; Le Bracelet des Âmes (Denis) : l'attaque tourbillon aspire l'âme des ennemis autour de Link (à
; moins de 40 pixels) : une âme vole de chacun jusqu'au gantelet ($0b) et il perd 6 points de vie
; (les petits en meurent, les gros sont blessés ; pas les boss). C'est tout : plus de rayon, plus de
; vie rendue à chaque coup (object_code/common/itemParents/swordParent.s appelle ceci quand le
; tourbillon part).
soulSpin:
	ld a,(wBalladeSoulState)
	bit 1,a
	ret z
	ld h,FIRST_ENEMY_INDEX
@next:
	ld l,Enemy.enabled
	ld a,(hl)
	or a
	jr z,@skip
	; Jamais un boss ni un mini-boss (ENEMY_$01-$08 : Ramrock et ses bras, Veran... ; $70 et
	; plus) : Givrolin n'a que 4 points de vie, ses phases se comptent ailleurs ; vidé, il ne
	; renvoyait plus ses bras (Denis, bloqué)
	ld l,Enemy.id
	ld a,(hl)
	cp ENEMY_RIVER_ZORA
	jr c,@skip
	cp $70
	jr nc,@skip
	ld l,Enemy.collisionType
	bit 7,(hl)
	jr z,@skip
	ld l,Enemy.health
	ld a,(hl)
	or a
	jr z,@skip
	cp 25
	jr nc,@skip		; (les boss)
	ld l,Enemy.yh
	ld a,(w1Link.yh)
	sub (hl)
	call terrierAbs
	cp 40
	jr nc,@skip
	ld l,Enemy.xh
	ld a,(w1Link.xh)
	sub (hl)
	call terrierAbs
	cp 40
	jr nc,@skip
	; son âme, aspirée
	ld l,Enemy.health
	ld a,(hl)
	sub 6
	jr nc,+
	xor a
+
	ld (hl),a
	push hl
	ld l,Enemy.yh
	ld a,(hl)
	ld l,Enemy.xh
	ld l,(hl)
	ld h,a
	ld b,$0b
	call createTerrierObjectAt
	pop hl
@skip:
	inc h
	ld a,h
	cp LAST_ENEMY_INDEX+1
	jr c,@next
	ret
