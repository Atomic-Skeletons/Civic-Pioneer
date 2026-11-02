extends Area2D

var draggable = false
var is_inside_dropable = false
var body_ref

var juice_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered():
	draggable = true
	juice_tween = Utilities.reset_tween(juice_tween, self)
	
