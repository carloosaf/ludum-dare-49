extends Area2D

var empty := true

func _on_TowerSlot_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		_place_turret()


func _place_turret():
	var menu = get_node("../../GUI/TurretMenu")
	menu.visible = not menu.visible
	var path = yield(menu, "any_button_pressed")
	menu.visible = not menu.visible
	
	var loaded = load(path)
	var instance = loaded.instance()
	instance.add_to_group("turret")
	
	var children = get_children()
	for child in children:
		if child.is_in_group("turret"):
			child.queue_free()
	add_child(instance)
