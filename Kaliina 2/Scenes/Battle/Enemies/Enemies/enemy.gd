extends CharacterBody2D

@export var HP : int
@export var id : int
@export var shield : int

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
