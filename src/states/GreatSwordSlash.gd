extends AttackState

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = Animations.Player.GREATSWORD_SLASH

	
func physics_process(delta):
	.physics_process(delta)
	
	if Input.is_action_just_pressed("attack_02"):
		transition_to(parent.get_state("GreatSwordHigh"))
		
	if Input.is_action_just_pressed("attack_03"):
		transition_to(parent.get_state("GreatSwordJump"))
	
	if Input.is_action_just_released("attack_01"):
		transition_to(parent.get_state("IdleState"))
		
		
		
		
