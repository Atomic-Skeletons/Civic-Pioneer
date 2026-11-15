class_name BallotController
extends Control


var ballot_history : Array[String] = []

var all_ballot_buttons: Array[PackedScene]

# directory that holds all the different ballot choices
@export_dir var ballot_choices_path: String

func _ready() -> void:
	var file_paths = Utilities.get_project_files(ballot_choices_path)
	
	for file_path in file_paths:
		var ballot_button = load(file_path)
		all_ballot_buttons.append(ballot_button)
	
	print(all_ballot_buttons)

func generate_ballot():
	# randomly pick 3 ballots and spawn them for the player
	# to choose from 
	
	
	
	# make the menu and the button visible
	show()


func on_ballot_choice_pressed(ballot_choice: BallotChoice):
	
	# save the ballot in the history
	ballot_history.append(ballot_choice.choice_text)
