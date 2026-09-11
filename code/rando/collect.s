;;
; calls lookupCollectMode_body in bank $00.
lookupCollectMode:
    push bc
    push de
    push hl
    ld e,$00
    ld hl,lookupCollectMode_body
    call interBankCall
    ld a,e
    pop hl
    cp $ff
    jr nz,@next
    dec hl
    ldi a,(hl)
@next:
    pop de
    pop bc
    ret

;;
; return a spawning item's collection mode in a and e, based on current room.
; the table format is (group, room, mode), and modes 80+ are used to index a
; jump table for special cases. if no match is found, it returns the regular,
; non-overriden mode. does nothing if the item's collect mode is already set.
lookupCollectMode_body:
    ld e,$71
    ld a,(de)
    ld e,a
    and a
    ret nz
    ld a,(wActiveGroup)
    ld b,a
    ld a,(wActiveRoom)
    ld c,a
    ld e,$01
    ld hl,dummyTable
    call searchDoubleKey
    ld a,$00  ; Don't use "xor a" here since it would affect C flag! 
    ld e,$02
    ret nc
    
    ld a,(hl)
    ld e,a
    cp $80
    ret c
    
    ld hl,dummyTable
    and $7f
    add a,a
    rst_addAToHl
    ldi a,(hl)
    ld h,(hl)
    ld l,a
    jp (hl)

;;
dummyTable:
    .db $ff