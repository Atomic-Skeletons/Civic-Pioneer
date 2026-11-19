extends Node2D

@onready var judge_talk = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_3_pressed() -> void:
	PivotalPointsGlobals._win()
	judge_talk.text = "You are free to go."
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	PivotalPointsGlobals._lose()
	judge_talk.text = "Guilty."
	get_tree().change_scene_to_packed(PivotalPointsGlobals.INTERMISSION_SCREEN)
	pass # Replace with function body.
