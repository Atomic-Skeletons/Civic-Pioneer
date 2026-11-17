class_name Utilities extends Node


static func center_control(control_node: Control) -> void:
	control_node.pivot_offset_ratio = Vector2(0.5, 0.5)

static func clear_all_children(parent: Node) -> void:
	for child: Node in parent.get_children():
		child.queue_free()

static func reset_tween(tween: Tween, parent: Node) -> Tween:
	if tween and tween.is_valid():
		tween.kill()
	
	return parent.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)

static func get_project_files(path: String) -> PackedStringArray:
	# Returns all file names in the directory (subdirectories end with "/")
	var items: PackedStringArray = ResourceLoader.list_directory(path)
	var files: PackedStringArray = []
	
	for item in items:
		if not item.ends_with("/"):
			files.append(path.path_join(item))
			
	return files
