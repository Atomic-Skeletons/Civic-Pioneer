class_name CitizenController
extends CharacterBody2D

@export var citizen: Citizen
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@export var move_speed: float = 50
@onready var animation_player: AnimationPlayer = $"Wobble Pivot Point/AnimationPlayer"
var pathfinding = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	citizen.randomize_outfit()
	citizen.randomize_hat()
	
	set_new_random_position()
	#nav_agent.target_position = $"../Grocery Store".global_position

func _physics_process(_delta: float) -> void:
	if pathfinding:
		var dir = nav_agent.get_next_path_position() - global_position
		dir = dir.normalized()
		velocity = dir * move_speed
		move_and_slide()

func set_new_random_position():
	await get_tree().process_frame
	pathfinding = true
	animation_player.play("wobble")
	
	var map_rid: RID = nav_agent.get_navigation_map()
	
	# Parameters: (map_rid, navigation_layers_bitmask, uniformly)
	var random_pos: Vector2 = NavigationServer2D.map_get_random_point(map_rid, 1, false)
	
	nav_agent.target_position = random_pos

func _on_navigation_agent_2d_target_reached() -> void:
	animation_player.play("idle")
	pathfinding = false
	
	var wait_tween = create_tween()
	wait_tween.tween_interval(randf_range(5,15))
	wait_tween.tween_callback(set_new_random_position)
