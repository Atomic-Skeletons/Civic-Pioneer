extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.less_ads,
		town_variables.add_people.bind(2),
		town_variables.add_happiness.bind(1)
			]
