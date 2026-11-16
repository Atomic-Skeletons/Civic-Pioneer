class_name Clickable
extends Area2D

var mouse_inside = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#can be rewritten in any nodes using this class
func clicked():
	print("I just got clicked")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left click") and mouse_inside:
		clicked()


func _on_area_2d_mouse_entered() -> void:
	print("test")
	mouse_inside = true


func _on_area_2d_mouse_exited() -> void:
	mouse_inside = false
