extends State

const ACCELERATION = 10
const ROLL_SPEED = 60

var player_busy = false
var movement_direction : Vector3

func enter_state(parent):
	self.parent = parent
	parent.animation_tree["parameters/roll/active"] = true
	player_busy = true
	movement_direction = parent.get_input_direction()
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	if not player_busy:
		movement_direction = parent.get_input_direction()
		if movement_direction.length() == 0:
			transition_to(parent.get_state("IdleState"))
		elif Input.is_action_pressed("roll"):
			transition_to(parent.get_state("RollState"))
		elif Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))
		else:
			transition_to(parent.get_state("RunState"))
	parent.apply_movement(movement_direction, ACCELERATION, ROLL_SPEED, delta)
	parent.look_at(parent.global_transform.origin - movement_direction, Vector3.UP)

func roll_animation_finished():
	player_busy = false
