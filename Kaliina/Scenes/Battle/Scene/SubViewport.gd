extends SubViewport

func _ready():
	%GameOver.hide()
	%TurnedOff.show()
	%Title.hide()

func ShowGameOver():
	$GameOver.show()
	%TurnedOff.hide()
	$Title.hide()
	%Reset.show()

func ResetGame():
	$GameOver.hide()
	$Title.show()
	%TurnOn.show()
	%Intro.started = false
	%Reset.hide()
	%Sisters.play("ready")
	MyGUI.get_node("Intro").play("ready")

func _on_reset_pressed():
	ResetGame()
