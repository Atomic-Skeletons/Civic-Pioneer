extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.less_voting_locations, 
		func():
			town_variables.add_people(2)
			,
		func():
			town_variables.add_happiness(-1)
			]
