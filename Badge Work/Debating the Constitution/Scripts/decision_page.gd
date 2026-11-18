extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#Red button
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Badge Work/Debating the Constitution/Scenes/Amendment Selection.tscn")
	# Put code here for saving what choice they made

#Green button
func _on_green_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Badge Work/Debating the Constitution/Scenes/Amendment Selection.tscn")
	Global.decision = 1
