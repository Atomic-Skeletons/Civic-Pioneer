extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_events.colorful_trees, 
		func():
			town_variables.add_people(-3)
			]
