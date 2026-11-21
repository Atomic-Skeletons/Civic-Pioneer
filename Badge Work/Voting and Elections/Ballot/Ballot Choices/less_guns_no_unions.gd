extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.less_guns,
		func():
			town_variables.add_people(-5)
			,
		func():
			town_variables.add_happiness(3)
			]
