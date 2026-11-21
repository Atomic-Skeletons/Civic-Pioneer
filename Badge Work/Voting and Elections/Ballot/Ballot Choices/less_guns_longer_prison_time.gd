extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.bigger_prison,
		town_events.less_guns,
		func():
			town_variables.add_people(2)
			]
