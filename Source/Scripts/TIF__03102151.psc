;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__03102151 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Arvak1.SetRace(melee01HorseRace)
Arvak2.SetRace(melee23HorseRace)
Arvak3.SetRace(melee23HorseRace)
Arvak4.SetRace(melee45HorseRace)
Arvak5.SetRace(melee45HorseRace)
Arvak6.SetRace(melee6HorseRace)
ArvakToggleRange.Mod(-1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Actor Property Arvak1 auto
Actor Property Arvak2 auto
Actor Property Arvak3 auto
Actor Property Arvak4 auto
Actor Property Arvak5 auto
Actor Property Arvak6 auto
GlobalVariable property ArvakToggleRange auto
Race Property melee01HorseRace auto
Race Property melee23HorseRace auto
Race Property melee45HorseRace auto
Race Property melee6HorseRace auto
