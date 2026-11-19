extends TextureProgressBar

@onready var town_variables: TownVariables = %"Town Variables"

func _process(delta: float) -> void:
	value = town_variables.happiness
