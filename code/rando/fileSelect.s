;;
; Queues a DMA transfer for the custom string to be displayed at the top of the file select screen.
drawRandoFileSelectString:
	; To avoid overloading DMA operations during vblank, don't copy the font when the screen is
	; on. (We don't need to in this situation anyway.)
	ldh a,(R_LCDC)
	and $80
	jr nz,++

	; first load custom font
	ld b,$19 ; 26*16 bytes
	ld c,:randoCustomFontLetters
	ld de,$8e21
	ld hl,randoCustomFontLetters
	call queueDmaTransfer
++
	ld b,3 ; 4*16 bytes
	ld c,:randoCustomFontPunct
	ld de,$8fc1
	ld hl,randoCustomFontPunct
	call queueDmaTransfer

	ld b,3 ; 64 bytes
	ld c,:randoFileSelectStringAttrs
	ld de,$9c21
	ld hl,randoFileSelectStringAttrs
	call queueDmaTransfer

	ld b,3 ; 64 bytes
	ld c,:randoFileSelectStringTiles
	ld de,$9c20
	ld hl,randoFileSelectStringTiles
	jp queueDmaTransfer