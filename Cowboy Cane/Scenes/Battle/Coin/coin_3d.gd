extends Area3D

var idle = false

func _ready():
	$CollisionShape3D.disabled = false

func _on_area_entered(area):
	
	if area.is_in_group("ATTACKBOX"):
		$AnimationPlayer.play("COIN CENTER")
		Variables.coins += 1
		Variables.GUI.Coin()
		idle = true

func _process(delta):
	
	if not idle:
		$rot.rotate_y(delta)

func DELETE():
	self.queue_free()
