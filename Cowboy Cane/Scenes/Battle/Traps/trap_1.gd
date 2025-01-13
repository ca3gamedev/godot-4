extends Node2D

@export var walk_speed : float
@onready var target = Vector2i.ZERO

func _ready():
	await get_tree().process_frame
	RESET()

func _physics_process(delta):
	
	target.y += walk_speed * delta
	
	self.global_position = global_position.lerp(target, delta * walk_speed)


func _on_visible_on_screen_notifier_2d_screen_exited():
	RESET()

func RESET():
	self.global_position.y = Variables.TOPLEFT.global_position.y - 50
	var y = Variables.TOPLEFT.global_position.y - 50
	
	var x = 0
	
	var chance = randi_range(0, 10)
	if chance <= 3:
		x = 0
	elif chance >= 7:
		x = 600
	else:
		x = 320
	
	x += Variables.TOPLEFT.global_position.x - 100
	self.global_position.x = x
	target = Vector2(x, y + 700)
