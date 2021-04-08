extends KinematicEntity

onready var vision = $Vision

func _ready():
	
	vision.connect("body_entered", self, "on_body_enetered")
	
	var initial_state = get_state("IdleState")
	initial_state.enter_state(self, null)
	push_state(initial_state)

func on_body_enetered(body):

	if has_state("FollowState"):
		return
	var follow_state = get_state("FollowState")
	follow_state.enter_state(self, null, {"target": body})
	force_set_state(follow_state)
