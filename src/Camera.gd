extends Camera

onready var player = get_parent().get_node("PlayerCharacter")



func _process(delta):
	var offset = Vector3(0, 13, 10)
	var target = player.global_transform.origin + offset
	global_transform.origin = lerp(global_transform.origin, target, 0.2)
	
	
