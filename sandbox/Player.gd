extends KinematicBody

func _physics_process(delta):
	
	var move_dir = Vector3()
	
	if Input.is_action_pressed("ui_up"):
		move_dir.z = -1
	if Input.is_action_pressed("ui_down"):
		move_dir.z = 1
	if Input.is_action_pressed("ui_left"):
		move_dir.x = -1
	if Input.is_action_pressed("ui_right"):
		move_dir.x = 1
		
	move_dir = move_dir.normalized()
	
	move_and_slide(move_dir * 10)
