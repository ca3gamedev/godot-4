extends Node

func Start():
	
	%Anim.set("parameters/conditions/hurt", true)

func Transition():
	pass

func Update(delta):
	pass

func Physics(delta):
	pass


func _on_hitbox_body_entered(body):
	
	if body.is_in_group("ENEMYBULLET"):
		$"../".current = $"../".get_node("HURT")
		$"../".current.Start()
		Variables.GUI.Damage()
		Music.HIT()
		body.queue_free()
