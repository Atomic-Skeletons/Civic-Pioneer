extends Marker2D

signal spawned_citizen()

const CITIZEN_CHARACTER = preload("uid://cyjvq0h24lvde")

var people_spawn_duration = 2

#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("right click"):
		#remove_citizens(1)

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
	spawned_citizen.emit()

func remove_citizens(amount: int):
	var citizens := get_tree().get_nodes_in_group("Citizen")
	citizens.shuffle()
	for i in amount:
		var citizen : CitizenController = citizens.get(i)
		if citizen:
			citizen.nav_agent.target_position = global_position
			citizen.leave()
			
