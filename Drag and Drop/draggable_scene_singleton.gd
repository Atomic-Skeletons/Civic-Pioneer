class_name DraggingController
extends Node2D

# A static reference that other nodes in this scene can access
var dragging := false
var z_counter = 0
var dragging_body: Draggable
var hovering_body: Draggable

var prev_mouse_pos: Vector2

func _ready() -> void:
	for draggable: Draggable in get_tree().get_nodes_in_group("draggable"):
		draggable.z_index = z_counter
		z_counter += 1

func _process(delta: float) -> void:
	if not dragging:
		uptdate_hovering_body()
		if Input.is_action_just_pressed("drag"):
			if hovering_body:
				dragging = true
				dragging_body = hovering_body
				hovering_body = null
	else:
		if Input.is_action_just_released("drag"):
			dragging = false
			dragging_body = null
		else:
			var dir = get_global_mouse_position() - prev_mouse_pos
			dragging_body.global_position += dir
	
	prev_mouse_pos = get_global_mouse_position()

## whenever the mouse enters or exits an area 2d node
## recalculate what area 2d is the top most one 
func uptdate_hovering_body():
	var new_hovering_body := get_top_draggable_at_mouse_position()
	if new_hovering_body != hovering_body:
		if new_hovering_body:
			new_hovering_body.on_hover()
		if hovering_body:
			hovering_body.on_unhover()
	hovering_body = new_hovering_body
	

func get_top_draggable_at_mouse_position() -> Draggable:
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
	var top_object: CollisionObject2D = null
	for result in results:
		var object: CollisionObject2D = result.collider
		if object.is_in_group("draggable"):
			if not top_object:
				top_object = result.collider
			else:
				top_object = get_top_node(top_object, result.collider)
	
	return top_object

func get_top_node(node1: Node2D, node2: Node2D) -> Node2D:
	if node1.z_index > node2.z_index:
		return node1
	return node2
