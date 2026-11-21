extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.clean_trees, 
		town_events.clean_lake, 
		func():
			town_variables.add_happiness(-2)
			]
