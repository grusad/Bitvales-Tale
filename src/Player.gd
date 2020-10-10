extends KinematicBody

const ACCELERATION = 10.0
const DEACCELERATION = 15.0
const MAX_MOVEMENT_SPEED = 15

onready var animation_tree = $AnimationTree

var velocity = Vector3()

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
	if Input.is_action_just_pressed("default_attack"):
		animation_tree["parameters/punch/active"] = true
		
	move_dir = move_dir.normalized()
	
	if move_dir.length() > 0:
		look_at(global_transform.origin + move_dir * -1, Vector3.UP)
	
	var horizontal_velocity = velocity
	horizontal_velocity.y = 0
	var new_position = move_dir * MAX_MOVEMENT_SPEED
	var acceleration = DEACCELERATION
	
	horizontal_velocity = horizontal_velocity.linear_interpolate(new_position, acceleration * delta)
	
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z
	velocity.y = 0;
	velocity = move_and_slide(velocity)
	
	#lerp animations
	var speed = horizontal_velocity.length() / MAX_MOVEMENT_SPEED
	animation_tree["parameters/idle_move/blend_amount"] = speed
	
