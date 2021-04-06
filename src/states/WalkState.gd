extends State

const ACCELERATION = 10
const WALK_SPEED = 6


func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = 2
	
func physics_process(delta):

	var movement_direction : Vector3 = parent.get_input_direction()
	if movement_direction.length() == 0:
		transition_to(parent.get_state("IdleState"))
	elif Input.is_action_just_released("walk"):
		transition_to(parent.get_state("RunState"))
	elif Input.is_action_pressed("roll"):
		transition_to(parent.get_state("RollState"))
	else:
		parent.apply_movement(movement_direction, ACCELERATION, WALK_SPEED, delta)
		parent.look_at(parent.global_transform.origin - movement_direction, Vector3.UP)
