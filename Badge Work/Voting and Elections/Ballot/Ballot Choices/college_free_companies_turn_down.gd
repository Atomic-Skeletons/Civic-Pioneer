extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.add_park, 
		func():
			town_variables.add_people(4)
			,
			town_variables.add_happiness(-5)
			]
