class_name Clickable
extends Area2D

var mouse_inside = false
const TRASH = preload("uid://d2g3f5yo38kj2")

@export_category("Trash")
@export var has_trash = false
@export var trash_num = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#can be rewritten in any nodes using this class
func clicked():
	if has_trash:
		if trash_num > 0:
			var trash = TRASH.instantiate()
			add_sibling(trash)
			trash.global_position = global_position
			trash.scale.x = .2
			trash.scale.y = .2
			trash_num-=1
		else:has_trash = false
	print("I just got clicked")
	
func check_mouse_inside() -> bool:
	var target_position := get_global_mouse_position()
	# 1. Get the direct 2D world physics space state
	var space_state := get_world_2d().direct_space_state
	
	# 2. Configure the point query parameters
	var query := PhysicsPointQueryParameters2D.new()
	query.position = target_position
	
	# Optional configurations:
	# query.collision_mask = 1       # Query specific collision layers
	query.collide_with_areas = true # Include Area2D nodes (default is false)
	# query.collide_with_bodies = true # Include Physics bodies (default is true)
	
	# 3. Fetch all intersections (returns an array of Dictionaries, up to 32 by default)
	var results := space_state.intersect_point(query)
	
	# 4. Extract the object references from the dictionaries
	for result in results:
		if result.collider == self: return true
	
	return false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_inside = check_mouse_inside()
	if Input.is_action_just_pressed("left click") and mouse_inside:
		clicked()
