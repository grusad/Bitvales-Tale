extends State

const ACCELERATION = 10
const MAX_SPEED = 6

var current_direction = Vector3.ZERO
var movable = false

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = 17
	movable = true

func exit_state():
	parent.get_hand().disable_melee_weapon()
	
func physics_process(delta):
	current_direction = parent.get_input_direction()
	parent.rotate_towards_direction(current_direction)
	if movable:
		parent.apply_movement(parent.get_faced_direction(), ACCELERATION, 4, delta)
	else:
		parent.stop_movement()
		
	if Input.is_action_just_pressed("roll"):
		transition_to(parent.get_state("RollState"))
		
	if Input.is_action_just_released("default_attack"):
		transition_to(parent.get_state("IdleState"))

func apply_animation_force():
	parent.apply_force(current_direction, 10)
	pass

func on_animation_disable_movable():
	movable = false
	
func on_animation_enable_movable():
	movable = true
