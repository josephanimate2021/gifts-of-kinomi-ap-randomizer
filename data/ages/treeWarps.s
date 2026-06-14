; This is a list of positions Link can warp to with gale seeds.
; This does not populate the screens themselves with trees or anything.
;
; Each time period should have exactly 8 entries. To add more, it is necessary to modify
; the "galeSeedMenu_addOffsetToWarpIndex" function, and perhaps others.
;
; Data format:
;   b0: room index (or $00 to terminate the list)
;   b1: position for Link to land in
;   b2: map popup index (should show the tree type)

presentTreeWarps:
	.db <ROOM_AGES_0ac $54 SCENT_SEEDS_POPUP ; This entry is ignored unless the scent seedling is planted
	.db <ROOM_AGES_004 $34 EMBER_SEEDS_POPUP
	.db <ROOM_AGES_071 $35 SCENT_SEEDS_POPUP
	.db <ROOM_AGES_084 $34 GALE_SEEDS_POPUP
	.db <ROOM_AGES_085 $34 PEGASUS_SEEDS_POPUP
	.db <ROOM_AGES_086 $34 EMBER_SEEDS_POPUP
	.db <ROOM_AGES_087 $34 MYSTERY_SEEDS_POPUP
	.db $00 $00 $00
	.db $00 $00 $00 ; Extra, 9th entry here since the 1st one is sometimes skipped

pastTreeWarps:
	.db <ROOM_AGES_113 $55 MYSTERY_SEEDS_POPUP
	.db <ROOM_AGES_112 $36 GALE_SEEDS_POPUP
	.db <ROOM_AGES_150 $46 EMBER_SEEDS_POPUP
	.db <ROOM_AGES_171 $35 SCENT_SEEDS_POPUP
	.db $00 $00 $00
	.db $00 $00 $00
	.db $00 $00 $00
	.db $00 $00 $00
