extends KinematicBody
class_name Player

onready var animation_tree = $AnimationTree

var velocity = Vector3()
var states = [] setget push_state

func _ready():
	var initial_state = get_state("IdleState")
	initial_state.enter_state(self, null)
	states.push_back(initial_state)
	

func _physics_process(delta):
	for state in states:
		state.physics_process(delta)
		state.process_unhandled_input(delta)

func apply_movement(movement_direction, acceleration, max_speed, delta):
	var horizontal_velocity = velocity
	horizontal_velocity.y = 0
	var new_position = movement_direction * max_speed
	horizontal_velocity = horizontal_velocity.linear_interpolate(new_position, acceleration * delta)
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z
	velocity.y = 0
	velocity = move_and_slide(velocity)
	
func get_input_direction():
	return Vector3(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			0,
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	
	
func get_state(state_name):
	return get_node("States/" + state_name)
	
func has_state(state):
	return true if states.has(state) else false
	
func push_state(state):
	if has_state(state):
		return
	states.push_back(state)
	
func rotate_towards_direction(direction):
	look_at(global_transform.origin - direction, Vector3.UP)
