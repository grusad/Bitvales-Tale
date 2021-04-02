extends State

const ACCELERATION = 10
const WALK_SPEED = 15

func enter_state(parent, previous_state, parameters = {}):
	.enter_state(parent, previous_state, parameters)
	parent.animation_tree["parameters/state/current"] = 2
	parent.collision_shape.translation.z = 0.67
	parent.collision_shape.rotation_degrees.x = 22
	
func exit_state():
	parent.collision_shape.translation.z = 0
	parent.collision_shape.rotation_degrees.x = 0
	
func physics_process(delta):
	var movement_direction : Vector3 = parent.get_input_direction()
	if movement_direction.length() == 0:
		transition_to(parent.get_state("IdleState"))
	else:
		if Input.is_action_just_pressed("roll"):
			transition_to(parent.get_state("RollState"))
		if Input.is_action_pressed("walk"):
			transition_to(parent.get_state("WalkState"))
		if Input.is_action_pressed("default_attack"):
			transition_to(parent.get_state("DefaultAttackState"))
		
		parent.apply_movement(movement_direction, ACCELERATION, WALK_SPEED, delta)
		parent.look_at(parent.global_transform.origin - movement_direction, Vector3.UP)
		
