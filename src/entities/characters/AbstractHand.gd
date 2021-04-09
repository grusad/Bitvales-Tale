extends BoneAttachment
class_name AbstractHand

func _ready():
	disable_melee_weapon()

func has_equipped_weapon():
	if get_child_count():
		var item = get_child(0)
		return item is MeleeWeapon
	return false

func get_equipped_weapon():
	if has_equipped_weapon():
		return get_child(0)
	return null
	
func enable_melee_weapon():
	if has_equipped_weapon():
		get_equipped_weapon().enable_collision()
	
func disable_melee_weapon():
	if has_equipped_weapon():
		get_equipped_weapon().disable_collision()
