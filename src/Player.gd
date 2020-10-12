extends KinematicBody
class_name Player

onready var animation_tree = $AnimationTree

const ACCELERATION = 10.0
const DEACCELERATION = 15.0
const MAX_MOVEMENT_SPEED = 15

var velocity = Vector3()
var state = null

func _ready():
	state = get_state("IdleState")
	state.enter_state(self)
	

func _physics_process(delta):
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
		
func set_state(new_state):
	state = new_state
	
func get_state(state_name):
	return get_node("States/" + state_name)
	
