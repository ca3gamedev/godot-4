extends Node2D

var types = []

func _ready():
	
	for i in 3:
		types.append(randi_range(0, 3))
		SetCell(i, types[i])
	

func SetCell(id, type):
	get_node(str(id)).ChangeType(type)


func GetInput(type):
	
	if type == types[0]:
		types.remove_at(0)
		types.append(randi_range(0, 3))
		%LevelQuota.value += 1
		%DoubleStep.value += 1
		
		if %LevelQuota.value > 19:
			%LevelQuota.value = 0
			if %DoubleStep.value > 4:
				%Player.DOUBLERIGHT()
				%DoubleStep.value = 0
			else:
				%Player.WALKRIGHT()
		
		for i in 3:
			SetCell(i, types[i])
	else:
		%DoubleStep.value = 0
		%Score.value -= 1
		
		if %Score.value < 1:
			Variables.ChangeScene("BATTLE END")
