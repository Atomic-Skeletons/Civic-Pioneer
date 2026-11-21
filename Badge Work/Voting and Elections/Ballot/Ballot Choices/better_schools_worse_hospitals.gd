extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.worse_hospital,
		town_events.fancy_school, 
			]
