extends State

const ACCELERATION = 10
const MAX_SPEED = 6

var current_direction = Vector3.ZERO
var movable = false
var action_input = ""

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	
	var type = Animations.Player.GREATSWORD_SLASH
	
	if parameters.has("key_event"):
		var event = parameters.get("key_event")
		action_input = get_input_action(event)
		match action_input:
			"attack_01": 
				type = Animations.Player.GREATSWORD_SLASH
			"attack_02":
				type = Animations.Player.GREATSWORD_HIGH_ATTACK
			"attack_03":
				type = Animations.Player.GREATSWORD_JUMP_ATTACK
	
	parent.animation_tree["parameters/state/current"] = type
	movable = true

func exit_state():
	parent.get_hand_right().disable_melee_weapon()
	
func physics_process(delta):
	current_direction = parent.get_input_direction()
	parent.rotate_towards_direction(current_direction)
	if movable:
		parent.apply_movement(parent.get_faced_direction(), ACCELERATION, 4, delta)
	else:
		parent.stop_movement()
		
	if Input.is_action_just_pressed("roll"):
		transition_to(parent.get_state("RollState"))
	
	if Input.is_action_just_released(action_input):
		transition_to(parent.get_state("IdleState"))

func apply_animation_force():
	parent.apply_force(current_direction, 10)
	pass

func on_animation_disable_movable():
	movable = false
	
func on_animation_enable_movable():
	movable = true
	
func get_input_action(event):
	for action in InputMap.get_actions():
		if InputMap.event_is_action(event, action):
			return action
			
		
		
		
		
		
