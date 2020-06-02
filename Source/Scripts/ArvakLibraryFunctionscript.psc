Scriptname ArvakLibraryFunctionScript Extends Quest

import utility
import debug
import game
import math

GlobalVariable property ArvakAlreadyMounted auto
GlobalVariable property ArvakEatenSouls auto
GlobalVariable property ArvakSoulsStage1 auto
GlobalVariable property ArvakSoulsStage2 auto
GlobalVariable property ArvakSoulsStage3 auto
GlobalVariable property ArvakSoulsStage4 auto
GlobalVariable property ArvakSoulsStage5 auto
GlobalVariable property ArvakSoulsStage6 auto
GlobalVariable property ArvakFinalStage auto

spell property DLC01SummonSoulHorse auto
spell property ArvakHungerSystem auto

ObjectReference Property ArvakIdleMarker auto

Actor Property PlayerRef auto

Armor Property ArvakTokenUpdater auto

VisualEffect Property MGTeleportOutEffect Auto
VisualEffect Property MGTeleportInEffect Auto

Message Property ArvakTutoMessage auto
Message Property ArvakEvolvingMessage auto
Message Property ArvakFinalStageMessage auto

Quest Property Arvak_Quest_01 auto

int loop

bool is1stPerson

Function SetHorseCanMove(Actor akHorse, bool abCanMove)
	if akHorse
		if abCanMove
			akHorse.SetActorValue("WaitingForPlayer", 0.0)
			akHorse.SetRestrained(false)
		else
			akHorse.SetActorValue("WaitingForPlayer", 1.0)
			akHorse.SetRestrained(true)
		endif
	endif
EndFunction

Function SummonArvak(Actor akArvak)
	SetHorseCanMove(akArvak, false)
	if (PlayerRef.HasLOS(akArvak))
		if akArvak.Is3DLoaded()
			MGTeleportOutEffect.Play(akArvak, 3.0)
		endif
		wait(2.4)
	endif
	akArvak.Disable()
	akArvak.moveto(PlayerRef)	
	PlaceInFrontOfPlayer(akArvak)
	akArvak.EnableNoWait(true)
	loop = 20
	while !akArvak.Is3DLoaded() && loop
		wait(0.05)
		loop -= 1
	endwhile
	if (PlayerRef.HasLOS(akArvak))
		MGTeleportInEffect.Play(akArvak, 3.0)
		SendAnimationEvent(akArvak, "StandingRearUp")
	endif	
	SetHorseCanMove(akArvak, true)
endFunction

Function FirstMount(Actor akArvak)													;place horse next to player to mount once summoned
		DisablePlayerControls(True, True, True, False, True, True, True, True)
		float offset = 60.0 + akArvak.GetWidth() * akArvak.GetScale() * 0.5
		float angleZ = PlayerRef.GetAngleZ()
		float sine = Sin(angleZ + 90.0)
		float cosine = Cos(angleZ + 90.0)
		float offsetX = offset * sine
		float offsetY = offset * cosine
		float positionX = PlayerRef.GetPositionX() + offsetX
		float positionY = PlayerRef.GetPositionY() + offsetY
		float positionZ = PlayerRef.GetPositionZ()
		akArvak.MoveTo(PlayerRef, offsetX, offsetY, 0.0, true)
		wait(0.2)
		loop = 20
		akArvak.EnableNoWait(true)
		while !akArvak.Is3DLoaded() && loop
			wait(0.05)
			loop -= 1
		endwhile
		MGTeleportInEffect.Play(akArvak, 3.0)
		wait(1.7)
		if is1stPerson
			ForceFirstPerson()
			wait(0.4) 
		endif
		akArvak.Activate(PlayerRef)
		wait(1.0)
		EnablePlayerControls()
		ArvakAlreadyMounted.Mod(1)
endFunction

Function PlaceInFrontOfPlayer(ObjectReference targetItem, float distanceOffset = 200.0, float heightOffset = 0.0, float angleOffset = 0.0)		;;regular summon, place it in front of player
{Place targetItem directly in front of oriented towards the player. The offsetValues may need to be changed for different objects.}
	float playerAngleZ = PlayerRef.GetAngleZ()
	float angZ = playerAngleZ + angleOffset
	float posX = PlayerRef.GetPositionX() + distanceOffset * Math.Sin(playerAngleZ)
	float posY = PlayerRef.GetPositionY() + distanceOffset * Math.Cos(playerAngleZ)
	float posZ = PlayerRef.GetPositionZ() + heightOffset
	targetItem.SetPosition(posX, posY, posZ)
	targetItem.SetAngle(0.0, 0.0, angZ)
	; Alternately SetPosition and SetAngle could be used, but I prefer TranslateTo
EndFunction

Function UnsummonArvak(Actor akArvak)
	SetHorseCanMove(akArvak, false)
	if (PlayerRef.HasLOS(akArvak))
		if akArvak.Is3DLoaded()
			MGTeleportOutEffect.Play(akArvak, 3.0)
		endif
		wait(2.4)
	endif
	akArvak.Disable()
	akArvak.moveto(ArvakIdleMarker)
	akArvak.EnableNoWait(true)
	if (PlayerRef.HasLOS(akArvak))
		loop = 20
		while !akArvak.Is3DLoaded() && loop
			wait(0.05)
			loop -= 1
		endwhile
		MGTeleportInEffect.Play(akArvak, 3.0)
	endif
	SetHorseCanMove(akArvak, true)
EndFunction

Function UpdateStage(Actor akArvak)
	if (ArvakEatenSouls.GetValue() >= ArvakSoulsStage6.GetValue() && Arvak_Quest_01.GetCurrentStageID() >= 10)		;stage6		
		if ArvakFinalStage.GetValue() < 1
			ArvakAlreadyMounted.Mod(-1)
			ArvakFinalStage.Mod(1)
			PlayerRef.RemoveSpell(ArvakHungerSystem)
			DeleteUnsummon(akArvak)
			Arvak_Quest_01.SetStage(60)
			PlayerRef.AddSpell(ArvakHungerSystem, false)
			ArvakFinalStageMessage.Show()
		endif
	elseif (ArvakEatenSouls.GetValue() >= ArvakSoulsStage5.GetValue() && Arvak_Quest_01.GetCurrentStageID() >= 10)			;stage5
		ArvakAlreadyMounted.Mod(-1)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		DeleteUnsummon(akArvak)
		Arvak_Quest_01.SetStage(50)
		PlayerRef.AddSpell(ArvakHungerSystem, false)
	elseif (ArvakEatenSouls.GetValue() >= ArvakSoulsStage4.GetValue() && Arvak_Quest_01.GetCurrentStageID() >= 10)			;stage4
		ArvakEvolvingMessage.Show()
		ArvakAlreadyMounted.Mod(-1)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		DeleteUnsummon(akArvak)
		Arvak_Quest_01.SetStage(40)
		PlayerRef.AddSpell(ArvakHungerSystem, false)
	elseif (ArvakEatenSouls.GetValue() >= ArvakSoulsStage3.GetValue() && Arvak_Quest_01.GetCurrentStageID() >= 10)			;stage3
		ArvakEvolvingMessage.Show()
		ArvakAlreadyMounted.Mod(-1)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		DeleteUnsummon(akArvak)
		Arvak_Quest_01.SetStage(30)
		PlayerRef.AddSpell(ArvakHungerSystem, false)
	elseif (ArvakEatenSouls.GetValue() >= ArvakSoulsStage2.GetValue() && Arvak_Quest_01.GetCurrentStageID() >= 10)			;stage2
		ArvakEvolvingMessage.Show()
		ArvakAlreadyMounted.Mod(-1)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		DeleteUnsummon(akArvak)
		Arvak_Quest_01.SetStage(20)
		PlayerRef.AddSpell(ArvakHungerSystem, false)
	elseif (ArvakEatenSouls.GetValue() >= ArvakSoulsStage1.GetValue() && Arvak_Quest_01.GetCurrentStageID() == 1) 			;stage1
		ArvakEvolvingMessage.Show()
		ArvakAlreadyMounted.Mod(-1)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		DeleteUnsummon(akArvak)
		Arvak_Quest_01.SetStage(10)
		PlayerRef.AddSpell(ArvakHungerSystem, false)
	elseif (ArvakEatenSouls.GetValue() >= 1 && Arvak_Quest_01.GetCurrentStageID() < 1)				;stagenegative
		Arvak_Quest_01.SetStage(1)
	endif
EndFunction

Function DeleteUnsummon(Actor akArvak)
	SetHorseCanMove(aKArvak, false)
	if aKArvak.Is3DLoaded()
		MGTeleportOutEffect.Play(akArvak, 3.0)
	endif
	wait(2.4)
	aKArvak.Disable()
	akArvak.moveto(ArvakIdleMarker)
;	aKArvak.Delete()
endfunction