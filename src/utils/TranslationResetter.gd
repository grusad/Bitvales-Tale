extends Node


func _ready():
	var animation_player : AnimationPlayer = null
	var anim_list = animation_player.get_animation_list()
	for item in anim_list:
		var animation : Animation = animation_player.get_animation(item)
		var track_count = animation.get_track_count()
		
		animation.set

