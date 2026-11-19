extends Node2D

var MaxZoomX = 5.0
var MaxZoomY = 5.0
var MinZoomX = 1.0
var MinZoomY = 1.0

@onready var camera: Camera2D = $Camera2D

func set_zoom(delta: Vector2) -> void:
	var mouse_pos := get_global_mouse_position()
	camera.zoom += delta
	var new_mouse_pos := get_global_mouse_position()
	camera.position += mouse_pos - new_mouse_pos
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			print("testup")
			if camera.zoom.x < MaxZoomX and camera.zoom.y < MaxZoomY:
				set_zoom(Vector2(.03,.03))
				#camera.zoom.x += .03; camera.zoom.y += .03
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			print("testdown")
			if camera.zoom.x > MinZoomX and camera.zoom.y > MinZoomY:
				set_zoom(Vector2(-.03,-.03))
				#camera.zoom.x -= .03; camera.zoom.y -= .03
