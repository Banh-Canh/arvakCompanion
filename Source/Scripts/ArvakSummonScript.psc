scriptName arvaksummonscript extends activemagiceffect

spell property DLC01SummonSoulHorse auto

ArvakLibraryFunctionScript Property Arvak_Quest_01 auto
ArvakScript Property Arvak auto

Actor Property PlayerRef auto

GlobalVariable property ArvakAlreadyMounted auto

function OnEffectFinish(Actor Target, Actor akCaster)
	PlayerRef.DispelSpell(DLC01SummonSoulHorse)
endFunction

function OnEffectStart(Actor Target, Actor Caster)
	if (!Arvak_Quest_01.IsRunning() && !Arvak_Quest_01.IsCompleted())
		Arvak_Quest_01.Start()
	endif
	if ArvakAlreadyMounted.GetValue() < 1
		Arvak_Quest_01.FirstMount(Arvak.ArvakRef)
	else
		Arvak_Quest_01.SummonArvak(Arvak.ArvakRef)
	endif	
endFunction










		
	


