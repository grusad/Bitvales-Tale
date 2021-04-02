extends Spatial

onready var area = $Area
onready var tween = $Tween
onready var pivot = $Pivot

signal open
signal close

var bodies_inside_count = 0
var toggle_time = 0.5

func _ready():
	add_to_group("Door")
	area.connect("body_entered", self, "on_body_entered")
	area.connect("body_exited", self, "on_body_exited")
	
	
	
func on_body_entered(body):
	bodies_inside_count += 1
	open()
	emit_signal("open", body)
	
func on_body_exited(body):
	bodies_inside_count -= 1
	if bodies_inside_count == 0:
		close()
	emit_signal("close", body)
	
func open():
	tween.interpolate_property(pivot, "rotation_degrees:y", pivot.rotation_degrees.y, 90, toggle_time, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	
	
func close():
	tween.interpolate_property(pivot, "rotation_degrees:y", pivot.rotation_degrees.y, 0, toggle_time, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
		
