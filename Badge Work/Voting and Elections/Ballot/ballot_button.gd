class_name BallotChoice
extends Button


var town_variables: TownVariables
var town_events: TownEvents

var choice_text: String = "More money invested in hospitals, but less money invested in schools"

var event_queue: Array[Callable] = []

func _ready() -> void:
	town_variables = get_tree().get_first_node_in_group("Town Variables")
	town_events = get_tree().get_first_node_in_group("Town Events")
