class_name BadgeSelectButton
extends Button

@export_file_path("*.tscn") var scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)


func on_pressed():
	get_tree().change_scene_to_file(scene)
