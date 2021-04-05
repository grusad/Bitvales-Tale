extends Node
#Place direct under root parent

export (NodePath) var mesh_instance = null

var temporary_material_placeholder = null

func _ready():
	mesh_instance = get_node(mesh_instance)
	
	var tween = Tween.new()
	tween.connect("tween_completed", self, "on_tween_completed")
	add_child(tween)
	
	print(mesh_instance.get_surface_material(0))
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		fade_out()
	if Input.is_action_just_pressed("ui_down"):
		fade_in()	

func on_tween_completed():
	pass
	
func fade_in():
	
	mesh_instance.set_surface_material(0, temporary_material_placeholder)
	temporary_material_placeholder = null
	
func fade_out():
	temporary_material_placeholder = mesh_instance.get_surface_material(0)
	var material : Material = temporary_material_placeholder.duplicate()
	mesh_instance.set_surface_material(0, material)
	
	if material is ShaderMaterial:
		material.set_shader_param("alhpa", 0.5)
		
	
	
	
	
