extends State

const DEACCELERATION = 15


func enter_state(parent):
	self.parent = parent
	parent.animation_tree["parameters/movement/current"] = 0
	
func exit_state():
	pass
	
func physics_process(delta):
	parent.apply_movement(parent.get_input_direction(), DEACCELERATION, 0, delta)
	
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))
		else:
			transition_to(parent.get_state("RunState"))
		
	
	
	
func process_unhandled_input(event):
	pass
