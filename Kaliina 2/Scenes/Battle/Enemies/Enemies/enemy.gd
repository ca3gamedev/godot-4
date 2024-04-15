extends CharacterBody2D

@export var HP : int
@export var id : int
@export var shield : int

@export var bullet01 : PackedScene
@onready var target = Vector2.ZERO
@export var rot_speed : float
@onready var angle = 0

func HIT(newid, strenght, pos):
	
	if shield == 1:
		if self.global_position.y < pos.y:
			HP -= 1
		else:
			HP -= 5 * strenght
		
			if newid == id:
				HP -= 40 * strenght
	elif shield == 1:
		if self.global_position.y > pos.y:
			HP -= 1
		else:
			HP -= 5 * strenght
		
			if newid == id:
				HP -= 40 * strenght	
	else:
		HP -= 5 * strenght
	
		if newid == id:
			HP -= 40 * strenght
	
	$HP.value = HP
	
	if HP < 1 :
		CombatData.EnemiesLeft -= 1
		self.queue_free()
	
func _ready() -> void:
	id = randi_range(0, 3)
	shield = id
	
	$id.frame = id
	
	$FSM.current = $FSM.get_node(str(id))
	$HP.max_value = HP
	$HP.value = HP
	
	if shield == 1:
		$SoldierExportDir8.modulate = Color.RED
	if shield == 2:
		$SoldierExportDir8.modulate = Color.BLUE
	
	if id != 2:
		$Timer.start(randi_range(1, 5))
	else:
		$Timer.start(0.2)


func _process(delta: float) -> void:
	
	angle += delta * rot_speed
	
	target.x = global_position.x + cos(angle) * 50
	target.y = global_position.y + sin(angle) * 50


func _on_timer_timeout() -> void:
	
	var tmp = bullet01.instantiate()
	$"../Bullets".add_child(tmp)
	tmp.global_position = self.global_position
	var dir = DataPath.Pacifica.global_position - self.global_position
	if id == 2:
		dir = target - self.global_position
	tmp.dir = dir.normalized()
