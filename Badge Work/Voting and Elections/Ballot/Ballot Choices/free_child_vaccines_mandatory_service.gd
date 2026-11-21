extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.clean_trees, 
		func():
			town_variables.add_people(-4)
			,
		func():
			town_variables.add_happiness(+2)
			]
