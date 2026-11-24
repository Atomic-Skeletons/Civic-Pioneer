extends BallotChoice


func _ready() -> void:
	super()
	choice_text = ""
	
	event_queue = [
		town_variables.add_people.bind(-4),
		town_variables.add_happiness.bind(-5)
		]
