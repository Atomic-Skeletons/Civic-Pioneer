class_name CitizenController
extends CharacterBody2D

@onready var citizen: Citizen = $Citizen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	citizen.randomize_outfit()
	citizen.randomize_hat()


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
