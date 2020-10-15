extends State

#the index of animations in the animation tree

var current_animation_state = 3
var can_advance_animations = false

func enter_state(parent, previous_state):
	self.parent = parent
	self.previous_state = previous_state
	parent.animation_tree["parameters/state/current"] = current_animation_state
	
func exit_state():
	pass

func process_unhandled_input(event):
	pass
	
func physics_process(delta):
	if can_advance_animations:
		if Input.is_action_just_pressed("default_attack"):
			parent.animation_tree["parameters/state/current"] = current_animation_state
			can_advance_animations = false
		
func default_attack_finished():
	current_animation_state = 3
	transition_to(previous_state)
	
func can_advance_animations():
	current_animation_state += 1
	if current_animation_state > 5:
		current_animation_state = 3
	can_advance_animations = true
