class_name Draggable
extends Area2D

var draggable = false
var is_inside_dropable = false

var juice_tween: Tween

func _init() -> void:
	add_to_group("draggable")

func _ready() -> void:
	pass
	#mouse_entered.connect(_on_area_2d_mouse_entered)
	#mouse_exited.connect(_on_area_2d_mouse_exited)


func _on_area_2d_mouse_entered():
	draggable = true
	on_hover()

func _on_area_2d_mouse_exited():
	draggable = false
	on_unhover()


func on_hover():
	juice_tween = Utilities.reset_tween(juice_tween, self)
	juice_tween.tween_property(self, "scale", Vector2(1.05, 1.05), .2)

func on_unhover():
	juice_tween = Utilities.reset_tween(juice_tween, self)
	juice_tween.tween_property(self, "scale", Vector2(1, 1), .2)
