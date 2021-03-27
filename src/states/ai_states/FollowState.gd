extends State

onready var level : Level = get_tree().current_scene.get_node("Level")

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
	path = level.find_path(parent.global_transform.origin, target.global_transform.origin)
	timer.start()
	
	
func exit_state():
	timer.stop()

func physics_process(delta):
	parent.apply_friction(10, delta)
	if path.size() > 0:
		if parent.global_transform.origin.distance_to(path[0]) < 0.1:
			path.remove(0)
			
	if path.size() > 0:
		var direction = (path[0] - parent.global_transform.origin).normalized()
		parent.apply_movement(direction, acceleration, max_speed, delta)
	
func on_timer_timeout():
	path = level.find_path(parent.global_transform.origin, target.global_transform.origin)
	
