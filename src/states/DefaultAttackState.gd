extends State

const ACCELERATION = 10
const MAX_SPEED = 6

var current_animation_state
var can_advance_animations = false
var apply_movement = true

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	self.current_animation_state = 3

	parent.animation_tree["parameters/state/current"] = current_animation_state
	apply_movement = true

func exit_state():
	parent.get_hand().disable_melee_weapon()
	
func physics_process(delta):
	var current_direction = parent.get_input_direction()
	if can_advance_animations:
		if Input.is_action_pressed("default_attack"):
			parent.animation_tree["parameters/state/current"] = current_animation_state
			can_advance_animations = false
	parent.rotate_towards_direction(current_direction)
	parent.apply_movement(current_direction, ACCELERATION, MAX_SPEED, delta)
	
	if Input.is_action_just_pressed("roll"):
		transition_to(parent.get_state("RollState"))
		
	if Input.is_action_just_released("default_attack"):
		transition_to(parent.get_state("IdleState"))
		
func default_attack_finished():
	current_animation_state = 3
	transition_to(parent.get_state("IdleState"))
	
func can_advance_animations():
	
	apply_movement = false
	current_animation_state += 1
	if current_animation_state > 5:
		current_animation_state = 3
	can_advance_animations = true
