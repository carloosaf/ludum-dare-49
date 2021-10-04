extends Area2D

signal damaged_reactor

var unstability := 0.0
var turrets

func _process(delta):
	turrets = get_tree().get_nodes_in_group("turrets")
	for turret in turrets:
		if turret.is_physics_processing():
			unstability += 0.05
	unstability -= 0.035
	
	if unstability >= 100:
		var filename = 	get_tree().current_scene.filename
		scene_manager.load_scene(filename, "fade")


func _on_Reactor_body_entered(body):
	if body.is_in_group("enemies"):
		unstability += body.get_parent().damage
		emit_signal("damaged_reactor")
		body.queue_free()
