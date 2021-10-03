extends Area2D

var empty := true

func _on_TowerSlot_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		_place_turret()


func _place_turret():
	var menu = get_node("../../GUI/TurretMenu")
	
	menu.visible = not menu.visible
	
	var path
	
	path = yield(get_node("../../GUI/TurretMenu"), "any_button_pressed")
	menu.visible = not menu.visible
	print(path)
	
	var cosa = load(path)
	var instance = cosa.instance()
	
	add_child(instance)
