ScriptName ArvakRiderSummonEffectScript extends ActiveMagicEffect

import utility
import debug
import math

Actor Property ArvakRider auto
Actor Property PlayerRef auto

ArvakScript Property Arvak auto

VisualEffect Property MGTeleportOutEffect Auto
VisualEffect Property MGTeleportInEffect Auto

ObjectReference Property ArvakIdleMarker auto

int loop


function OnEffectStart(actor Target, actor Caster)

	SendAnimationEvent(Arvak.ArvakRef, "StandingRearUp")
	wait(1.0)
	SummonArvakRider(ArvakRider)
	
endFunction

Function OnEffectFinish(actor Target, actor Caster)
	UnsummonDisable(ArvakRider)
Endfunction

Function SummonArvakRider(Actor akArvak)
	if (PlayerRef.HasLOS(akArvak))
		if akArvak.Is3DLoaded()
			MGTeleportOutEffect.Play(akArvak, 3.0)
		endif
		wait(2.4)
	endif
	akArvak.Disable()
	akArvak.moveto(PlayerRef)
	PlaceInFrontOfArvak(akArvak)
	akArvak.EnableNoWait(true)
	loop = 20
	while !akArvak.Is3DLoaded() && loop
		wait(0.05)
		loop -= 1
	endwhile
	if (PlayerRef.HasLOS(akArvak))
		MGTeleportInEffect.Play(akArvak, 3.0)
	endif	
endFunction

Function UnsummonDisable(Actor akArvak)
	if aKArvak.Is3DLoaded()
		MGTeleportOutEffect.Play(aKArvak, 3.0)
	endif
	wait(2.4)
	aKArvak.Disable()
	akArvak.moveto(ArvakIdleMarker)
endfunction

Function PlaceInFrontOfArvak(ObjectReference targetItem, float distanceOffset = 150.0, float heightOffset = 0.0, float angleOffset = 0.0)		;;regular summon, place it in front of player
{Place targetItem directly in front of oriented towards the player. The offsetValues may need to be changed for different objects.}
	float playerAngleZ = Arvak.ArvakRef.GetAngleZ()
	float angZ = playerAngleZ + angleOffset
	float posX = Arvak.ArvakRef.GetPositionX() + distanceOffset * Math.Sin(playerAngleZ)
	float posY = Arvak.ArvakRef.GetPositionY() + distanceOffset * Math.Cos(playerAngleZ)
	float posZ = Arvak.ArvakRef.GetPositionZ() + heightOffset
	targetItem.SetPosition(posX, posY, posZ)
	targetItem.SetAngle(0.0, 0.0, angZ)
	; Alternately SetPosition and SetAngle could be used, but I prefer TranslateTo
EndFunction
