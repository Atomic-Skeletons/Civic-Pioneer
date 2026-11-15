class_name BallotChoice
extends Button


var town_variables: TownVariables
var town_events: TownEvents

var choice_text: String = "More money invested in hospitals, but less money invested in schools"

var event_queue: Array[Callable] = []


func _ready() -> void:
	town_variables = get_tree().get_first_node_in_group("Town Variables")
	town_events = get_tree().get_first_node_in_group("Town Events")
	
	event_queue = [
		town_events.fancy_hospital, 
		town_events.broke_down_school,
		func():
			town_variables.add_happiness(30)
			]

func _on_pressed() -> void:
	var town_controller: TownController = $"../../../../.."
	
	town_controller.event_queue = event_queue
	town_controller.ballot_history.append(choice_text)
	
	town_controller.do_next_event()
