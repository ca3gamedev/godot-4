extends Node2D

@export var DataPaths : Node2D
@export var bullet01 : PackedScene
@export var BulletManager : Node2D
@export var id : int
@export var bombid : int
@export var strenght : float
@export var strenghtlevels : int
@export var timerstrenght : int
@export var hadoukenstrenght : float
@export var normalshot : bool
@export var specialshot : bool

func _process(delta):
	
	if Input.is_action_pressed("SHOOT") and %GUI.get_node("Strenght").value < 100:
		timerstrenght += delta * 300
		%GUI.get_node("Strenght").value = timerstrenght
		
	if Input.is_action_just_released("SHOOT") and timerstrenght > 40:
		normalshot = true
	
	if Input.is_action_just_released("UPGUN"):
		CombatData.IsPacifica = !CombatData.IsPacifica
	
	var qcb = MyInput.get_node("Check").GetCommand()
	
	if qcb == "QCF" or qcb == "QCB" :
		if Input.is_action_just_released("SHOOT") and CombatData.StaminaStocks >= 1:
			specialshot = true
	
	if normalshot and specialshot:
		if CombatData.StaminaStocks >= 3:
			Spawn(hadoukenstrenght * delta * strenghtlevels / 5, 0, true, 20)
			normalshot = false
			specialshot = false
			CombatData.StaminaStocks -= 3
			DataPaths.MyGUI.get_node("StaminaStocks").text = str(CombatData.StaminaStocks)
		else:
			specialshot = false
			var id = 0
			if qcb == "QCF":
				id = 2
			if qcb == "QCB":
				id = 1
			Spawn(hadoukenstrenght * delta * strenghtlevels / 5, id, false, 7)
			CombatData.StaminaStocks -= 1
			DataPaths.MyGUI.get_node("StaminaStocks").text = str(CombatData.StaminaStocks)
	elif normalshot and not specialshot:
		normalshot = false
		Spawn(timerstrenght * delta * strenghtlevels * 1.4, 0, false, 3)
	else:
		if timerstrenght < 40:
			if not normalshot and specialshot:
				specialshot = false
				var id = 0
				if qcb == "QCF":
					id = 2
				if qcb == "QCB":
					id = 1
				Spawn(hadoukenstrenght * delta * strenghtlevels / 5, id, false, 7)
				CombatData.StaminaStocks -= 1
				DataPaths.MyGUI.get_node("StaminaStocks").text = str(CombatData.StaminaStocks)


func Spawn(strenght, id, special, damage):
	
	var bomb
	
	match(bombid):
		_: bomb = bullet01.instantiate()
	
	bomb.global_position = self.global_position
	BulletManager.add_child(bomb)
	bomb.apply_impulse(GetAngle() * strenght)
	
	timerstrenght = 0
	%GUI.get_node("Strenght").value = timerstrenght
	
	%NextBall.Spawn()
	
	if special :
		bomb.SetID("super", id, 3, damage)
	else:
		bomb.SetID(str(%NextBall.id[3]), id, %NextBall.id[3], damage)
	if id != 0:
		bomb.hadouken = true

func GetAngle():	
	return (%Pacifica.global_position - self.global_position).normalized()
