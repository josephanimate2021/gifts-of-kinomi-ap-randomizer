; relative movement
.macro plat_wait
	.db $00, \1
.endm
.macro plat_move
	.db $01, \1
.endm
.macro plat_setangle
	.db $02, \1
.endm
.macro plat_setspeed
	.db $03, \1
.endm
.macro plat_jump
	.db $04, (\1-CADDR)&$ff
.endm
.macro plat_waitforlink
	.db $05
.endm
.macro plat_up
	.db $08, \1
.endm
.macro plat_right
	.db $09, \1
.endm
.macro plat_down
	.db $0a, \1
.endm
.macro plat_left
	.db $0b, \1
.endm

_movingPlatform_scriptTable:
	.dw @dungeon00
	.dw @dungeon01
	.dw @dungeon02
	.dw @dungeon03
	.dw @dungeon04
	.dw @dungeon05
	.dw @dungeon06
	.dw @dungeon07
	.dw @dungeon08
	.dw @dungeon09
	.dw @dungeon0a
	.dw @dungeon0b
	.dw @dungeon0c
	.dw @dungeon0d
	.dw @dungeon0e
	.dw @dungeon0f

@dungeon00:
@dungeon01:
	.dw @@platform0
	.dw @@platform1

@@platform0:
	plat_wait  $08
	plat_up    $80
	plat_wait  $08
	plat_down  $80
	plat_jump @@platform0

@@platform1:
	plat_wait  $08
	plat_left  $60
--
	plat_wait  $08
	plat_right $c0
	plat_wait  $08
	plat_left  $c0
	plat_jump --


@dungeon02:
@dungeon03:
@dungeon04:
	.dw @@platform0
	.dw @@platform1
	.dw @@platform2
	.dw @@platform3
	.dw @@platform4
	.dw @@platform5

@@platform0:
	plat_wait  $08
	plat_up    $30
--
	plat_wait  $08
	plat_down  $60
	plat_wait  $08
	plat_up    $60
	plat_jump --

@@platform1:
	plat_wait  $08
	plat_right $40
--
	plat_wait  $08
	plat_left  $e0
	plat_wait  $08
	plat_right $e0
	plat_jump --

@@platform2:
	plat_wait  $08
	plat_right $60
--
	plat_wait  $08
	plat_left  $80
	plat_wait  $08
	plat_right $80
	plat_jump --

@@platform3:
	plat_wait  $08
	plat_left  $60
	plat_wait  $08
	plat_right $60
	plat_jump @@platform3

@@platform4:
	plat_wait  $08
	plat_down  $60
	plat_wait  $08
	plat_up    $60
	plat_jump @@platform4

@@platform5:
	plat_wait  $08
	plat_left  $20
--
	plat_wait  $08
	plat_right $a0
	plat_wait  $08
	plat_left  $a0
	plat_jump --

@dungeon05:
@dungeon06:
@dungeon07:
@dungeon08:
@dungeon09:
@dungeon0a:

@dungeon0c:
@dungeon0d:
@dungeon0e:
@dungeon0f:
	.dw @@platform0
	.dw @@platform1
;relative movement
@@platform0:
	plat_wait  $08
	plat_right $68
	plat_wait  $08
	plat_left  $50
	plat_jump @@platform0

@@platform1:
	plat_wait  $08
	plat_left  $88
	plat_wait  $08
	plat_right $a0
	plat_jump @@platform1


@dungeon0b:
	.dw @@platform0
	.dw @@platform1	

@@platform0:
	plat_wait 	$08
	plat_down	$a0
	plat_wait 	$08
	plat_up  	$a0
	plat_jump @@platform0

@@platform1:
	plat_wait  	$08
	plat_right  $40
	plat_wait 	$08
	plat_up 	$40
	plat_wait 	$08
	plat_left 	$40
	plat_wait 	$08
	plat_down 	$40
	plat_jump @@platform1