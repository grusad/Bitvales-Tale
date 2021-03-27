extends GridMap
class_name Level

var navigation_id = 0
var astar : AStar = null

var navigation_points = []
var indicies = {}

func _ready():
	self.navigation_id = navigation_id
	self.astar = AStar.new()
	
	# Sets the navigation tiles!
	for cell in get_used_cells():
		
		#var id = get_cell_item(cell.x, cell.y, cell.z) Can be used to determine what tile to walk on
		var point = Vector3(cell.x, cell.y, cell.z)
		navigation_points.append(point)
		var index = indicies.size()
		indicies[point] = index
		astar.add_point(index, point)
			
	# Connect each tile
	for point in navigation_points:
		var index = get_point_index(point)
		var relative_points = PoolVector3Array([
			Vector3(point.x + 1, point.y, point.z),
			Vector3(point.x - 1, point.y, point.z),
			Vector3(point.x, point.y, point.z + 1),
			Vector3(point.x, point.y, point.z - 1),
			Vector3(point.x + 1, point.y, point.z + 1),
			Vector3(point.x - 1, point.y, point.z - 1),
			Vector3(point.x - 1, point.y, point.z + 1),
			Vector3(point.x + 1, point.y, point.z - 1),
		])
		
		for relative_point in relative_points:
			var relative_index = get_point_index(relative_point)
			if relative_index == null:
				continue
			
			if astar.has_point(relative_index):
				astar.connect_points(index, relative_index)
				
	
func find_path(start, target):
	var grid_start = world_to_map(start)
	var grid_end = world_to_map(target)
	
	grid_start.y = 0
	grid_end.y = 0
	
	var index_start = get_point_index(grid_start)
	var index_end = get_point_index(grid_end)
	
	if index_start == null or index_end == null:
		return []
	
	var astar_path = astar.get_point_path(get_point_index(grid_start), get_point_index(grid_end))
	var world_path = []
	for point in astar_path:
		world_path.append(map_to_world(point.x, point.y, point.z))	
			
	return world_path
		
	

func get_point_index(vector):
	if indicies.has(vector):
		return indicies[vector]
	return null
