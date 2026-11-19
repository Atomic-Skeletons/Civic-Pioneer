class_name CitizenController
extends CharacterBody2D

@export var citizen: Citizen
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@export var move_speed: float = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	citizen.randomize_outfit()
	citizen.randomize_hat()
	nav_agent.target_position = $"../Grocery Store".global_position

func _physics_process(delta: float) -> void:
	var dir = nav_agent.get_next_path_position() - global_position
	dir = dir.normalized()
	velocity = dir * move_speed
	move_and_slide()
