extends Marker2D

const CITIZEN_CHARACTER = preload("uid://cyjvq0h24lvde")


func spawn_people(amount: int):
	var new_citizen: CitizenController = CITIZEN_CHARACTER.instantiate()
	
	add_sibling(new_citizen)
	new_citizen.global_position = global_position
	var houses = get_tree().get_nodes_in_group("House")
