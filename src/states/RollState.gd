extends Node

func enter_state(parent):
	self.parent = parent
	parent.animation_tree["parameters/roll/active"] = true
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	pass
