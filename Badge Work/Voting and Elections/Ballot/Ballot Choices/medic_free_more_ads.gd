extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		#town_events.medic_free, 
		func():
			town_variables.add_people(3)
			,
		town_events.more_ads, 
		#func():
			#pass
			]
