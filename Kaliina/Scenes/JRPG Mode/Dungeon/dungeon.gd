extends Node2D

func SummonBattle(level):
	call_deferred("set_process_mode", PROCESS_MODE_DISABLED)
	%Battle.SpawnTest()
