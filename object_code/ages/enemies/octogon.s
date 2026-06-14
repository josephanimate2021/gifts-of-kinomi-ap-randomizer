; ==================================================================================================
; ENEMY_OCTOGON
;
; Variables:
;   var03: Where it actually is? (0 = above water, 1 = below water)
;   counter2: Counter until it moves above or below the water?
;   relatedObj1: Reference to other instance of ENEMY_OCTOGON?
;   var30: Index in "target position list"?
;   var31/var32: Target position to move to
;   var33/var34: Original Y/X position when this screen was entered
;   var35: Counter for animation purposes?
;   var36: Counter which, when 0 is reached, invokes a change of state (ie. fire at link
;          instead of moving around)
;   var37: Health value from when octogon appeared here (used to decide when to surface or
;          not)
; ==================================================================================================
enemyCode7d:
	jp panic
