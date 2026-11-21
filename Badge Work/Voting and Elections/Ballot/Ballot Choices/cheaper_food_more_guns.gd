extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.more_guns,
		town_variables.add_people.bind(-1),
		town_variables.add_happiness.bind(3)
			]
