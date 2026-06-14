; ==================================================================================================
; ENEMY_ARMOS_WARRIOR
;
; Variables (for parent only, subid 1):
;   var30: "Turn" direction (should be 8 or -8)
;   var31: Shield
;   var32: Sword
;
; Variables (for shield only, subid 2):
;   relatedObj1: parent
;   relatedObj2: shield
;   var30: Animation index (0 or 1)
;   var31: Animation base (multiple of 2, for broken shield animation)
;   var32: Hits until destruction
;
; Variables (for sword only, subid 3):
;   relatedObj1: parent
;   relatedObj2: shield
;   var30/var31: Target position
;   var32/var33: Base position (yh and xh are manipulated by the animation to fix their
;                collision box, so need to be reset to these values each frame)
;   var34: If nonzero, checks for collision with shield
; ==================================================================================================
enemyCode73:
	jp panic
