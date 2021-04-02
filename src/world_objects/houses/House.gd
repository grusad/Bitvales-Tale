extends Spatial

func _ready():
	connect_doors_recursive(self)

func on_door_open(body):
	if body.is_in_group("Player"):
		get_node("Roof").visible = false
		
func on_door_close(body):
	print("left")
	if body.is_in_group("Player"):
		get_node("Roof").visible = true


func connect_doors_recursive(parent):
	for node in parent.get_children():
		if node.get_child_count() > 0:
			if node.is_in_group("Door"):
				connect_doors(node)
			connect_doors_recursive(node)
		else:
			if node.is_in_group("Door"):
				connect_doors(node)
			
func connect_doors(door):
	door.connect("open", self, "on_door_open")
	door.connect("close", self, "on_door_close")
