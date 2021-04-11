extends Node
class_name State

var parent : KinematicEntity = null
var previous_state = null
var parameters = {}

func enter_state(parent, previous_state, parameters = {}):
	self.parent = parent
	self.previous_state = previous_state
	self.parameters = parameters

	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	pass

func transition_to(new_state, parameters = {}):
	exit_state()
	new_state.enter_state(parent, self, parameters)
	parent.remove_state(self)
	parent.push_state(new_state)

func post_add_event():
	pass
