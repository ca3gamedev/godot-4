extends TileMapLayer

var Rooms = []

func _ready():
	SpawnBorder()
	SpawnRooms()
	SpawnRoomsTiles()
	MakePaths()
	
	await get_tree().process_frame
	
	var local_pos = self.map_to_local(Rooms[0])
	#Variables.yasir.global_position = self.to_global(local_pos)
	
	await get_tree().process_frame
	
	SpawnCoins()
	SpawnDoor()
	
func SpawnBorder():
	for x in get_parent().DungeonSize.x + 10:
		for y in get_parent().DungeonSize.y + 10:
			set_cell(Vector2i(x-5, y-5), 0, Vector2i(0, 0), 0)

func SpawnRooms():
	Rooms.clear()
	for i in $"../".NumberofRooms:
		var x = randi_range(2, $"../".DungeonSize.x-2)
		var y = randi_range(2, $"../".DungeonSize.y-2)
		Rooms.append(Vector2i(x, y))

func SpawnRoomsTiles():
	for i in len(Rooms):
		
		var h = randi_range(5, $"../".RoomsSize)
		var w = randi_range(5, $"../".RoomsSize)
		
		
		for x in h:
			for y in w:
				var pos = Vector2i(Rooms[i].x - (w / 2) + x, Rooms[i].y - (h / 2) + y,)
				if x == 0 or y == 0 or x == h-1 or y == w-1 or pos.x == 3 or pos.x == $"../".DungeonSize.x-3 or pos.y == 3 or pos.y == $"../".DungeonSize.y-3:
					if IsValid(pos.x, pos.y):
						if get_cell_source_id(pos) == 0:
							set_cell(pos, 1, Vector2i.ZERO, 0)
						if get_cell_source_id(pos) == 3:
							if randi_range(1, 3) == 2:
								set_cell(pos, 1, Vector2i.ZERO, 0)
				else:
					if IsValid(pos.x, pos.y) and get_cell_source_id(pos) == 0 :
						set_cell(pos, 3, Vector2i.ZERO, 0)
					

func MakePaths():
	
	for i in len(Rooms)-1:
		PathTowards(Rooms[i], Rooms[i+1], 0)


func IsValid(x, y):
	if x > 2 and x < $"../".DungeonSize.x - 2 and y > 2 and y < $"../".DungeonSize.y - 2:
		return true
	return false

func PathTowards(start, goal, i):
	if i > 800:
		return
	if goal.distance_to(start) < 2:
		return
	
	var x = 0
	var y = 0
	if start.x < goal.x :
		x = 1
	elif start.x > goal.x :
		x = -1
	else:
		x = 0
	if start.y < goal.y :
		y = 1
	elif start.y > goal.y :
		y = -1
	else:
		y = 0
		
	if x != 0 and y != 0:
		if randi_range(0, 10) > 5:
			x = 0
		else:
			y = 0
	
	set_cell(start, 5, Vector2i.ZERO, 0 )
	set_cell(start + Vector2i(1, 0), 5, Vector2i.ZERO, 0 )
	set_cell(start + Vector2i(0, -1), 5, Vector2i.ZERO, 0 )
	set_cell(start + Vector2i(0, 1), 5, Vector2i.ZERO, 0 )
	set_cell(start + Vector2i(-1, 0), 5, Vector2i.ZERO, 0 )
	
	PathTowards(start + Vector2i(x, y), goal, i+1)

func SpawnCoins():
	for i in Variables.roguelevelsid * 10:
		
		var x = randi_range(3, get_parent().DungeonSize.x-3)
		var y = randi_range(3, get_parent().DungeonSize.x-3)
		
		if get_cell_source_id(Vector2i(x, y)) > 0:
			
			var local = self.map_to_local(Vector2i(x, y))
			var local2 = self.to_global(local)
			
			Variables.CoinManager.SpawnCoin(local2.x, local2.y)

func SpawnDoor():
	
	var local = self.map_to_local(Rooms[5])
	var local2 = self.to_global(local)
	
	Variables.Teleport.global_position = local2
