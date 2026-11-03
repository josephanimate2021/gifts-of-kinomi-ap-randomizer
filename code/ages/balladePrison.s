; ==================================================================================================
; BALLADE: la Tour Sans-Nuit, Link prisonnier (idée de Denis, 01/11/2026).
;
; Link passe l'arche de la tour : BONK, il est assommé ; Marine est emportée dans une cage et crie
; son nom. Il se réveille au cachot (5:a0, le sous-sol), sans rien : ses objets sont confisqués
; (PRISON_BACKUP). Il remonte la tour en récupérant ses affaires dans des coffres, d'étage en étage :
; le bouclier, puis les graines, ... et l'épée en dernier. Des gardes de partout (les Veilleurs,
; ENEMY_AMBI_GUARD, en fantômes de cauchemar) : vu, Link retourne au cachot ; un passage dans sa
; cellule le ramène à l'arrivée de l'étage où il a été pris. Au 5F, Marine, en mouette, est en cage
; dans la salle de Dark Link : elle l'encourage ; Dark Link battu, la cage s'ouvre, la 8e essence.
; Puis le combat en rythme (l'Insomnis, 6F), et Ganon : sans la Master Sword, Marine casse le
; quatrième mur (« Sauvegarder et Quitter » : on revient au début de la tour) et l'envoie chez le
; Zora (la Fosse de Bulle). Au retour, un escalier de l'entrée monte tout droit au 6F.
;
; GLOBALFLAG_BALLADE_ASSOMME : le coup sur la tête a eu lieu (une seule fois).
; GLOBALFLAG_BALLADE_PRISON : Link prisonnier (objets confisqués, Marine en cage, gardes partout).
; ==================================================================================================

; Les objets confisqués : wInventoryB, wInventoryA et wInventoryStorage, dans les drapeaux des salles
; 5:d7-e8 (jamais visitées), donc dans la sauvegarde
.define PRISON_BACKUP		wGroup5RoomFlags+$d7
.define PRISON_SLOTS		2+INVENTORY_CAPACITY
; L'étage où Link a été pris (1-4 ; 0 : le sous-sol) : le passage du cachot l'y ramène (salle 5:a9,
; jamais visitée)
.define PRISON_CHECKPOINT	wGroup5RoomFlags+$a9

.define PRISON_CELL_ROOM	$a0
.define PRISON_CELL_POS		$22	; (2,2) : dans la cellule
.define PRISON_PASSAGE_POS	$11	; (1,1) : le passage, au fond de la cellule
.define PRISON_BAR_POS		$97	; (9,7) : sous l'arche de l'entrée, la herse

;;
; @param[out]	zflag	nz : Link est prisonnier
isPrisoner:
	ld a,GLOBALFLAG_BALLADE_PRISON
	jp checkGlobalFlag

;;
; Attendre la fin de l'arrivée dans la salle (une boîte de texte ouverte avant serait refusée)
; @param[out]	zflag	nz tant que la salle n'est pas prête
waitRoomReady:
	ld a,(wPaletteThread_mode)
	or a
	ret nz
	ld a,(wScrollMode)
	cpl
	and $01
	ret

;;
; Tous les objets de Link (B, A, la réserve) passent dans PRISON_BACKUP ; il n'a plus rien
confiscate:
	push de
	ld hl,wInventoryB
	ld de,PRISON_BACKUP
	ld b,PRISON_SLOTS
-
	ld a,(hl)
	ld (de),a
	xor a
	ldi (hl),a
	inc de
	dec b
	jr nz,-
	pop de
	ld a,$ff
	ld (wStatusBarNeedsRefresh),a
	ret

;;
; Rend les objets confisqués d'un groupe (itemGroup) : chacun à sa place d'avant (B, A ou sa case de
; la réserve), sinon dans la première case libre.
; @param	c	le groupe (1-6 ; 6 : tout ce qui reste)
restoreGroup:
	ld b,$00
@next:
	ld hl,PRISON_BACKUP
	ld a,b
	rst_addAToHl
	ld a,(hl)
	or a
	jr z,@skip
	ld a,c
	cp $06
	jr z,@give
	ld a,(hl)
	call itemGroup
	ld a,c
	cp e
	jr nz,@skip
@give:
	ld e,(hl)
	ld (hl),$00
	ld hl,wInventoryB
	ld a,b
	rst_addAToHl
	ld a,(hl)
	or a
	jr z,@put
	ld hl,wInventoryStorage
-
	ld a,(hl)
	or a
	jr z,@put
	inc l
	ld a,l
	cp <(wInventoryStorage+INVENTORY_CAPACITY)
	jr c,-
	jr @skip
@put:
	ld (hl),e
@skip:
	inc b
	ld a,b
	cp PRISON_SLOTS
	jr c,@next
	ld a,$ff
	ld (wStatusBarNeedsRefresh),a
	ret

;;
; @param	a	un objet (ITEM_*)
; @param[out]	e	son groupe : le coffre qui le rend (5 : tout le reste, sauf les épées)
itemGroup:
	push hl
	ld hl,@groups
	ld e,a
-
	ldi a,(hl)
	or a
	jr z,@default
	cp e
	ldi a,(hl)
	jr nz,-
	ld e,a
	pop hl
	ret
@default:
	ld e,$05
	pop hl
	ret

@groups:
	.db ITEM_SHIELD,		$01
	.db ITEM_SEED_SATCHEL,		$02
	.db ITEM_SHOOTER,		$02
	.db ITEM_BOOMERANG,		$03
	.db ITEM_BOMB,			$03
	.db ITEM_FEATHER,		$03	; (la lave du 2F se saute : 5:c3)
	.db ITEM_CANE_OF_SOMARIA,	$04
	.db ITEM_SWITCH_HOOK,		$04
	.db ITEM_BRACELET,		$04
	.db ITEM_SHOVEL,		$04
	.db ITEM_HARP,			$04
	.db ITEM_SWORD,			$06
	.db ITEM_BIGGORON_SWORD,	$06
	.db $00

;;
; Le point de retour (mort, Sauvegarder et Quitter) : hl = groupe, salle, direction, y, x
setRespawn:
	ld de,wDeathRespawnBuffer
	ldi a,(hl)
	ld (de),a
	inc de
	ldi a,(hl)
	ld (de),a
	inc de
	xor a
	ld (de),a		; stateModifier
	inc de
	ldi a,(hl)
	ld (de),a
	inc de
	ldi a,(hl)
	ld (de),a
	inc de
	ld a,(hl)
	ld (de),a
	ret

; Au cachot
respawnCell:
	.db $05, PRISON_CELL_ROOM, DIR_DOWN, $28, $28
; L'entrée de la tour, sous l'arche
respawnEntrance:
	.db $05, $c0, DIR_UP, $98, $78

setRespawnCell:
	push de
	ld hl,respawnCell
	call setRespawn
	pop de
	ret

setRespawnEntrance:
	push de
	ld hl,respawnEntrance
	call setRespawn
	pop de
	ret

;;
; Link (LINK_STATE_08) tombe à terre : son animation, une seule fois, quand il est bien dans cet
; état (linkState08 l'applique puis efface wcc50)
setCollapsed:
	ld e,Interaction.var3f
	ld a,(de)
	or a
	ret nz
	ld a,(w1Link.state)
	cp LINK_STATE_08
	ret nz
	ld a,(w1Link.substate)
	dec a
	ret nz
	inc a
	ld (de),a
	ld a,LINK_ANIM_MODE_COLLAPSED
	ld (wcc50),a
	ret

;;
; Fondu vers une salle de la tour
; @param	b	la salle
; @param	c	la position
; @param	a	wWarpTransition2 ($01 d'un coup, $03 en fondu)
warpInTower:
	ld (wWarpTransition2),a
	ld a,$85
	ld (wWarpDestGroup),a
	ld a,b
	ld (wWarpDestRoom),a
	ld a,c
	ld (wWarpDestPos),a
	xor a
	ld (wWarpTransition),a
	ret


; ==================================================================================================
; L'entrée de la tour (INTERAC_BALLADE_OBJECT $62, 5:c0) :
; - la première fois, quelques pas après l'arche : BONK, Link tombe ; Marine crie son nom ; écran
;   noir, ses objets confisqués ; il se réveille au cachot (prisonCell) ;
; - prisonnier : la herse est baissée sous l'arche (pas de sortie sans Marine) ;
; - Ganon vu sans la Master Sword (drapeau $20 de 5:c7), Marine libre : un escalier au milieu
;   (5,7) monte tout droit au 6F (warpSources.s).
; ==================================================================================================
kidnap:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @init
	.dw @walkIn
	.dw @knocked
	.dw @cries
	.dw @dark

@init:
	call waitRoomReady
	ret nz
	ld a,GLOBALFLAG_BALLADE_ASSOMME
	call checkGlobalFlag
	jr nz,@after
	; (la première fois : Link arrive par l'arche)
	ld a,(w1Link.yh)
	cp $80
	jp c,interactionDelete
	jp interactionIncState

@after:
	call isPrisoner
	jr z,+
	ld c,PRISON_BAR_POS
	ld a,$1d		; (un bloc fixe)
	call setTile
	jp interactionDelete
+
	ld a,(wGroup5RoomFlags+$c7)
	and $20
	jp z,interactionDelete
	ld c,$57
	ld a,$45
	call setTile
	jp interactionDelete

; Quelques pas dans la tour (et Marine a fini de parler)
@walkIn:
	ld a,(wTextIsActive)
	or a
	ret nz
	ld a,(w1Link.yh)
	cp $70
	ret nc
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),90
	ld a,DISABLE_ENEMIES|DISABLE_ITEMS|DISABLE_COMPANION	; (pas Link : il doit tomber, LINK_STATE_08)
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	ld a,LINK_STATE_08
	ld (wLinkForceState),a
	ld a,SND_STRIKE
	call playSound
	ld a,30
	jp setScreenShakeCounter

; Link à terre
@knocked:
	call setCollapsed
	call interactionDecCounter1
	ret nz
	call interactionIncState
	ld a,SND_BALLADE_GULL
	call playSound
	ld bc,TX_5c35
	jp showText

; Marine crie son nom, emportée
@cries:
	ld a,(wTextIsActive)
	or a
	ret nz
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),60
	call confiscate
	ld a,GLOBALFLAG_BALLADE_ASSOMME
	call setGlobalFlag
	ld a,GLOBALFLAG_BALLADE_PRISON
	call setGlobalFlag
	xor a
	ld (PRISON_CHECKPOINT),a
	call setRespawnCell
	jp fadeoutToBlack

@dark:
	call interactionDecCounter1
	ret nz
	ldbc PRISON_CELL_ROOM, PRISON_CELL_POS
	ld a,$01
	call warpInTower
	jp interactionDelete


; ==================================================================================================
; Le cachot (INTERAC_BALLADE_OBJECT $63, 5:a0) : Link s'y réveille (au premier réveil, l'écran se
; rallume : il était noir) ; dans sa cellule, un bloc se pousse (la sortie). Le passage du fond
; (PRISON_PASSAGE_POS) le ramène à l'étage où il a été pris (PRISON_CHECKPOINT).
; var30 : le passage est ouvert
; ==================================================================================================
prisonCell:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @init
	.dw @lie
	.dw @wake
	.dw @up
	.dw @watch

@init:
	call isPrisoner
	jp z,interactionDelete
	call interactionIncState
	; Le premier réveil : après le coup sur la tête, l'écran est noir
	ld hl,wGroup5RoomFlags+PRISON_CELL_ROOM
	bit 6,(hl)
	ret nz
	jp fadeinFromBlack

; Link arrivé (son état normal : avant, il ne prendrait pas l'état forcé) ; dans sa cellule, il est
; couché un moment
@lie:
	ld a,(w1Link.state)
	cp LINK_STATE_NORMAL
	ret nz
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),1
	ld a,(w1Link.yh)
	cp $40
	ret nc
	ld a,(w1Link.xh)
	cp $40
	ret nc
	ld (hl),75
	ld a,DISABLE_ENEMIES|DISABLE_ITEMS|DISABLE_COMPANION	; (pas Link : il doit tomber, LINK_STATE_08)
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	ld a,LINK_STATE_08
	ld (wLinkForceState),a
	ret

@wake:
	call setCollapsed
	call interactionDecCounter1
	ret nz
	jp interactionIncState

; Debout (quand la salle est prête : sinon le texte serait refusé)
@up:
	call waitRoomReady
	ret nz
	call interactionIncState
	xor a
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	ld a,LINK_STATE_NORMAL
	ld (wLinkForceState),a
	ld a,(PRISON_CHECKPOINT)
	or a
	jr z,+
	ld e,Interaction.var30
	ld (de),a
	ld c,PRISON_PASSAGE_POS
	ld a,$17
	call setTile
+
	; Le premier réveil : Link comprend (une fois)
	ld hl,wGroup5RoomFlags+PRISON_CELL_ROOM
	bit 6,(hl)
	ret nz
	set 6,(hl)
	ld bc,TX_5c36
	jp showText

@watch:
	ld e,Interaction.var30
	ld a,(de)
	or a
	ret z
	ld a,(wActiveTilePos)
	cp PRISON_PASSAGE_POS
	ret nz
	ld a,(wTextIsActive)
	or a
	ret nz
	; l'arrivée de l'étage
	ld a,(PRISON_CHECKPOINT)
	dec a
	add a
	ld hl,@arrivals
	rst_addAToHl
	ldi a,(hl)
	ld b,a
	ld c,(hl)
	ld a,$03
	call warpInTower
	ld a,SND_TELEPORT
	call playSound
	jp interactionDelete

@arrivals:
	.db $c0, $27	; 1F : l'entrée, en haut (là où arrive l'escalier du sous-sol)
	.db $c2, $87	; 2F
	.db $c5, $87	; 3F
	.db $c8, $87	; 4F

;;
; Un garde a vu Link (ambiGuard.s, donjon 8 ; la téléportation est déjà prête) : prisonnier, il
; retourne au cachot ; l'étage est retenu pour le passage
caught:
	call isPrisoner
	ret z
	ld a,(wActiveRoom)
	ld b,a
	ld hl,@floors
-
	ldi a,(hl)
	or a
	jr z,+
	cp b
	ldi a,(hl)
	jr nz,-
	ld (PRISON_CHECKPOINT),a
+
	ldbc PRISON_CELL_ROOM, PRISON_CELL_POS
	ld a,$03
	call warpInTower
	jp setRespawnCell

@floors:
	.db $c0,1, $c1,1
	.db $c2,2, $c3,2, $a2,2
	.db $c5,3, $c6,3, $a5,3
	.db $c8,4, $c9,4, $ca,4
	.db $00


; ==================================================================================================
; Un coffre des objets confisqués (INTERAC_BALLADE_OBJECT $64, sur le coffre ; sa salle dit le groupe :
; @rooms). Le coffre est un vrai coffre vide (chestData.s : rien dedans) ; ouvert (ROOMFLAG_ITEM), il
; rend son groupe d'objets ; dans les salles du bout d'un étage, l'escalier apparaît alors.
; var30 : le groupe ; var31 : la position de l'escalier (0 : aucun)
; ==================================================================================================
prisonChest:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @init
	.dw @watch
	.dw @text

@init:
	call waitRoomReady
	ret nz
	ld a,(wActiveRoom)
	ld b,a
	ld hl,@rooms
-
	ldi a,(hl)
	cp $ff
	jp z,interactionDelete
	cp b
	jr z,+
	inc hl
	inc hl
	jr -
+
	ld e,Interaction.var30
	ldi a,(hl)
	ld (de),a
	inc e
	ld a,(hl)
	ld (de),a
	call interactionIncState
	; Déjà ouvert : ses objets sont déjà rendus (sans rien dire), l'escalier est là
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	ret z
	call @restore
	jr @stairs

@watch:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	ret z
	call interactionIncState
	call @restore
	ld a,SND_GETITEM
	call playSound
	ld e,Interaction.var30
	ld a,(de)
	dec a
	add <TX_5c38
	ld c,a
	ld b,>TX_5c38
	jp showText

@text:
	ld a,(wTextIsActive)
	or a
	ret nz
	ld e,Interaction.var31
	ld a,(de)
	or a
	jp z,interactionDelete
	ld a,SND_SOLVEPUZZLE
	call playSound
@stairs:
	ld e,Interaction.var31
	ld a,(de)
	or a
	jp z,interactionDelete
	ld c,a
	ld a,$45
	call setTile
	jp interactionDelete

@restore:
	ld e,Interaction.var30
	ld a,(de)
	ld c,a
	jp restoreGroup

; salle, groupe, l'escalier qui apparaît (0 : aucun)
@rooms:
	.db $a1, $01, $8b	; B1 : le bouclier
	.db $c0, $02, $00	; 1F : les graines (la Lune qui tombe, à côté, a l'escalier)
	.db $c2, $03, $00	; 2F : le Boomerang-Toupie, les bombes, la Cape de Roc
	.db $a2, $04, $8b	; 2F : la Canne, le Grappin, le Bracelet, la Pelle, la Lanterne
	.db $a5, $05, $83	; 3F : la Clochette d'Aube, le reste
	.db $ca, $06, $87	; 4F : l'épée
	.db $ff


; ==================================================================================================
; Marine en cage (INTERAC_MARINE $0a, 5:c4, la salle de Dark Link au 5F) : en mouette, dans la cage
; du haut (tour.txt) ; elle encourage Link (TX_5c3e), crie de temps en temps pendant le combat.
; Dark Link battu (drapeau $80 de la salle) : la cage s'ouvre, Marine est libre (TX_5c3f), le point
; de retour redevient l'entrée de la tour, et la 8e essence apparaît (INTERAC_ESSENCE ; essence.s ne
; fait pas sortir de la tour : essenceDone).
; ==================================================================================================
.define CAGE_DOOR_POS	$37

cagedMarine:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @init
	.dw @hello
	.dw @fight
	.dw @beaten
	.dw @free
	.dw @fly

@init:
	call getThisRoomFlags
	and $80
	jr z,+
	; libre depuis longtemps : la cage est ouverte ; l'essence attend encore si Link est monté sans
	; la prendre
	ld c,CAGE_DOOR_POS
	ld a,$a0
	call setTile
	call spawnEssence
	jp interactionDelete
+
	call interactionInitGraphics
	call interactionSetAlwaysUpdateBit
	call objectSetVisible82
	jp interactionIncState

@hello:
	call interactionAnimate
	call waitRoomReady
	ret nz
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),180
	ld a,SND_BALLADE_GULL
	call playSound
	ld bc,TX_5c3e
	jp showText

@fight:
	call interactionAnimate
	call getThisRoomFlags
	and $80
	jr nz,@won
	; un cri d'encouragement toutes les 3 secondes
	call interactionDecCounter1
	ret nz
	ld (hl),180
	ld a,SND_BALLADE_GULL
	jp playSound
@won:
	call interactionIncState
	ld l,Interaction.counter1
	ld (hl),60
	ret

@beaten:
	call interactionAnimate
	ld a,(wTextIsActive)
	or a
	ret nz
	call interactionDecCounter1
	ret nz
	call interactionIncState
	; la cage s'ouvre
	ld c,CAGE_DOOR_POS
	ld a,$a0
	call setTile
	ld a,SND_DOORCLOSE
	call playSound
	ld a,GLOBALFLAG_BALLADE_PRISON
	call unsetGlobalFlag
	call setRespawnEntrance
	ld bc,TX_5c3f
	jp showText

; Marine sort de la cage et rejoint Link (elle retourne dans sa tunique)
@free:
	call interactionAnimate
	ld a,(wTextIsActive)
	or a
	ret nz
	call interactionIncState
	ld l,Interaction.speed
	ld (hl),SPEED_100
	ret

@fly:
	call interactionAnimate
	call objectGetAngleTowardLink
	ld e,Interaction.angle
	ld (de),a
	call objectApplySpeed
	ld c,$0c
	call objectCheckLinkWithinDistance
	ret nc
	call spawnEssence
	jp interactionDelete

;;
; La 8e essence (si elle n'est pas déjà prise), sous l'escalier du milieu (5,7)
spawnEssence:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	ret nz
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_ESSENCE
	ld l,Interaction.var03
	ld (hl),$07
	ld l,Interaction.yh
	ld (hl),$78
	ld l,Interaction.xh
	ld (hl),$78
	ret

;;
; La 8e essence est prise (essence.s, état 7, donjon 8) : Link reste dans la tour, la salle se
; rallume (l'essence l'avait assombrie), la musique reprend
essenceDone:
	xor a
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
	ld (wDisableLinkCollisionsAndMenu),a
	call brightenRoom
	ld a,LINK_STATE_NORMAL
	ld (wLinkForceState),a
	ld a,(wActiveMusic)
	jp playSound


; ==================================================================================================
; Le 6F (INTERAC_BALLADE_OBJECT $65, 5:cc, l'Insomnis) : la porte de l'ouest (vers Ganon, 5:c7)
; reste murée tant que l'Insomnis n'est pas battu ; battu une fois, c'est pour de bon (drapeau $80 de
; la salle : le combat ne recommence pas, balladeRhythm.s, balladeObjects.insomnis).
; ==================================================================================================
.define TOP_DOOR_POS	$50

towerTop:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,@watch
	call interactionIncState
	call getThisRoomFlags
	and $80
	jr nz,@open
	ld c,TOP_DOOR_POS
	ld a,$b3
	jp setTile

@watch:
	ld a,(wBalladeRhythmStage)
	cp $03
	ret c
	call getThisRoomFlags
	set 7,(hl)
	ld a,SND_SOLVEPUZZLE
	call playSound
@open:
	ld c,TOP_DOOR_POS
	ld a,$a0
	call setTile
	jp interactionDelete
