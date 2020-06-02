;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname QF_Arvak_Quest_01_0310214A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arvak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arvak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak5)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak6)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak2)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveCompleted(10)
Game.GetPlayer().AddSpell(ArvakRiderSummon)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(0)
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak3)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak4)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_Arvak.Clear()
Alias_Arvak.ForceRefTo(Arvak1)
SetObjectiveCompleted(0)
SetObjectiveCompleted(1)
SetObjectiveDisplayed(10)
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

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
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
Spell Property ArvakRiderSummon auto
Race Property Ranged12HorseRace auto
Race Property Ranged34HorseRace auto
Race Property Ranged56HorseRace auto
GlobalVariable property ArvakToggleRange auto

