extends CharacterBody2D

@export var HP : int

@export var Bullet : PackedScene

func _on_coin_area_body_entered(body):
	if body.is_in_group("PLAYER"):
		$"..".AddLockTarget(self)
		$SpawnBullet.start(0.5)
		Variables.Player.near = true


func _on_coin_area_body_exited(body):
	if body.is_in_group("PLAYER"):
		$"..".RemoveLockTarget(self)
		$SpawnBullet.stop()


func _on_spawn_bullet_timeout():
	$SpawnBullet.start(randi_range(0.5, 3))
	Spawn.call_deferred()
	
func Spawn():
	if Variables.Player.Tired :
		var tmp = Bullet.instantiate()
		Variables.BulletsManager.add_child(tmp)
		tmp.global_position = $sprite.global_position
		tmp.angle = ($sprite.global_position - Variables.Player.global_position).normalized()
		tmp.angle *= -1
