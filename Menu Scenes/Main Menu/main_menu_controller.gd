extends Control


func _ready() -> void:
	# save game when entering the main menu
	SaveDataController.save_game()
