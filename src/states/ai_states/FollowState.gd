extends State

onready var navigation = get_tree().current_scene.get_node("Navigation")

export (int) var max_speed = 100
export (int) var acceleration = 2

var timer = null
var target = null
var path = []


func _ready():
	timer = Timer.new()
	timer.wait_time = 2
	timer.connect("timeout", self, "on_timer_timeout")
	add_child(timer)
	
func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	target = parameters.get("target")
	
	find_path()
	
	for index in path:
		var i = MeshInstance.new()
		i.mesh = CubeMesh.new()
		i.scale *= 0.5
		
		get_tree().root.add_child(i)
		i.global_transform.origin = index
	
	timer.start()
	
	
func exit_state():
	timer.stop()

func physics_process(delta):
	
	parent.apply_friction(10, delta)
	if path.size() > 0:
		if parent.global_transform.origin.distance_to(path[0]) < 0.5:
			path.remove(0)
	
	
	if path.size() > 0:
		var direction = (path[0] - parent.global_transform.origin).normalized()
		print(direction)
		parent.apply_movement(direction, acceleration, max_speed, delta)

func find_path():
	path = navigation.get_simple_path(parent.global_transform.origin, target.global_transform.origin, true)
	

func on_timer_timeout():
	find_path()
	
