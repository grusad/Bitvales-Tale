extends Camera

onready var player = get_parent().get_node("PlayerCharacter")

func _process(delta):
	var offset = Vector3(0, 10, 10)
	global_transform.origin = player.global_transform.origin + offset
