extends Node2D

var next = []
@export var current : int

@export var MaxID : int

func _ready():
	for i in range(4):
		AddNext()
	Update()

func MaxProgress(id):
	MaxID = (id * 3) + 10
	$CanvasLayer/Progress.max_value = MaxID


func AddNext():
	
	if current <= 5:
		current += 1
		next.insert(0, randi_range(0, 3))
	else:
		current = 0
		next.insert(0, randi_range(4, 7))

func Update():
	
	for i in range(4):
		get_node("CanvasLayer/" + str(i)).Update(next[i])
	
func _process(delta):
	
	DataPaths.GUI.UpdateTimer(delta)
	
	var id = -999
	var coin = false
	
	if Input.is_action_just_released("A"):
		id = 0
	if Input.is_action_just_released("B"):
		id = 1
	if Input.is_action_just_released("C"):
		id = 2
	if Input.is_action_just_released("D"):
		id = 3
	if Input.is_action_just_released("LEFT"):
		id = 4
		coin = true
	if Input.is_action_just_released("RIGTH"):
		id = 5
		coin = true
	if Input.is_action_just_released("UP"):
		id = 6
		coin = true
	if Input.is_action_just_released("DOWN"):
		id = 7
		coin = true
	
	if id == next[3]:
		next.remove_at(3)
		AddNext()
		Update()
		$CanvasLayer/Progress.value += 1
		
		if id >= 4:
			CombatData.gold += randi_range(3, 8)
			DataPaths.GUI.UpdateGold()
		
		if $CanvasLayer/Progress.value > MaxID - 1:
			get_tree().paused = false
			self.queue_free()
