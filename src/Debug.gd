extends Control

onready var command_line = $CommandLine

func _input(event):
	if event is InputEventKey:
		if event.is_pressed():
			if event.scancode == KEY_Y:
				command_line.visible = true
				command_line.grab_focus()
				
