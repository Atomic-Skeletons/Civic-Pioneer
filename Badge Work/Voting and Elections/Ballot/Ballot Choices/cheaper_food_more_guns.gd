extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.more_guns, 
		func():
			town_variables.add_people(-1)
			,
			town_variables.add_happiness(3)
			]
