extends Node2D

@export var answer_scene : PackedScene

func _ready() -> void:
	
	for i in len(%Variables.questions):
		Spawn(i)
	
	UpdateList()
	%Vertical.max_value = len(%Variables.questions) * 200
	self.position.y = 50
	
func UpdateList():
	for i in len(%Variables.questions):
		UpdateAnswer(i, %GetText.GetText(i, %Family.selected, %Girl.selected), %Variables.questions[i])
	


func Spawn(y):
	var tmp = answer_scene.instantiate()
	tmp.position.y = y * 200
	tmp.name = str(y)
	add_child(tmp)

func UpdateAnswer(id, answer, question):
	get_node(str(id)).Update(question, answer)


func _on_vertical_value_changed(value: float) -> void:
	self.position.y = value * -1 + 50
