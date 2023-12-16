extends CanvasLayer

func Spawn():
	%NextBall.Spawn()

func _ready():
	$ScoreLabel.text = str(CombatData.score)
