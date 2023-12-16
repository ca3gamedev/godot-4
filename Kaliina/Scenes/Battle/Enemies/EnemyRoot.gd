extends CharacterBody2D

@export var Attack : bool
@export var HP : int
@export var myoff : bool
@export var id : int
@export var reward : int

func _ready():
	id = randi_range(0, 2)
	$Aura.animation = str(id)


func HIT(ballid, damage, hadouken, superball):
	
	if ballid == id:
		get_parent().HIT("hit")
		HP -= 100
	
	if hadouken:
		HP -= damage * 5
	elif superball:
		HP -= damage * 10
		get_parent().HIT("super")
	else:
		HP -= damage
		if randf_range(1, 10) > 8:
			CombatData.score += reward
		else:
			CombatData.score += randi_range(1, 5)
		get_parent().UpdateCoin()
	
	if HP < 1:
		if randf_range(1, 10) > 7:
			get_parent().Coin(self.global_position)
		self.queue_free()
