extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.add_center_buildings, 
		func():
			town_variables.add_happiness(-4)
			]
