extends State

const ACCELERATION = 100
const ROLL_SPEED = 20

var movement_direction : Vector3

func enter_state(parent, previous_state):
	self.parent = parent
	self.previous_state = previous_state
	parent.animation_tree["parameters/roll/active"] = true
	movement_direction = parent.get_input_direction()
	parent.rotate_towards_direction(movement_direction)
	
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	parent.apply_movement(movement_direction, ACCELERATION, ROLL_SPEED, delta)
	
func roll_animation_finished():
	transition_to(parent.get_state("IdleState"))
	

