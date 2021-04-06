extends RayCast

signal object_entered
signal object_exited

var collided_objects = []
var exited_objects = []
var entered_objects = []

func _process(delta):
	var collided_objects_frame = []
	exited_objects = []
	entered_objects = []
	
	while is_colliding():
		var collider = get_collider()
		
		collided_objects_frame.push_back(collider)
		
		if not (collider in collided_objects):
			entered_objects.append(collider)
			collided_objects.append(collider)
		add_exception(collider)
		force_raycast_update()
	
	for collider in collided_objects_frame:
		remove_exception(collider)
		
	for item in collided_objects:
		if not (item in collided_objects_frame):
			exited_objects.push_back(item)
			collided_objects.erase(item)
	

	if not exited_objects.empty():
		emit_signal("object_exited", exited_objects)
	
	if not entered_objects.empty():
		emit_signal("object_entered", entered_objects)

	
