extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.dirty_lake, 
		func():
			town_variables.add_happiness(4)
			]
