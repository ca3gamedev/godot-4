extends VisibleOnScreenNotifier2D

func TEST():
	print("TEST")


func _on_screen_exited():
	print("GAME OVER")
	Variables.GameOver()
