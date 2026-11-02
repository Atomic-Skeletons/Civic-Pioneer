extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	# 1. Create a visual preview that follows the mouse
	var preview = TextureRect.new()
	preview.texture = texture
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.size = Vector2(48, 48)
	set_drag_preview(preview)
	
	# 2. Return the data you want to pass over
	return { "item_name": "newspaper", "quantity": 1 }
