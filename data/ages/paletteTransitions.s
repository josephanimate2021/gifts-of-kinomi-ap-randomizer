; This file deals with "smooth palette transitions" between rooms, ie. at the entrance to
; Yoll Graveyard.
;
; Note: although this data has entries for groups 4-7, it only gets checked when
; TILESETFLAG_OUTDOORS is set.
;
; Data format: (differs in seasons)
; b0: direction (or $ff to end)
; b1: room index
; w2: source palette
; w3: destination palette
;
; Note: Byte 0 is the direction Link MOVES INTO the room, not where he ENTERS FROM.


paletteTransitionData:
	.db paletteTransitionGroup0-CADDR
	.db paletteTransitionGroup1-CADDR
	.db paletteTransitionGroup2-CADDR
	.db paletteTransitionGroup3-CADDR
	.db paletteTransitionGroup4-CADDR
	.db paletteTransitionGroup5-CADDR
	.db paletteTransitionGroup6-CADDR
	.db paletteTransitionGroup7-CADDR


paletteTransitionGroup3:
paletteTransitionGroup4:
paletteTransitionGroup5:
paletteTransitionGroup6:
paletteTransitionGroup7:
	.db $ff

paletteTransitionGroup0:
	dbbww DIR_RIGHT $22  paletteData4a90 paletteData4a30
	dbbww DIR_LEFT  $21  paletteData4a30 paletteData4a90
	dbbww DIR_UP  	$21  paletteData4a30 paletteData4a90
	dbbww DIR_DOWN  $31  paletteData4a90 paletteData4a30
	dbbww DIR_DOWN  $30  paletteData4a90 paletteData4a30

	;dbbww DIR_DOWN  $50  paletteData4a30 paletteData4bb0
	dbbww DIR_UP    $43  paletteData4bb0 paletteData4a30
	dbbww DIR_DOWN  $53  paletteData4a30 paletteData4bb0
	;dbbww DIR_UP    $63  paletteData4a30 paletteData4d90
	;dbbww DIR_UP    $70  paletteData4d90 paletteData4a30
	;dbbww DIR_DOWN  $73  paletteData4d90 paletteData4a30


;	dbbww DIR_UP    $8b  paletteData4c10 paletteData4a90
;	dbbww DIR_DOWN  $9b  paletteData4a90 paletteData4c10
;	dbbww DIR_UP    $12  paletteData4cd0 paletteData4c70
;	dbbww DIR_DOWN  $22  paletteData4c70 paletteData4cd0
;	dbbww DIR_UP    $14  paletteData4cd0 paletteData4c70
;	dbbww DIR_DOWN  $24  paletteData4c70 paletteData4cd0
;	dbbww DIR_DOWN  $29  paletteData4d90 paletteData4a30
;	dbbww DIR_DOWN  $2a  paletteData4d90 paletteData4a30
;	dbbww DIR_DOWN  $3d  paletteData4d90 paletteData4bb0
	.db $ff

paletteTransitionGroup1:
	dbbww DIR_DOWN <ROOM_AGES_112 paletteData4ca0 paletteData4d00
	dbbww DIR_DOWN  $30  paletteData4d00 paletteData4be0	
;	dbbww DIR_UP    $12  paletteData4d00 paletteData4ca0
;	dbbww DIR_DOWN  $22  paletteData4ca0 paletteData4d00
;	dbbww DIR_UP    $14  paletteData4d00 paletteData4ca0
;	dbbww DIR_DOWN  $24  paletteData4ca0 paletteData4d00
;	dbbww DIR_UP    $36  paletteData4a60 paletteData4f40
;	dbbww DIR_DOWN  $46  paletteData4f40 paletteData4a60
	.db $ff

paletteTransitionGroup2:
	dbbww DIR_UP    $90  paletteData4eb0 paletteData4e80
	dbbww DIR_DOWN  $a0  paletteData4e80 paletteData4eb0
	.db $ff

