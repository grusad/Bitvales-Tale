extends State

const ACCELERATION = 10
const WALK_SPEED = 15

func enter_state(parent, previous_state):
	self.parent = parent
	self.previous_state = previous_state
	parent.animation_tree["parameters/state/current"] = 2
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	var movement_direction : Vector3 = parent.get_input_direction()
	if movement_direction.length() == 0:
		transition_to(parent.get_state("IdleState"))
	else:
		if Input.is_action_just_pressed("roll"):
			transition_to(parent.get_state("RollState"))
		if Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))
		if Input.is_action_just_pressed("default_attack"):
			transition_to(parent.get_state("DefaultAttackState"))
		
		parent.apply_movement(movement_direction, ACCELERATION, WALK_SPEED, delta)
		parent.look_at(parent.global_transform.origin - movement_direction, Vector3.UP)
		
