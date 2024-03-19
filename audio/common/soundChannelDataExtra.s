.BANK $40 SLOT 1
.ORG 0

bank40ChannelFallBack:
    cmdff

.redefine MUSIC_CHANNEL_FALLBACK bank40ChannelFallBack
.ifdef ROM_AGES
	.include "audio/mus/seasons/ancientRuins.s"
	.include "audio/mus/seasons/carnival.s"
	.include "audio/mus/seasons/dancingDragonDungeon.s"
	.include "audio/mus/seasons/explorersCrypt.s"
	.include "audio/mus/seasons/gnarledRootDungeon.s"
	.include "audio/mus/seasons/herosCave.s"
	.include "audio/mus/seasons/hideAndSeek.s"
	.include "audio/mus/seasons/horonVillage.s"
	.include "audio/mus/seasons/poisonMothsLair.s"
	.include "audio/mus/seasons/samasaDesert.s"
	.include "audio/mus/seasons/snakesRemains.s"
	.include "audio/mus/seasons/songOfStorms.s"
	.include "audio/mus/seasons/subrosia.s"
	.include "audio/mus/seasons/subrosianDance.s"
	.include "audio/mus/seasons/subrosianShop.s"
	.include "audio/mus/seasons/sunkenCity.s"
.else ;ROM_SEASONS
	.include "audio/mus/ages/ambiPalace.s"
	.include "audio/mus/ages/ancientTomb.s"
	.include "audio/mus/ages/blackTower.s"
	.include "audio/mus/ages/crescent.s"
	.include "audio/mus/ages/crownDungeon.s"
	.include "audio/mus/ages/fairyForest.s"
	.include "audio/mus/ages/jabuJabusBelly.s"
	.include "audio/mus/ages/lynnaCity.s"
	.include "audio/mus/ages/lynnaVillage.s"
	.include "audio/mus/ages/makuPath.s"
	;.include "audio/mus/ages/makuTree.s"
	.include "audio/mus/ages/mermaidsCave.s"
	.include "audio/mus/ages/moonlitGrotto.s"
	.include "audio/mus/ages/nayru.s"
	.include "audio/mus/ages/overworldPast.s"
	.include "audio/mus/ages/ralph.s"
	.include "audio/mus/ages/skullDungeon.s"
.endif

.BANK $41 SLOT 1
.ORG 0

bank41ChannelFallBack:
    cmdff

.redefine MUSIC_CHANNEL_FALLBACK bank41ChannelFallBack

.ifdef ROM_AGES
	.include "audio/mus/ages/makuTree.s" ; MUSIC: moved from Bank $39
	.include "audio/sfx/seasons/magnetGloves.s" ; CROSSITEMS: Added this

	.include "audio/mus/seasons/swordAndShieldMaze.s"
	;.include "audio/mus/seasons/makuTree.s"
	.include "audio/mus/seasons/tarmRuins.s"
	.include "audio/mus/seasons/templeRemains.s"
	.include "audio/mus/seasons/unicornsCave.s"
	.include "audio/mus/seasons/unused1.s"
	.include "audio/mus/seasons/unused2.s"
.else ;ROM_SEASONS
	.include "audio/mus/common/essence.s" ; MUSIC: moved from Bank $39
	.include "audio/sfx/ages/switch2.s" ; CROSSITEMS: Added this

	.include "audio/mus/ages/spiritsGrave.s"
	.include "audio/mus/ages/symmetryPast.s"
	.include "audio/mus/ages/symmetryPresent.s"
	.include "audio/mus/ages/tokayHouse.s"
	.include "audio/mus/ages/underwater.s"
	.include "audio/mus/ages/wingDungeon.s"
	.include "audio/mus/ages/zoraVillage.s"
.endif

.undefine MUSIC_CHANNEL_FALLBACK