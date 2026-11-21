extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.more_rich_tax, 
		func():
			town_variables.add_people(5)
			,
		#town_events.more_coup_risk, 
		func():
			pass
			]
