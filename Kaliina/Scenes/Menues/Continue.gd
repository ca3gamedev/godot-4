extends Button

@export var Next : String
@export var NextParent : Node
@export var MyParent : Node


func _ready():
	self.hide()

func _on_button_up():
	var tmp = load(Next)
	var nextscene = tmp.instantiate()
	NextParent.add_child(nextscene)
	MyGUI.GameLoaded()
	self.queue_free()
