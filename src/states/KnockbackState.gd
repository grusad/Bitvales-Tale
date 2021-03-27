extends State


func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	var from_position = parameters.get("position")
	var parent_position = parent.global_transform.origin
	var direction = (parent_position - from_position).normalized()
	direction.y = 0
	var force = parameters.get("force")
	parent.apply_force(direction, force)
	
	
func post_add_event():
	parent.remove_state(self)
