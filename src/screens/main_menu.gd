extends Control




func _on_Exit_button_down():
	get_tree().quit()


func _on_Play_button_down():
	scene_manager.load_scene("res://src/levels/testlvl/test_level.tscn", "fade")
