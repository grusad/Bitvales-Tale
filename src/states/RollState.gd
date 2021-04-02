extends State

const ACCELERATION = 100
const ROLL_SPEED = 20

var movement_direction : Vector3

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = 4
	movement_direction = parent.get_input_direction()
	parent.rotate_towards_direction(movement_direction)

	
func physics_process(delta):
	parent.apply_movement(parent.get_faced_direction(), ACCELERATION, ROLL_SPEED, delta)
	
func roll_animation_finished():
	transition_to(parent.get_state("IdleState"))
	

