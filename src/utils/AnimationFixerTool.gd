tool
extends AnimationPlayer

export (bool) var execute_z_fix = false setget execute_z_fix

func execute_z_fix(value):
	print("AnimationFixerTool: Setting z on root to 0")
	for animation_name in get_animation_list():
		print("Fixing ", animation_name)
		var animation = get_animation(animation_name)
		var track_index = animation.find_track("Root")
		for key_index in animation.track_get_key_count(track_index):
			var key_value = animation.track_get_key_value(track_index, key_index)
			var location = key_value.get("location")
			location.z = 0
			key_value["location"] = location
			animation.track_set_key_value(track_index, key_index, key_value)
		
	print("AnimationFixerTool: Done")		
	
