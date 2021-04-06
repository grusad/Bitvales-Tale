extends Node
#Place direct under root parent

onready var mesh_instance = get_parent().get_node("MeshInstance")

var temporary_material_placeholder = null
var tween : Tween = null

func _ready():
	
	
	tween = Tween.new()
	tween.connect("tween_completed", self, "on_tween_complete")
	add_child(tween)

func on_tween_complete(object, key):
	var material = mesh_instance.get_surface_material(0)
	if material is ShaderMaterial:
		if material.get_shader_param("albedo").a == 1:
			mesh_instance.set_surface_material(0, temporary_material_placeholder)
			temporary_material_placeholder = null

func fade_in():
	var material = mesh_instance.get_surface_material(0)
	if material is ShaderMaterial:
		
		tween.interpolate_property(material, "shader_param/albedo:a", material.get_shader_param("alpha"), 1.0, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
	
func fade_out():
	temporary_material_placeholder = mesh_instance.get_surface_material(0)
	var material : Material = temporary_material_placeholder.duplicate()
	mesh_instance.set_surface_material(0, material)
	
	if material is ShaderMaterial:
		tween.interpolate_property(material, "shader_param/albedo:a", 1.0, 0.6, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
	
	
	
	
	
