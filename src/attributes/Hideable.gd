extends Node

export (NodePath) var mesh_instance_path = null

var mesh_instance = null

func _ready():
	print(mesh_instance_path)
	if mesh_instance_path:
		mesh_instance = get_node_or_null(mesh_instance_path)	

func show():
	
	if mesh_instance == null:
		assert("No nodepath provided")
	else:
		mesh_instance.cast_shadow = GeometryInstance.SHADOW_CASTING_SETTING_ON
		mesh_instance.visible = true
		
func hide():
	
	if mesh_instance == null:
		assert("No nodepath provided")
	else:
		mesh_instance.cast_shadow = GeometryInstance.SHADOW_CASTING_SETTING_SHADOWS_ONLY
		mesh_instance.visible = false
