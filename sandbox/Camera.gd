extends Camera

onready var player = get_parent().get_node("Player")

func _process(delta):
	var offset = Vector3(0, 7, 7)
	global_transform.origin = player.global_transform.origin + offset
