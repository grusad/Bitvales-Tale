extends State

const DEACCELERATION = 15


func enter_state(parent, previous_state):
	self.parent = parent
	self.previous_state = previous_state
	parent.animation_tree["parameters/state/current"] = 0
	
func exit_state():
	pass
	
func physics_process(delta):
	
	if parent.get_input_direction().length() > 0:
		if Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))	
		else:
			transition_to(parent.get_state("RunState"))
	if Input.is_action_just_pressed("default_attack"):
		transition_to(parent.get_state("DefaultAttackState"))	
	
	parent.apply_movement(parent.get_input_direction(), DEACCELERATION, 0, delta)
	
func process_unhandled_input(event):
	pass

