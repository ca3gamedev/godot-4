extends CharacterBody2D

@export var near : bool
@export var Tired : bool

func _ready():
	Variables.Player = self
	
	var x = randi_range(10, 40)
	var y = randi_range(10, 40)
	var local = %Dungeon.map_to_local(Vector2i(x, y))
	var global = %Dungeon.to_global(local)
	self.global_position = global
	%Camera2D.global_position = global
