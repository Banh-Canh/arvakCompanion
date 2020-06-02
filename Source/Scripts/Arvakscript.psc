Scriptname ArvakScript extends ReferenceAlias

import utility

VisualEffect Property MGTeleportOutEffect Auto
VisualEffect Property MGTeleportInEffect Auto

ObjectReference Property ArvakIdleMarker auto

Message Property ArvakKOMessage auto
;Message Property ArvakEscapeMessage auto

spell property DLC01SummonSoulHorse auto
spell property ArvakHungerSystem auto

ReferenceAlias Property Alias_Arvak auto

Actor Property PlayerRef auto
Actor Property Arvak0 auto
Actor Property ArvakRef auto hidden

Message Property ArvakIsReadyMessage auto

ArvakLibraryFunctionScript Property Arvak_Quest_01 auto

Location property DLC1SoulcairnLocation auto

Armor Property ArvakTokenUpdater auto

bool ArvakDead = false

int loop

Event OnInit() 		
	Alias_Arvak.ForceRefTo(Arvak0)							
	ArvakRef = Self.GetReference() As Actor
EndEvent

function OnEnterBleedout()												; when Ko'd send arvak back to soul cairn & remove spell for 24h	
	Arvak_Quest_01.SetHorseCanMove(ArvakRef, false)
	if ArvakRef.Is3DLoaded()
		MGTeleportOutEffect.Play(ArvakRef, 3.0)
	endif
	wait(2.4)
	ArvakRef.Disable()
	ArvakRef.moveto(ArvakIdleMarker)
	ArvakRef.EnableNoWait(true)
	loop = 20
	while !ArvakRef.Is3DLoaded() && loop
		wait(0.05)
		loop -= 1
	endwhile
	MGTeleportInEffect.Play(ArvakRef, 3.0)
	PlayerRef.RemoveSpell(DLC01SummonSoulHorse)
	PlayerRef.RemoveSpell(ArvakHungerSystem)
	ArvakKOMessage.show()
	ArvakRef.RestoreActorValue("health", 9999)
	Arvak_Quest_01.SetHorseCanMove(ArvakRef, true)
	ArvakDead = true
	RegisterForSingleUpdateGameTime(24.0)
endfunction

Event OnLocationChange(Location akOldLoc, Location akNewLoc)				;in vanilla, last horse auto fast travel with you. It summons it in front of you instead and apply debuff.
	if (akOldLoc == DLC1SoulcairnLocation)
		if !PlayerRef.HasSpell(ArvakHungerSystem)
			ArvakRef.Disable()
			ArvakRef.moveto(ArvakIdleMarker)
			ArvakRef.EnableNoWait(true)
;			ArvakEscapeMessage.Show()
		endif
	endif
endEvent

Event OnUpdateGameTime()	
	ArvakDead = false
	PlayerRef.AddSpell(DLC01SummonSoulHorse, false)
	ArvakIsReadyMessage.Show()
endEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)			;if soul trap token equipped, try to update the evolution
	If akBaseObject == ArvakTokenUpdater as Armor
		if ArvakDead == false
			if PlayerRef.IsInCombat() || ArvakRef.IsInCombat() || PlayerRef.IsOnMount()
				RegisterForSingleUpdate(10.0)
			else
				ArvakRef.RemoveItem(ArvakTokenUpdater)
				Arvak_Quest_01.UpdateStage(ArvakRef)
				ArvakRef = Self.GetReference() As Actor
			endif
		else
			ArvakRef.RemoveItem(ArvakTokenUpdater)
		endif
	endif
EndEvent

Event OnUpdate()
	if ArvakDead == false
		if PlayerRef.IsInCombat() || ArvakRef.IsInCombat() || PlayerRef.IsOnMount()
			RegisterForSingleUpdate(20.0)
		else
			ArvakRef.RemoveItem(ArvakTokenUpdater)
			Arvak_Quest_01.UpdateStage(ArvakRef)	
			ArvakRef = Self.GetReference() As Actor
		endif
	else
		ArvakRef.RemoveItem(ArvakTokenUpdater)
	endif
EndEvent








			
				
				