class_name BallotHistoryController
extends BaseButton

var ballot_history : Array[String] = []
@onready var ballot_history_holder: VBoxContainer = %"Ballot History"


func _add_ballot_to_history(ballot: BallotChoice) -> void:
	var label: RichTextLabel = ballot_history_holder.get_child(0)
	var ballot_text = ballot.get_child(0).text
	
	ballot_history.append(ballot_text)
	if ballot_history.size() == 1:
		label.text = ballot_text
	else:
		var new_label = label.duplicate()
		ballot_history_holder.add_child(new_label)
		ballot_history_holder.move_child(new_label, 0)
		new_label.text = ballot_text
	
