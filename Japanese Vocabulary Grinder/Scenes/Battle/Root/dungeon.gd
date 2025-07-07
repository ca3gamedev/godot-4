extends TileMapLayer

var enemies = []


func SetTiles():
	
	var astar_grid = AStarGrid2D.new()
	astar_grid.region = Rect2i(0, 0, 51, 51)
	astar_grid.cell_size = Vector2(32, 32)
	astar_grid.default_compute_heuristic = astar_grid.HEURISTIC_MANHATTAN
	astar_grid.update()
	
	for x in 50:
		for y in 50:
			self.set_cell(Vector2i(x, y), 0, Vector2i.ZERO, 0)
			astar_grid.set_point_solid(Vector2i(x, y), false)
	
	for i in len(enemies)-1:
		var path = astar_grid.get_point_path(enemies[i], enemies[i+1])
		for i_x in path:
			self.set_cell(self.local_to_map(i_x), 1, Vector2i.ZERO, 0)
