extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.anti_corruption, 
		func():
			pass
			,
		#town_events.harsher_drug_laws, 
		func():
			town_variables.add_people(-2)
			]
