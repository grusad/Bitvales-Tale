extends State

const ACCELERATION = 10
const WALK_SPEED = 15


func enter_state(parent):
	self.parent = parent
	parent.animation_tree["parameters/movement/current"] = 2
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	var movement_direction : Vector3 = parent.get_input_direction()
	if movement_direction.length() == 0:
		transition_to(parent.get_state("IdleState"))
	elif Input.is_action_pressed("walk"):
		transition_to(parent.get_state("WalkState"))
	else:
		parent.apply_movement(movement_direction, ACCELERATION, WALK_SPEED, delta)
		parent.look_at(parent.global_transform.origin - movement_direction, Vector3.UP)
