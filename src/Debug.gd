extends Control

onready var command_line = $CommandLine
onready var performance_panel = $PanelContainer/PerformancePanel

func _process(delta):
	performance_panel.get_node("FPS").text = "FPS: " + str(Engine.get_frames_per_second())
	performance_panel.get_node("DrawCalls").text = "Draw Calls: " + str(Performance.get_monitor(Performance.RENDER_DRAW_CALLS_IN_FRAME))
	performance_panel.get_node("TimeProcess").text = "Time frame: " + str(Performance.get_monitor(Performance.TIME_PROCESS))
	performance_panel.get_node("TimePhysicsProcess").text = "Physics frame: " + str(Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS))
	performance_panel.get_node("MaterialChanges").text = "Material Changes: " + str(Performance.get_monitor(Performance.RENDER_MATERIAL_CHANGES_IN_FRAME))
	

func _input(event):
	if event is InputEventKey:
		if event.is_pressed():
			if event.scancode == KEY_Y:
				command_line.visible = true
				command_line.grab_focus()
				
