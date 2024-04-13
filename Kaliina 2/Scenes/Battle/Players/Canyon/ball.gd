extends Node

@export var strenghtmultiplier : float
@export var Ball : PackedScene

func _process(delta: float) -> void:
	if Input.is_action_pressed("SPACE"):
		DataPath.GUI.AddBall(delta * 3)
	
	if Input.is_action_just_released("SPACE"):
		var strenght = DataPath.GUI.GetBall()
		DataPath.GUI.ClearBall()
		if strenght > 0.2:
			ShootBall(strenght)
		

func ShootBall(strenght):
	var ball = Ball.instantiate()
	var dir = DataPath.Pacifica.GetDir().x
	var angle = Vector2.UP
	if DataPath.Pacifica.Pacifica:
		angle.x = dir
		ball.HP = 3
	$"../".BallsManager.add_child(ball)
	ball.global_position = DataPath.Pacifica.global_position
	ball.apply_impulse(angle * strenght * strenghtmultiplier, Vector2.ZERO)
	ball.damage = strenght
	ball.SetID(DataPath.GUI.GetID())
