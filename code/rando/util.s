;;
; return z iff the current group and room match c and b.
compareRoom:
    ld a,(wActiveGroup)
    cp c
    ret nz
    ld a,(wActiveRoom)
    cp b
    ret

;;
; searches for a value in a table starting at hl, with an entry matching
; keys b and subkey c, and values e bytes long. sets c if found. a key of
; ff ends the table.
searchDoubleKey:
@loop:
    ldi a,(hl)
    cp $ff
    ret z
    cp b
    jr nz,@next
    ldi a,(hl)
    cp c
    jr nz,@done
    scf
    ret

@next:
    inc hl

@done:
    ld a,e
    rst_addAToHl
    jr @loop

;;
; increment hl until (hl) equals either register a or ff. returns z if
; a match was found.
searchValue:
    push bc
    ld b,a

@loop:
    ldi a,(hl)
    cp b
    jr z,@match
    inc a
    jr z,@noMatch
    jr @loop

@noMatch:
    inc a

@match:
    ld a,b
    pop bc
    ret

;;
; b = treasure id
; c = treasure subid
spawnTreasureOnLink:
    call createTreasure
    ret nz
    push de
    ld de,w1Link.yh
    call objectCopyPosition_rawAddress
    pop de
    xor a
    ret

;;
; call a function hl in bank 02, preserving af. e can't be used as a
; parameter to that function, but it can be returned. this function only
; exists because banks 08 and 09 are so tight on space.
callBank2:
    push af
    ld e,$02
    call interBankCall
    pop af
    ret