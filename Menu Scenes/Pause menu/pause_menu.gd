extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if get_tree().current_scene.scene_file_path == "res://Menu Scenes/Main Menu/Main Menu.tscn":
			return
		if get_tree().paused:
			resume_game()
		else:
			pause_game()

	get_viewport().set_input_as_handled()

func pause_game():
	get_tree().paused = true
	show()

func resume_game():
	get_tree().paused = false
	hide()

func _on_resume_button_pressed():
	resume_game()

func _on_restart_button_pressed():
	resume_game()
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed():
	resume_game()
	get_tree().change_scene_to_file("res://Menu Scenes/Main Menu/Main Menu.tscn")
