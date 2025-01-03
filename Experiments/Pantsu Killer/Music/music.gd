extends Node

func play(level):
	if level == "playground":
		$Playground.play()
	if level == "boss":
		$BOSS.play()
	if level == "intro":
		$INTRO.play()
	if level == "END":
		$END.play()

func Stop():
	$Playground.stop()
	$BOSS.stop()
	$INTRO.stop()
	$END.stop()

func HIT():
	$Hit.play()
