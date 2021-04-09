extends Spatial

onready var detectors = $Detectors
onready var roof = $Roof

func _ready():
	for area in detectors.get_children():
		area.connect("body_entered", self, "on_body_entered")
		area.connect("body_exited", self, "on_body_exited")
		
func on_body_exited(body):
	if body.is_in_group("Player"):
		roof.cast_shadow = GeometryInstance.SHADOW_CASTING_SETTING_ON
		
func on_body_entered(body):
	if body.is_in_group("Player"):
		roof.cast_shadow = GeometryInstance.SHADOW_CASTING_SETTING_SHADOWS_ONLY
