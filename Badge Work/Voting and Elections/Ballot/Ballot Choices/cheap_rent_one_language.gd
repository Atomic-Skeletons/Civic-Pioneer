extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.cheap_rent, 
		func():
			pass
			,
		#town_events.one_language, 
		func():
			town_variables.add_people(-5)
			]
