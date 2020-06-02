ScriptName ArvakAttackSoulTrapEffectScript extends ActiveMagicEffect

import utility

spell property ArvakSoulTrapPlayer auto

Actor Property PlayerRef auto

Armor Property ArvakTokenUpdater auto

ArvakScript Property Arvak auto

GlobalVariable property ArvakEatenSouls auto
GlobalVariable property ArvakToggleSoulTrap auto

Message Property ArvakConsumedSoulMessage auto

Keyword Property ActorTypeUndead auto

int loopb = 0
bool tutomsg = false


Event OnEffectStart(Actor Target, Actor Caster)						;cast the real soul trap for the player
	if !Target.IsDead() && ArvakToggleSoulTrap.GetValue() == 1
		ArvakSoulTrapPlayer.RemoteCast(PlayerRef, Arvak.ArvakRef, Target)
;		ArvakSoulTrapPlayer.cast(PlayerRef, Target)
	endif
EndEvent


Event OnEffectFinish(Actor Target, Actor Caster)				;if soul trapped send a token to Arvak's evolution
	if ArvakToggleSoulTrap.GetValue() == 1
		if (PlayerRef.TrapSoul(Target) || Arvak.ArvakRef.TrapSoul(Target))
			SoulTrapped()
			if (Arvak.ArvakRef.GetItemCount(ArvakTokenUpdater) < 1)
				Arvak.ArvakRef.AddItem(ArvakTokenUpdater, 1, true)
				Arvak.ArvakRef.EquipItem(ArvakTokenUpdater)
			endif
		endif
	endif

endEvent

Function SoulTrapped()
	if (PlayerRef.HasKeyword(ActorTypeUndead))
		ArvakEatenSouls.Mod(1)			
	else
		ArvakEatenSouls.Mod(2)
	endif
	ArvakConsumedSoulMessage.Show()
	
endfunction