extends Spatial

onready var player = get_parent().get_node("PlayerCharacter")
onready var ray_cast = $RayCast

func _ready():
	ray_cast.connect("object_entered", self, "on_entered_ray_cast")
	ray_cast.connect("object_exited", self, "on_exited_ray_cast")

func _process(delta):
	var offset = Vector3(0, 20, 14)
	var target = player.global_transform.origin
	global_transform.origin = lerp(global_transform.origin, target + offset, 0.2)
	
	ray_cast.cast_to = (target + Vector3(0, 1.5, 0)) - global_transform.origin

func on_entered_ray_cast(objects):
	for item in objects:
		if item.has_node("Fadable"):
			item.get_node("Fadable").fade_out()

func on_exited_ray_cast(objects):
	for item in objects:
		if item.has_node("Fadable"):
			item.get_node("Fadable").fade_in()
