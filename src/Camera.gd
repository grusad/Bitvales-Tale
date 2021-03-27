extends Camera

onready var player = get_parent().get_node("PlayerCharacter")

func _process(delta):
	var offset = Vector3(0, 20, 20)
	global_transform.origin = player.global_transform.origin + offset
	
