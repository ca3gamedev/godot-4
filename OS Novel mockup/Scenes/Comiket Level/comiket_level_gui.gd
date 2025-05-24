extends Node2D

@export var current_store : String

func _ready() -> void:
	HideStore()
	Menue.SHOWCOIN()
	MenueButton.show()

func HideStore():
	$StoreGUI.hide()
func EnterStore(storename):
	$StoreGUI/StoreName.text = storename
	current_store = storename
	$StoreGUI.show()


func _on_enter_pressed() -> void:
	if Variables.coins < 10:
		$StoreGUI/StoreName.text = "You need at least 10 coins to enter"
	else:
		Variables.coins -= 10
		Menue.UpdateCoins()
		Variables.x_pos = $"Comiket Level".x_pos
		Variables.rot_angle = $"Comiket Level".rot_angle
		Variables.ChangeScene(current_store)
	
