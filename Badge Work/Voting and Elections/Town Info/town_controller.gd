class_name TownController
extends Node

@onready var town_variables: TownVariables = %"Town Variables"
@onready var town_events: TownEvents = %"Town Events"

var event_queue: Array[Callable] = []

var event_delay_seconds := 2

var ballot_choice: BallotChoice


# start time passing and event queue
func do_next_event():
	for event in event_queue:
		event.call()
		await get_tree().create_timer(event_delay_seconds).timeout
	
