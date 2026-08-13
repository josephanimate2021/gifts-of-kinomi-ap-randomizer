; Tree refill data is also used for the child and an event in room $2f7.
;
; It waits for you to visit 8 unique rooms in the overworld, then sets the bit in
; wSeedTreeRefilledBitset when you next visit that screen.
;
; For trees, each index corresponds to an enemy object with id "5aXX".
;
; Data format:
;   Param 1: group / room (ie. $05b for group 0 room $5b, 18a for group 1 room $8a)
;   Param 2: low byte of data location

seedTreeRefillLocations:
	m_TreeRefillData ROOM_AGES_0ac, (<wxSeedTreeRefillData+$00) ;ROOM_AGES_0ac
	m_TreeRefillData ROOM_AGES_004, (<wxSeedTreeRefillData+$08) ;ROOM_AGES_004
	m_TreeRefillData ROOM_AGES_071, (<wxSeedTreeRefillData+$10) ;ROOM_AGES_071
	m_TreeRefillData ROOM_AGES_084, (<wxSeedTreeRefillData+$18) ;ROOM_AGES_084
	m_TreeRefillData ROOM_AGES_085, (<wxSeedTreeRefillData+$20) ;ROOM_AGES_085
	m_TreeRefillData ROOM_AGES_086, (<wxSeedTreeRefillData+$28) ;ROOM_AGES_086
	m_TreeRefillData ROOM_AGES_087, (<wxSeedTreeRefillData+$30) ;ROOM_AGES_087
	m_TreeRefillData ROOM_AGES_000, (<wxSeedTreeRefillData+$38) ;ROOM_AGES_000
	m_TreeRefillData ROOM_AGES_113, (<wxSeedTreeRefillData+$40) ;ROOM_AGES_113
	m_TreeRefillData ROOM_AGES_112, (<wxSeedTreeRefillData+$48) ;ROOM_AGES_112
	m_TreeRefillData ROOM_AGES_150, (<wxSeedTreeRefillData+$50) ;ROOM_AGES_150
	m_TreeRefillData ROOM_AGES_171, (<wxSeedTreeRefillData+$58) ;ROOM_AGES_171
	;above has been changed
	m_TreeRefillData $178, (<wxSeedTreeRefillData+$60)
	m_TreeRefillData $180, (<wxSeedTreeRefillData+$68)
	m_TreeRefillData $1c1, (<wxSeedTreeRefillData+$70)
	m_TreeRefillData $000, (<wxSeedTreeRefillData+$78)
