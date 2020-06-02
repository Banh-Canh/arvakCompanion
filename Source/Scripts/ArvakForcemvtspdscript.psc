scriptName arvakforcemvtspdscript extends activemagiceffect



;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	self.ForceMovementSpeedUpdate(akTarget)
endFunction

function ForceMovementSpeedUpdate(Actor akTarget)

	akTarget.DamageActorValue("CarryWeight", 0.100000)
	akTarget.RestoreActorValue("CarryWeight", 0.100000)
endFunction

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	self.ForceMovementSpeedUpdate(akTarget)
endFunction	