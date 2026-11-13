@tool # @tool allows to run code in editor
class_name BadgeSelectButton
extends Button

# scene filepath to badge game scene
@export_file_path("*.tscn") var scene


func _ready() -> void:
	# connects the button's pressed signal with the
	# function to switch to the game scene
	pressed.connect(on_pressed)


func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		## Code to execute in editor.
		# if there is no scene connected disable the button
		if not scene:
			disabled = true
		else:
			disabled = false
	
	if not Engine.is_editor_hint():
		## Code to execute in game.
		pass


func on_pressed():
	# go to target scene when clicked
	get_tree().change_scene_to_file(scene)
