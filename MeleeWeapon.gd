extends Area
class_name MeleeWeapon

onready var collision_shape = $CollisionShape

export (int) var force = 40

func _ready():
	self.connect("body_entered", self, "on_body_entered")

func enable_collision():
	collision_shape.disabled = false
	
func disable_collision():
	collision_shape.disabled = true

	
func on_body_entered(body):
	if body is KinematicEntity:
		var knockback_state = body.get_state("KnockbackState")
		if knockback_state:
			knockback_state.enter_state(body, null, {"position" : owner.global_transform.origin, "force" : self.force})
			body.push_state(knockback_state)

