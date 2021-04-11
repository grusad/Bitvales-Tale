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
			
	if Input.is_action_pressed("attack_01"):
		transition_to(parent.get_state("GreatSwordSlash"))
	
	if Input.is_action_pressed("attack_02"):
		transition_to(parent.get_state("GreatSwordHigh"))
	
	if Input.is_action_pressed("attack_03"):
		transition_to(parent.get_state("GreatSwordJump"))
	
	if Input.is_action_just_pressed("roll"):
		transition_to(parent.get_state("RollState"))
	
	parent.apply_friction(10, delta)

