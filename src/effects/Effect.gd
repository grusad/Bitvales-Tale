extends Node
class_name Effect

var parent
var parameters = {}

func enter_effect(parent, parameters):
	self.parent = parent
	self.parameters = parameters

func process_effect(delta):
	pass
	
func exit_effect():
	pass
