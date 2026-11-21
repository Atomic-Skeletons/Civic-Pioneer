class_name BallotController
extends Control

signal selected_ballot(ballot: BallotChoice)


@onready var all_ballot_buttons: FlowContainer = %"All Ballot Buttons"
@onready var ballot_holder: HBoxContainer = %"Ballot Holder"
var current_ballot_choices : Array[BallotChoice] = []
@onready var pass_ballot_button: Button = %"Pass Ballot Button"

@onready var town_controller: TownController = owner

var unpicked_ballot_buttons: Array[PackedScene]

func _ready() -> void:
	clear_ballot_nodes()
	hide()

func _process(_delta: float) -> void:
	update_ballot_visuals()

func generate_ballot():
	# randomly pick 3 ballots and spawn them for the player
	# to choose from 
	
	for child in ballot_holder.get_children():
		var ballot_buttons = all_ballot_buttons.get_children()
		ballot_buttons.shuffle()
		
		var ballot_button : BallotChoice = ballot_buttons.pop_front()
		
		if not ballot_button: break
		
		ballot_button.reparent(child)
		
		ballot_button.pressed.connect(on_ballot_choice_pressed.bind(ballot_button))
		
		current_ballot_choices.append(ballot_button)
	# make the menu and the button visible
	show()

var selected_ballot_choice: BallotChoice

func on_ballot_choice_pressed(ballot_choice: BallotChoice):
	selected_ballot_choice = ballot_choice

func update_ballot_visuals():
	if not selected_ballot_choice:
		pass_ballot_button.disabled = true
		return
	else:
		pass_ballot_button.disabled = false
	
	for ballot: BallotChoice in current_ballot_choices:
		ballot.offset_transform_enabled = true
		if ballot == selected_ballot_choice:
			ballot.offset_transform_scale = lerp(ballot.offset_transform_scale, Vector2(1.2,1.2), .2)
		else:
			ballot.offset_transform_scale = lerp(ballot.offset_transform_scale, Vector2.ONE, .2)

func on_ballot_passed():
	town_controller.event_queue = selected_ballot_choice.event_queue
	town_controller.start_time_pass()
	
	#current_ballot_choices.remove_at(current_ballot_choices.find(ballot_choice))
	
	selected_ballot.emit(selected_ballot_choice)
	town_controller.event_queue.append(clear_ballot)
	town_controller.event_queue.append(generate_ballot)
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
