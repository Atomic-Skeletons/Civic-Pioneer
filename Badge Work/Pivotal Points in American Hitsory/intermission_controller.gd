extends Node2D

#Health stuff. 
@onready var heart_1: TextureRect = $HBoxContainer/Heart1
@onready var heart_2: TextureRect = $HBoxContainer/Heart2
@onready var heart_3: TextureRect = $HBoxContainer/Heart3
@onready var heart_4: TextureRect = $HBoxContainer/Heart4
const EMPTY_HEART_TEST = preload("uid://bp5wlpq8wusq6")
const FULL_HEART_TEST = preload("uid://cvxw7elxqu7a3")

#Display stuff. 
@onready var score_display: Label = $ScoreDisplay
@onready var ready_text: Label = $ReadyText
@export_dir var minigames_folder_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PivotalPointsGlobals.health < 4:
		heart_4.texture = EMPTY_HEART_TEST
	if PivotalPointsGlobals.health < 3:
		heart_3.texture = EMPTY_HEART_TEST
	if PivotalPointsGlobals.health < 2:
		heart_2.texture = EMPTY_HEART_TEST
	if PivotalPointsGlobals.health < 1:
		heart_1.texture = EMPTY_HEART_TEST
		ready_text.text = "GAME OVER"
	score_display.text = str(PivotalPointsGlobals.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_timer_timeout() -> void:
	randomize()
	#Utilities.
	pass # Replace with function body.
