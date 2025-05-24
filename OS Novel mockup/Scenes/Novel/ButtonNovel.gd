extends TextureButton

@export var page : int = 1

func _ready() -> void:
	$Frame.hide()
	%PageFrame.position.y = 700


func _on_mouse_entered() -> void:
	$Frame.show()


func _on_mouse_exited() -> void:
	$Frame.hide()


func _on_pressed() -> void:
	%PageFrame.ChangePage(page)
	var tween = create_tween()
	tween.tween_property(%PageFrame, "position:y", -10, 1)
