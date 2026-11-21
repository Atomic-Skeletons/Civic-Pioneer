extends Marker2D

const CITIZEN_CHARACTER = preload("uid://cyjvq0h24lvde")

var people_spawn_duration = 2

func _ready() -> void:
	await get_tree().process_frame
	spawn_people(10)

func spawn_people(amount: int):
	if amount <= 0: return
	var tween: Tween = create_tween()
	var interval = people_spawn_duration/float(amount)
	
	for i in amount-1:
		tween.tween_callback(spawn_citizen)
		tween.tween_interval(interval)
	
	tween.tween_callback(spawn_citizen)

func spawn_citizen():
	var new_citizen: CitizenController = CITIZEN_CHARACTER.instantiate()
	
	add_sibling(new_citizen)
	new_citizen.global_position = global_position
