extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.fancy_hospital, 
		town_events.broke_down_school,
		func():
			town_variables.add_happiness(30)
			]
