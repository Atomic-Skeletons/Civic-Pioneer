extends Marker2D

const CITIZEN_CHARACTER = preload("uid://cyjvq0h24lvde")

func _ready() -> void:
	await get_tree().process_frame
	spawn_people(10)

func spawn_people(amount: int):
	for i in amount:
		var new_citizen: CitizenController = CITIZEN_CHARACTER.instantiate()
		
		add_sibling(new_citizen)
		new_citizen.global_position = global_position
