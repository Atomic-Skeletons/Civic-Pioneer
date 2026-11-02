extends Marker2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	
	print(get_top_object_at_mouse_position())

func get_top_object_at_mouse_position():
	var target_position := global_position
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
		if not top_object:
			top_object = result.collider
		else:
			top_object = get_top_node(top_object, result.collider)
	
	return top_object

func get_top_node(node1: Node2D, node2: Node2D) -> Node2D:
	if node1.z_index < node2.z_index:
		return node1
	return node2
