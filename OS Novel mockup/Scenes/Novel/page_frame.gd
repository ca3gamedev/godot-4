extends Node2D



func _ready() -> void:
	pass # Replace with function body.


func ChangePage(page):
	
	$"1".hide()
	$"2".hide()
	$"3".hide()
	
	get_node(str(page)).show()


func _on_hide_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", 670, 1)
