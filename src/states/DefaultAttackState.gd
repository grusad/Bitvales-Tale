extends State

func enter_state(parent, previous_state):
	self.parent = parent
	self.previous_state = previous_state
	parent.animation_tree["parameters/default_attack/active"] = true
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	pass
		
func default_attack_finished():
	transition_to(previous_state)
	
