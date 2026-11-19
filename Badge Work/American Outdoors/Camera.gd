extends Camera2D

var MaxZoomX = 5.0
var MaxZoomY = 5.0
var MinZoomX = 1.0
var MinZoomY = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			print("testup")
			if zoom.x < MaxZoomX and zoom.y < MaxZoomY:
				zoom.x += .03; zoom.y += .03
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			print("testdown")
			if zoom.x > MinZoomX and zoom.y > MinZoomY:
				zoom.x -= .03; zoom.y -= .03
