extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.more_voting_locations, 
		func():
			town_variables.add_happiness(-2)
			]
