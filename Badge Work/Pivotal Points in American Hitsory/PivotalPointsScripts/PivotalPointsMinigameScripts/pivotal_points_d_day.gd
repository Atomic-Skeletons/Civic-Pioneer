extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	PivotalPointsGlobals._lose()
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.


func _on_correct_button_pressed() -> void:
	PivotalPointsGlobals._win()
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.


func _on_wrong_button_1_pressed() -> void:
	PivotalPointsGlobals._lose()
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.


func _on_wrong_button_2_pressed() -> void:
	PivotalPointsGlobals._lose()
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.
