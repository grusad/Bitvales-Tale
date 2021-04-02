extends KinematicEntity

onready var animation_tree = $AnimationTree
onready var state_nodes = $States


func _ready():
	add_to_group("Player")
	var initial_state = get_state("IdleState")
	initial_state.enter_state(self, null)
	push_state(initial_state)

	
func get_input_direction():
	
	return Vector3(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			0,
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
		
func get_hand():
	return get_node("FemaleRider/Root/Skeleton/Hand")
		
 
