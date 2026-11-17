extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		func():
			town_variables.add_people(4),
		func():
			town_variables.add_happiness(-5)
			]
