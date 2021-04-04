extends Camera

onready var player = get_parent().get_node("PlayerCharacter")

	
func _process(delta):
	var offset = Vector3(0, 20, 14)
	var target = player.global_transform.origin
	global_transform.origin = lerp(global_transform.origin, target + offset, 0.2)
	

	
	
	
