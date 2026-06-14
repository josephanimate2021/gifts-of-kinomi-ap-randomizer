; ==================================================================================================
; INTERAC_CHILD
;
; Variables:
;   subid: personality type (0-6)
;   var03: index of script and code to run (changes based on personality and growth stage)
;   var37: animation base (depends on subid, or his personality type)
;   var39: $00 is normal; $01 gives "light" solidity (when he moves); $02 gives no solidity.
;   var3a: animation index? (added to base)
;   var3b: scratch variable for scripts
;   var3c: current index in "position list" data
;   var3d: number of entries in "position list" data (minus one)?
;   var3e/3f: pointer to "position list" data for when the child moves around
; ==================================================================================================
interactionCode35:
	jp panic
