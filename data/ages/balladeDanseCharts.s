; Généré par tools/make_music.py (DANCE_ROUNDS) : ne pas éditer à la main.

; .db la musique, sa voix (NR51) ; .dw ses flèches
balladeDanseRounds:
	.db MUS_BALLADE_BERCEUSE, $22
	.dw balladeDanseChart1
	.db MUS_BALLADE_DEESSE, $22
	.dw balladeDanseChart2
	.db MUS_BALLADE_TEMPETES, $22
	.dw balladeDanseChart3
	.db MUS_BALLADE_GERUDO, $44
	.dw balladeDanseChart4
	.db MUS_BALLADE_LORULE, $22
	.dw balladeDanseChart5

; manche 1 : music/berceuse.txt (melodie, 8 mesures)
balladeDanseChart1:
	.dw $01e1
	.db 1, $50 ; b4 bas
	.dw $0231
	.db 2, $28 ; d5 haut
	.dw $0259
	.db 0, $50 ; a4 gauche
	.dw $02a9
	.db 0, $14 ; g4 gauche
	.dw $02bd
	.db 0, $14 ; a4 gauche
	.dw $02d1
	.db 1, $50 ; b4 bas
	.dw $0321
	.db 2, $28 ; d5 haut
	.dw $0349
	.db 0, $78 ; a4 gauche
	.dw $03c1
	.db 1, $50 ; b4 bas
	.dw $0411
	.db 2, $28 ; d5 haut
	.dw $0439
	.db 3, $50 ; a5 droite
	.dw $0489
	.db 2, $28 ; g5 haut
	.dw $04b1
	.db 2, $50 ; d5 haut
	.dw $0501
	.db 1, $14 ; c5 bas
	.dw $0515
	.db 1, $14 ; b4 bas
	.dw $0529
	.db 0, $78 ; a4 gauche
	.dw $ffff

; manche 2 : music/deesse.txt (melodie, 8 mesures)
balladeDanseChart2:
	.dw $0109
	.db 0, $84 ; a4 gauche
	.dw $018d
	.db 1, $16 ; b4 bas
	.dw $01a3
	.db 1, $16 ; c5 bas
	.dw $01b9
	.db 2, $58 ; d5 haut
	.dw $0211
	.db 2, $2c ; g5 haut
	.dw $023d
	.db 3, $58 ; a5 droite
	.dw $0295
	.db 2, $2c ; d5 haut
	.dw $02c1
	.db 1, $58 ; b4 bas
	.dw $0319
	.db 0, $84 ; a4 gauche
	.dw $039d
	.db 2, $2c ; d5 haut
	.dw $03c9
	.db 1, $58 ; b4 bas
	.dw $0421
	.db 0, $16 ; a4 gauche
	.dw $0437
	.db 0, $16 ; g4 gauche
	.dw $044d
	.db 0, $58 ; a4 gauche
	.dw $04a5
	.db 2, $2c ; d5 haut
	.dw $04d1
	.db 1, $58 ; b4 bas
	.dw $ffff

; manche 3 : music/tempetes.txt (melodie, 8 mesures)
balladeDanseChart3:
	.dw $0001
	.db 0, $0c ; d5 gauche
	.dw $000d
	.db 0, $0c ; f5 gauche
	.dw $0019
	.db 2, $30 ; d6 haut
	.dw $0049
	.db 0, $0c ; d5 gauche
	.dw $0055
	.db 0, $0c ; f5 gauche
	.dw $0061
	.db 2, $30 ; d6 haut
	.dw $0091
	.db 3, $24 ; e6 droite
	.dw $00b5
	.db 3, $0c ; f6 droite
	.dw $00c1
	.db 3, $0c ; e6 droite
	.dw $00cd
	.db 3, $0c ; f6 droite
	.dw $00d9
	.db 3, $0c ; e6 droite
	.dw $00e5
	.db 2, $0c ; c6 haut
	.dw $00f1
	.db 1, $30 ; a5 bas
	.dw $0121
	.db 1, $18 ; a5 bas
	.dw $0139
	.db 0, $18 ; d5 gauche
	.dw $0151
	.db 0, $0c ; f5 gauche
	.dw $015d
	.db 1, $0c ; g5 bas
	.dw $0169
	.db 1, $48 ; a5 bas
	.dw $01b1
	.db 1, $18 ; a5 bas
	.dw $01c9
	.db 0, $18 ; d5 gauche
	.dw $01e1
	.db 0, $0c ; f5 gauche
	.dw $01ed
	.db 1, $0c ; g5 bas
	.dw $01f9
	.db 0, $48 ; e5 gauche
	.dw $ffff

; manche 4 : music/gerudo.txt (basse, 8 mesures)
balladeDanseChart4:
	.dw $00f6
	.db 3, $2a ; a4 droite
	.dw $0120
	.db 3, $46 ; a4 droite
	.dw $0166
	.db 3, $2a ; a4 droite
	.dw $0190
	.db 3, $46 ; a4 droite
	.dw $01d6
	.db 2, $2a ; gs4 haut
	.dw $0200
	.db 2, $46 ; gs4 haut
	.dw $0246
	.db 0, $3f ; f4 gauche
	.dw $0285
	.db 1, $31 ; fs4 bas
	.dw $02b6
	.db 3, $2a ; a4 droite
	.dw $02e0
	.db 3, $46 ; a4 droite
	.dw $0326
	.db 3, $2a ; a4 droite
	.dw $0350
	.db 3, $46 ; a4 droite
	.dw $0396
	.db 2, $2a ; gs4 haut
	.dw $03c0
	.db 2, $31 ; gs4 haut
	.dw $ffff

; manche 5 : music/lorule.txt (melodie, 8 mesures)
balladeDanseChart5:
	.dw $00f1
	.db 1, $3c ; e5 bas
	.dw $012d
	.db 1, $3c ; e5 bas
	.dw $0169
	.db 1, $1e ; e5 bas
	.dw $0187
	.db 3, $1e ; g5 droite
	.dw $01a5
	.db 2, $3c ; fs5 haut
	.dw $01e1
	.db 2, $3c ; f5 haut
	.dw $021d
	.db 1, $3c ; e5 bas
	.dw $0259
	.db 0, $1e ; b4 gauche
	.dw $0277
	.db 1, $5a ; d5 bas
	.dw $02d1
	.db 1, $3c ; e5 bas
	.dw $030d
	.db 1, $3c ; e5 bas
	.dw $0349
	.db 1, $1e ; e5 bas
	.dw $0367
	.db 3, $1e ; g5 droite
	.dw $0385
	.db 2, $3c ; fs5 haut
	.dw $03c1
	.db 2, $3c ; f5 haut
	.dw $03fd
	.db 1, $3c ; e5 bas
	.dw $0439
	.db 0, $3c ; b4 gauche
	.dw $0475
	.db 0, $1e ; a4 gauche
	.dw $ffff
