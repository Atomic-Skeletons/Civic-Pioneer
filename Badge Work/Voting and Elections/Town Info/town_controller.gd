class_name TownController
extends Node

@onready var town_variables: TownVariables = %"Town Variables"
@onready var town_events: TownEvents = %"Town Events"

var event_queue: Array[Callable] = []

var event_delay_seconds := 2

@onready var ballot_controller: BallotController = $"CanvasLayer/Ballot Controller"

func _ready() -> void:
	#await get_tree().create_timer(1).timeout
	start_next_ballot()

# start time passing and event queue
func do_next_event():
	event_queue.append(start_next_ballot)
	for event in event_queue:
		event.call()
		await get_tree().create_timer(event_delay_seconds).timeout

func start_next_ballot():
	ballot_controller.generate_ballot()

func start_time_pass():
	#event_queue.append(start_next_ballot)
	for event in event_queue:
		event.call()
		await get_tree().create_timer(event_delay_seconds).timeout
