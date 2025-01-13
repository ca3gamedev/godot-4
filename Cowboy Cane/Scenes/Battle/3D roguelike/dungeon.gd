extends Node3D

@export var DungeonSize : Vector2i
@export var NumberofRooms : int
@export var RoomsSize : int

@export var camera : Camera3D

func _process(delta):
	
	if Input.is_action_just_released("SAVE"):
		var scene = PackedScene.new()
		scene.pack($GridMap)
		var result = ResourceSaver.save(scene, "user://map.tscn")
		
		if result == OK:
			print("MAPA SAVED")
