tool
extends AnimationPlayer

#Add this script to an animation player and execute the script

export (bool) var fix_z_location = false setget execute_z_fix
		
func execute_z_fix(value):
	for anim_name in get_animation_list():
		var animation : Animation = get_animation(anim_name)
		var track_index = animation.find_track("Root")
		for key_index in animation.track_get_key_count(track_index):
			var key_value : Dictionary = animation.track_get_key_value(track_index, key_index)
			var location = key_value.get("location")
			location.z = 100
			key_value["location"] = location
			animation.track_set_key_value(track_index, key_index, key_value)
