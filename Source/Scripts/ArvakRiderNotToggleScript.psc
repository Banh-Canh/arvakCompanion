scriptName arvakRidernotTogglescript extends activemagiceffect

;import utility

Actor Property ArvakRider auto
Actor Property PlayerRef auto

Spell property ArvakRiderAbility auto

;VisualEffect Property MGTeleportOutEffect Auto

;ObjectReference Property ArvakIdleMarker auto

int loop

function OnEffectStart(actor Target, actor Caster)
	if PlayerRef.HasSpell(ArvakRiderAbility)
		PlayerRef.RemoveSpell(ArvakRiderAbility)
	else
		PlayerRef.AddSpell(ArvakRiderAbility, false)
	endIf
endFunction

Function OnEffectFinish(actor Target, actor Caster)
;	UnsummonDisable(ArvakRider)
	PlayerRef.RemoveSpell(ArvakRiderAbility)
Endfunction


;Function UnsummonDisable(Actor akArvak)
;	if aKArvak.Is3DLoaded()
;		MGTeleportOutEffect.Play(aKArvak, 3.0)
;	endif
;	wait(2.4)
;	aKArvak.Disable()
;	akArvak.moveto(ArvakIdleMarker)
;endfunction