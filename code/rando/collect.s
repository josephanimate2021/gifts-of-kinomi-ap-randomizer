;;
; return a spawning item's collection mode in a and e, based on current room.
; the table format is (group, room, mode), and modes 80+ are used to index a
; jump table for special cases. if no match is found, it returns the regular,
; non-overriden mode. does nothing if the item's collect mode is already set.
dummyTable: 
    .db $ff
;;
lookupCollectMode:
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
; Add a special bypass to not show textboxes for Small Keys dropping from ceiling
bypassKeydropsTextbox:
    ; Don't bypass anything if keysanity is on, since we want the textbox to indicate for which dungeon 
    ; that key was for.
    ld a,$00
    or a
    jr nz,@regularText

    ld e,$71            ; var31, containing spawn mode
    ld a,(de)
    cp $02
    jr nz,@regularText  ; jump if not a drop from ceiling
    
    ld e,$72            ; var32, containing grab mode
    ld a,(de)
    or a
    jr nz,@regularText  ; jump if grab triggers an animation change
    
    ; It's a drop not triggering an animation change ==> it's a keydrop, so skip its textbox (0xFF)
    ld a,$ff
    ret
    
; return regular text ID otherwise
@regularText:
    ld e,$75            ; var35, containing text id
    ld a,(de)
    ret