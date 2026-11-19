extends Node2D
const CITIZEN = preload("uid://cyjvq0h24lvde")
@onready var spawn_point = %"New Person Spawn Point".global_position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left click"):
		var new_citizen = CITIZEN.instantiate()
		new_citizen.global_position = spawn_point
		add_child(new_citizen)
