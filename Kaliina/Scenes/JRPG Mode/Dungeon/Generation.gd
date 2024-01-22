extends Node

@export var DungeonSize : Vector2i
@export var RoomSize : Vector2i
@export var MaxRooms : Vector2i
@export var Grass : int
@export var Dirt : int
var Map 
var DirtMap = []
var GrassMap = []
var SeedRooms = []
var PathMap = []

func _ready():
	GenerateMap()
	
func GenerateMap():
	GenerateEmptyMap()
	GenerateRooms()
	
func GenerateEmptyMap():
	Map = GetEmptyArrayMap()

func GetEmptyArrayMap():
	var mapita = []
	for x in DungeonSize.x:
		mapita.append([])
		for y in DungeonSize.y:
			mapita[x].append([])
			mapita[x][y] = -1
	return mapita

func GenerateRooms():
	
	var rooms = randi_range(MaxRooms.x, MaxRooms.y)
	for i in rooms:
		var x = randi_range(0, DungeonSize.x)
		var y = randi_range(0, DungeonSize.y)
		var w = randi_range(RoomSize.x, RoomSize.y)
		var h = randi_range(RoomSize.x, RoomSize.y)
		SeedRooms.append(Vector2i(x, y))
		GrassMap.append(GenerateRoom(x - (w/2), y - (h /2), w, h))
	
	for i in len(GrassMap):
		%TileMap.set_cells_terrain_connect(0, GrassMap[i], 0, Grass)
		Map[GrassMap[0][i].x][GrassMap[0][i].y] = Grass
	for i in len(DirtMap):
		%TileMap.set_cells_terrain_connect(0, DirtMap[i], 0, Dirt)
		Map[DirtMap[0][i].x][DirtMap[0][i].y] = Dirt

func GenerateRoom(x, y, w, h):
	var cells = []
	var walls = []
	for a in w:
		for b in h:
			if x+a > 2 and x+a < DungeonSize.x - 3 and b+y > 2 and b+y < DungeonSize.y:
				if a < 2 or a > w-3 or  b < 2 or b > h-3:
					walls.append(Vector2i(x+a, y+b))
				else:
					cells.append(Vector2i(x+a, y+b))
	DirtMap.append(walls)
	return cells

func GeneratePaths():
	
	var pos = SeedRooms[0]
	

func RandomWalk(mypos, target, id):
	if mypos == target and id >= len(SeedRooms):
		return
	else:
		if mypos == target:
			RandomWalk(target, SeedRooms[id+1], id+1)
		else:
			if %Tilemap.get_cell_tile_data(0, mypos).terrain == -1:
				PathMap.append(mypos)
				PathMap.append(mypos - Vector2i.LEFT)
				PathMap.append(mypos - Vector2i.RIGHT)
				PathMap.append(mypos - Vector2i.UP)
				PathMap.append(mypos - Vector2i.DOWN)
			
			var chance = randi_range(0, 6)
			match(chance):
				1 : RandomWalk(Vector2i(mypos.x - 1, mypos.y), target, id)
				2 : RandomWalk(Vector2i(mypos.x + 1, mypos.y), target, id)
				3 : RandomWalk(Vector2i(mypos.x, mypos.y + 1), target, id)
				4 : RandomWalk(Vector2i(mypos.x, mypos.y - 1), target, id)
				_: 
					var newpos = GetDistance(mypos, target)
					RandomWalk(newpos, target, id)

func GetDistance(mypos, target):
	var x = sign(mypos.x - target.x)
	var y = sign(mypos.y - target.y)
	return Vector2i(x, y)

func CheckPath(mypos):
	
	for i in len(PathMap):
		if mypos == PathMap[i]:
			return
	
