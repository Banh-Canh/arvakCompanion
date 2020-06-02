scriptName arvakshrinescript extends activemagiceffect

Spell Property DLC01SummonSoulHorse auto

ArvakScript Property Arvak auto

Message Property ArvakStatsMessage auto

GlobalVariable property ArvakEatenSouls auto
GlobalVariable property ArvakSoulsStage1 auto
GlobalVariable property ArvakSoulsStage2 auto
GlobalVariable property ArvakSoulsStage3 auto
GlobalVariable property ArvakSoulsStage4 auto
GlobalVariable property ArvakSoulsStage5 auto
GlobalVariable property ArvakSoulsStage6 auto

int[] ArvakAttributesValues

Event OnActivate(ObjectReference akActionRef)
	if Game.GetPlayer().HasSpell(DLC01SummonSoulHorse)
		ArvakAttributesValues = new int[6]
		ArvakAttributesValues[5] = ArvakEatenSouls.GetValue() as int		;stage6
		CheckStatsArvak(Arvak.ArvakRef)
		int iButton = ArvakStatsMessage.Show(ArvakAttributesValues[0], ArvakAttributesValues[1], ArvakAttributesValues[2], ArvakAttributesValues[3], ArvakAttributesValues[4],ArvakAttributesValues[5])
	endif

EndEvent

function CheckStatsArvak(Actor akArvak)
  ArvakAttributesValues[0] = akArvak.GetLevel()
  ArvakAttributesValues[1] = akArvak.GetActorValueMax("Health") as int
  ArvakAttributesValues[2] = akArvak.GetActorValueMax("Stamina") as int
  ArvakAttributesValues[3] = akArvak.GetActorValueMax("Magicka") as int
  ArvakAttributesValues[4] = akArvak.GetActorValue("SpeedMult") as int
endFunction



