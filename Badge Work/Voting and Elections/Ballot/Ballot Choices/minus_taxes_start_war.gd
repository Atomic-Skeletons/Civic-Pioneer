extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.start_war, 
		func():
			town_variables.add_people(-3)
			,
		#town_events.minus_taxes, 
		func():
			town_variables.add_happiness(1)
			]
