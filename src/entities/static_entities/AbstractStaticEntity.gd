extends StaticBody
class_name AbstractStaticEntity

func has_attribute(name):
	return has_node("Attributes/" + name)

func get_attribute(name):
	return get_node_or_null("Attributes/" + name)
