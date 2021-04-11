extends KinematicEntity

onready var animation_tree = $Character/AnimationTree
onready var collision_shape = $CollisionShape


func _ready():
	add_to_group("Player")
	var initial_state = get_state("IdleState")
	initial_state.enter_state(self, null)
	push_state(initial_state)

func _unhandled_key_input(event):
	for state in states:
		state.process_unhandled_input(event)
		
func get_input_direction():
	
	return Vector3(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			0,
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()

func is_attack_input_pressed():
	
	
	
	
