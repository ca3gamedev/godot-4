extends Node2D


func RemoveEnemy(level):
	call_deferred("queue_free", get_node("Enemies/" + str(level)))
