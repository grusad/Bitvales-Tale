extends TextEdit

func _ready():
	connect("gui_input", self, "on_gui_input")
	
	
func fire_command():
	text = text.strip_edges()
	match text:
		"test": print("test")
	
	text = ""
	
func on_gui_input(input):
	if input is InputEventKey and input.is_pressed():
		if input.scancode == KEY_ENTER:
			fire_command()	
			visible = false
