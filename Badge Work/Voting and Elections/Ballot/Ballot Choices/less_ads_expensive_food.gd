extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.less_ads, 
		func():
			town_variables.add_people(-2)
			,
			town_variables.add_happiness(1)
			]
