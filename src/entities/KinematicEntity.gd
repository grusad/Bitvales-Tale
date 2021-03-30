extends KinematicBody
class_name KinematicEntity

var velocity = Vector3()
var states = []

func _physics_process(delta):
	for state in states:
		state.physics_process(delta)
		state.process_unhandled_input(delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)

func apply_movement(movement_direction, acceleration, max_speed, delta):
	velocity = lerp(velocity, movement_direction * max_speed, acceleration * delta)
	
func apply_force(direction, force):
	velocity = direction * force
	
func apply_friction(friction, delta):
	velocity = lerp(velocity, Vector3.ZERO, friction * delta)
	
func stop_movement():
	velocity = Vector3.ZERO

func get_state(state_name):
	return get_node_or_null("States/" + state_name)
	
func has_state(state):
	if typeof(state) == TYPE_STRING:
		return states.has(get_state(state))
	return states.has(state)
	
func push_state(state):
	if has_state(state):
		return
	states.push_back(state)
	state.post_add_event()
	
func force_set_state(new_state):
	for state in states:
		state.exit_state()
	states.clear()
	push_state(new_state)
	

func remove_state(state):
	states.erase(state)
	
	
	
func rotate_towards_direction(direction):
	if direction == Vector3.ZERO:
		return
	look_at(global_transform.origin - direction, Vector3.UP)
