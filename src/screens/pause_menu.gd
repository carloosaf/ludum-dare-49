extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		_change_pause_state()
		$Panel/Text/Buttons/Resume.grab_focus()

func _change_pause_state() -> void:
		var new_pause_state := not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

func _on_Resume_button_down():
	print("a")
	_change_pause_state()


func _on_Restart_button_down():
	print("b")
	var filename = 	get_tree().current_scene.filename
	_change_pause_state()
	scene_manager.load_scene(filename, "fade")



func _on_Exit_button_down():
	print("c")
	_change_pause_state()
	scene_manager.load_scene("res://src/screens/main_menu/MainMenu.tscn", "fade")
