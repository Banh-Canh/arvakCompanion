scriptName arvakTogglescript extends activemagiceffect

spell property ArvakHungerSystem auto
spell property DLC01SummonSoulHorse auto
spell property ArvakRiderSummon auto

ArvakLibraryFunctionScript Property Arvak_Quest_01 auto
ArvakScript Property Arvak auto

Actor Property PlayerRef auto

function OnEffectStart(actor Target, actor Caster)						
	if PlayerRef.HasSpell(ArvakHungerSystem)
		Arvak_Quest_01.UnSummonArvak(Arvak.ArvakRef)
		PlayerRef.RemoveSpell(ArvakHungerSystem)
		PlayerRef.RemoveSpell(ArvakRiderSummon)
	else
		PlayerRef.AddSpell(ArvakHungerSystem, false)
		if Arvak_Quest_01.GetCurrentStageID() >= 20
			PlayerRef.AddSpell(ArvakRiderSummon)
		endif
	endIf
endFunction




