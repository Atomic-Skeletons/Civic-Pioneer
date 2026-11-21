extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.oil_homes, 
		func():
			town_variables.add_happiness(10)
			]
