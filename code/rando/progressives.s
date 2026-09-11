;;
; given a treasure id & subid in b & c, if the treasure needs to be upgraded,
; set hl = the start of the upgraded treasure data + 1 and b = the new
; treasure ID.
; NOTE /!\ : Written in the vanilla ring table
getUpgradedTreasure:
    ; Filter out the fake "Sword spinslash" treasure given at Hero's Cave chest
    ; and while opening Maku Tree gate solely for cosmetic purpose
    ld a,b
    cp TREASURE_SWORD
    jr nz,@notSpinSlash
    ld a,c
    cp $03
    ld a,b
    ret nc
@notSpinSlash:
    
    ; Check that item was obtained before
    call checkTreasureObtained
    ld c,a
    ld a,b
    ret nc
    
    cp TREASURE_TUNE_OF_ECHOES
    jr nz,@harpDone
@harpDone:
    
    push hl
    ld hl,progressiveUpgrades
    ld e,$03
    call searchDoubleKey
    jr nc,@done
    
    ; We found a matching entry in progressiveUpgrades table
    ldi a,(hl)
    ld b,a
    ldi a,(hl)
    ld e,(hl)
    pop hl
    ld h,e
    ld l,a
    inc hl
    ret
    
@done:
    pop hl
    ret

;;
; set hl = the address of the treasure with ID b and sub ID c, accounting for
; progressive upgrades. call through getTreasureDataBCE or
; getTreasureDataSprite!
getTreasureData_body:
    ld hl,treasureObjectData
    ld a,b
    add a,a
    rst_addAToHl
    ld a,b
    add a,a
    rst_addAToHl
    bit 7,(hl)
    jr z,@next
    inc hl
    ldi a,(hl)
    ld h,(hl)
    ld l,a
@next:
    ld a,c
    add a,a
    add a,a
    rst_addAToHl
    inc hl
    jp getUpgradedTreasure

;;
; load final treasure ID, param, and text into b, c, and e.
getTreasureDataBCE:
    call getTreasureData_body
    ld c,(hl)
    inc hl
    ld e,(hl)
    ret

;;
; load final treasure sprite into e.
getTreasureDataSprite:
    call getTreasureData_body
    inc hl
    inc hl
    ld e,(hl)
    ret

;;
; return treasure data address and collect mode modified as necessary, given
; a treasure ID in dx42. lookupCollectMode must happen before upgradeTreasure
; for multiworld things to work correctly.
modifyTreasure:
    call lookupCollectMode
    push af
    call upgradeTreasure
    pop af
    ld b,a
    swap a
    ret

;;    
; given a treasure at dx40, return hl = the start of the treasure data + 1,
; accounting for progressive upgrades. also writes the new treasure ID to
; d070, which is used to set the treasure obtained flag.
upgradeTreasure:
    ld e,$42
    ld a,(de)
    ld b,a
    inc de
    ld a,(de)
    ld c,a
    ; call getMultiworldItemDest
    ; call z,getUpgradedTreasure
    call getUpgradedTreasure
    ld e,$70
    ld a,b
    ld (de),a
    ret

;;
; progressive item upgrade data (old ID, old related var, new ID, new subid)
progressiveUpgrades:
    .db TREASURE_BRACELET, $01, TREASURE_BRACELET, $02

    .db TREASURE_SEED_SATCHEL, $01, TREASURE_SEED_SATCHEL, <TREASURE_OBJECT_SEED_SATCHEL_UPGRADE
	.db TREASURE_SEED_SATCHEL, $02, TREASURE_SEED_SATCHEL, <TREASURE_OBJECT_SEED_SATCHEL_UPGRADE
    
    .db $ff