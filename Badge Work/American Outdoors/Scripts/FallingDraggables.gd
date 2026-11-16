extends Draggable

var fall_speed = 9
var hit_ground = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_overlapping_areas():
		var area_list = get_overlapping_areas()
		for area in area_list:
			if area.is_in_group("Ground"):
				hit_ground = true
	if !hit_ground: position.y+= fall_speed
