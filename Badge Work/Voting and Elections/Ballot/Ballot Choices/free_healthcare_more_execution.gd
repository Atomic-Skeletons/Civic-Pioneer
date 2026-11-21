extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.clean_trees, 
		func():
			town_variables.add_people(5)
			,
		func():
			town_variables.add_happiness(-1)
			]
