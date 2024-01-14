extends CanvasLayer

func Spawn():
	%NextBall.Spawn()

func Reset():
	$ScoreLabel.text = str(CombatData.score)
	$Stamina.value = 0
	$StaminaStocks.text = "0"
	$SuperStock.value = 0
	$Strenght.value = 0

func GameLoaded():
	$Intro.play("Start")

func StopMusicIntro():
	Music.StopIntro()
