class_name HouseController
extends Node2D

@onready var house_sprites: AnimatedSprite2D = $"House Sprites"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	house_sprites.frame = randi_range(0, house_sprites.sprite_frames.get_frame_count("random house")-1)
