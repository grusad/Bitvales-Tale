extends Node
class_name State

var parent = null

func enter_state(parent):
	pass
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	pass

func transition_to(new_state):
	exit_state()
	new_state.enter_state(parent)
	parent.set_state(new_state)


