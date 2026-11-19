class_name BallotController
extends Control


@onready var ballot_history: HBoxContainer = $"Ballot History"

@onready var all_ballot_buttons: FlowContainer = %"All Ballot Buttons"
@onready var ballot_holder: HBoxContainer = %"Ballot Holder"
var current_ballot_choices : Array[BallotChoice] = []

@onready var town_controller: TownController = owner

var unpicked_ballot_buttons: Array[PackedScene]

func _ready() -> void:
	clear_ballot_nodes()
	hide()

func generate_ballot():
	# randomly pick 3 ballots and spawn them for the player
	# to choose from 
	
	for child in ballot_holder.get_children():
		var ballot_buttons = all_ballot_buttons.get_children()
		ballot_buttons.shuffle()
		
		var ballot_button : BallotChoice = ballot_buttons.pop_front()
		
		if not ballot_button: break
		
		ballot_button.reparent(child)
		
		ballot_button.pressed.connect(
			func():
				on_ballot_choice_pressed(ballot_button)
				)
		
		current_ballot_choices.append(ballot_button)
	# make the menu and the button visible
	show()


func on_ballot_choice_pressed(ballot_choice: BallotChoice):
	town_controller.event_queue = ballot_choice.event_queue
	town_controller.start_time_pass()
	
	# save the ballot in the history
	ballot_choice.reparent(ballot_history)
	current_ballot_choices.remove_at(current_ballot_choices.find(ballot_choice))
	
	
	clear_ballot()
	hide()

func clear_ballot():
	for ballot_button : BallotChoice in current_ballot_choices:
		ballot_button.queue_free()
	
	current_ballot_choices.clear()

func clear_ballot_nodes():
	for child in ballot_holder.get_children():
		if child.get_children().size() > 0:
			var child_child = child.get_child(0)
			child_child.queue_free()
