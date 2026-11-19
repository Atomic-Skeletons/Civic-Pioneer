class_name PivotalPointsGlobals
extends Node

static var health = 4
static var score = 0
static var minigame_scenes: Array[PackedScene]
static var INTERMISSION_SCREEN = preload("uid://y33f026lublf")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

static func _win() -> void:
	PivotalPointsGlobals.score += 1
	pass

static func _lose() -> void:
	PivotalPointsGlobals.health -= 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
