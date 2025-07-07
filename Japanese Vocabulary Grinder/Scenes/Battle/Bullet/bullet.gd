extends Sprite2D

@export var walk_speed : float
@export var angle : Vector2
@export var offset_hit : Vector2

func _ready():
	walk_speed = randi_range(10, 100)
	walk_speed *= 0.2
	$Dead.start(randi_range(5, 10))

func _physics_process(delta):
	self.global_position += angle * delta * walk_speed


func _on_dead_timeout():
	self.queue_free()


func _on_area_2d_area_entered(area):
	
	if area.is_in_group("PLAYER"):
		Variables.HP -= 10
		
		Variables.Words.UpdateHP()
		if Variables.HP < 1:
			Variables.EndBattle()
