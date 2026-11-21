extends Control


@onready var margin_container: MarginContainer = $"../MarginContainer"
@onready var margin_container_offset = Vector2(0,-600)
var margin_container_tween: Tween

var ballot_down = false

func _ready() -> void:
	margin_container.offset_transform_position = margin_container_offset

func _on_toggle_ballot_pressed(_ballot: BallotChoice = null) -> void:
	margin_container_tween = Utilities.reset_tween(margin_container_tween, self)
	
	ballot_down = !ballot_down
	if ballot_down:
		margin_container_tween.tween_property(margin_container, "offset_transform_position", Vector2.ZERO, .2)
	else:
		margin_container_tween.tween_property(margin_container, "offset_transform_position", margin_container_offset, .2)
