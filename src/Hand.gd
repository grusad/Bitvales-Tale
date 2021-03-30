extends BoneAttachment

onready var equipped_weapon : MeleeWeapon = get_child(0)

func _ready():
	disable_melee_weapon()

func enable_melee_weapon():
	if equipped_weapon:
		equipped_weapon.enable_collision()
	
func disable_melee_weapon():
	if equipped_weapon:
		equipped_weapon.disable_collision()
