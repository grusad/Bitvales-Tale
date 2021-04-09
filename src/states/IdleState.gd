extends State

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = 0
	

func physics_process(delta):
	
	if parent.get_input_direction().length() > 0:
		if Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))	
		else:
			transition_to(parent.get_state("RunState"))
			
	if parent.is_attack_input_pressed():
		transition_to(parent.get_state("GreatSwordAttack"), {"key_event": latest_attack_event})
	
	if Input.is_action_just_pressed("roll"):
		transition_to(parent.get_state("RollState"))
	
	parent.apply_friction(10, delta)

