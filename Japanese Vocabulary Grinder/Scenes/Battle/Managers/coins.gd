extends Node2D

@export var Coin : PackedScene

@export var spawn : int


func _ready():
	Variables.CoinManager = self
	
	for i in spawn:
		var x = randi_range(0, 49)
		var y = randi_range(0, 49)
		var pos = %Dungeon.map_to_local(Vector2i(x, y))
		var tmp = Coin.instantiate()
		tmp.global_position = %Dungeon.to_global(pos)
		add_child(tmp)
		%Dungeon.enemies.append(Vector2i(x, y))
	
	%Dungeon.SetTiles()

func AddLockTarget(target):
	if not %LockMira.targets.has(target) and is_instance_valid(Variables.Words):
		%LockMira.targets.insert(0, target)
		Variables.Words.GetNewerWord(target)
		Variables.Player.near = true

func RemoveLockTarget(target):
	if %LockMira.targets.has(target) and is_instance_valid(Variables.Words):
		%LockMira.targets.erase(target)
		Variables.Words.Clear()
	if %LockMira.targets.size() > 0 and is_instance_valid(Variables.Words):
		Variables.Words.GetNewerWord(target)
	if len(%LockMira.targets) < 1:
		Variables.Player.near = false
