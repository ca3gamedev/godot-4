extends CharacterBody2D

@export var EnemyID : CharacterBody2D

func HIT():
	EnemyID.HIT(self.global_position)
	self.global_position.y = 9999

func Start(id):
	EnemyID = id
