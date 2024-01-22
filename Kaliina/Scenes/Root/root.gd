extends Node2D


func EndBattle():
	$Battle.RemoveBattle()
	%Dungeon.call_deferred("set_process_mode", PROCESS_MODE_INHERIT)
	Music.StopMusic()
