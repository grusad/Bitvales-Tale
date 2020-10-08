extends KinematicBody

func _ready():
	$AnimationPlayer.play("idle")

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
	
	look_at(global_transform.origin + move_dir * -1, Vector3.UP)
	
	if move_dir.length() > 0 and $AnimationPlayer.current_animation != "run":
		$AnimationPlayer.play("run")
	if move_dir.length() == 0:
		$AnimationPlayer.play("idle")

		
	
	move_and_slide(move_dir * 10)
