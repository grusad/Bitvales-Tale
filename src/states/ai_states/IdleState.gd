extends State

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)

func physics_process(delta):
	parent.apply_friction(10, delta)
