extends Node3D

@export var Door : Marker3D
@export var Cubicle : Marker3D

var beds = []
var pos = []

func _ready():
	for i in range(6):
		beds.append(false)
		var bedpos = $Beds.get_node(str(i)).global_position
		pos.append(bedpos)

func GetEmptyBed():
	for i in range(6):
		if beds[i] == false:
			beds[i] = true
			return pos[i]
	return Vector3.ZERO
