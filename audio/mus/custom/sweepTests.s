sweepTestsStart:
	tempo 120

sweepTestsChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

	vol $6
	vibrato $00
	env $0 $00
	duty $02
	octave 3

loop:
	shift 0
	beat d Q
	shift 7
	beat d E1
	shift 0
	beat ds E2+E1
	shift 6
	beat ds E2
	shift 0
	beat e Q

	goto loop

	cmdff

sweepTestsChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $2


sweepTestsChannel4:
	.redefine HI_VOL $28
	.redefine LO_VOL $08

sweepTestsChannel6:
	cmdff
