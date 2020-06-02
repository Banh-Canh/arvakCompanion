;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__031048EE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Arvak1.SetRace(Ranged12HorseRace)
Arvak2.SetRace(Ranged12HorseRace)
Arvak3.SetRace(Ranged34HorseRace)
Arvak4.SetRace(Ranged34HorseRace)
Arvak5.SetRace(Ranged56HorseRace)
Arvak6.SetRace(Ranged56HorseRace)
ArvakToggleRange.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Race Property Ranged12HorseRace auto
Race Property Ranged34HorseRace auto
Race Property Ranged56HorseRace auto
Actor Property Arvak1 auto
Actor Property Arvak2 auto
Actor Property Arvak3 auto
Actor Property Arvak4 auto
Actor Property Arvak5 auto
Actor Property Arvak6 auto
GlobalVariable property ArvakToggleRange auto
