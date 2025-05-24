extends TextureButton

@export var scene : String

func _ready() -> void:
	$Frame.hide()


func _on_mouse_entered() -> void:
	$Frame.show()
	


func _on_mouse_exited() -> void:
	$Frame.hide()


func _on_pressed() -> void:
	Variables.Root.ChangeTab(scene)
