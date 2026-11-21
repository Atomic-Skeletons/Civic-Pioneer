class_name TownVariables
extends Node

signal people_added(amount: int)
signal people_removed(amount: int)
signal happiness_added(amount: int)
signal happiness_removed(amount: int)

var happiness := 5
var max_happiness := 20
var people : int = 0
var buildings : int = 0

func _ready() -> void:
	add_people(10)

func add_happiness(amount: int):
	happiness += amount
	if amount > 0:
		happiness_added.emit(amount)
	elif amount < 0:
		happiness_removed.emit(amount)

func add_people(amount: int):
	var new_people = people + amount
	# sets people to zero if below zero
	new_people = max(new_people, 0)
	
	var people_dif = new_people - people
	if people_dif > 0:
		people_added.emit(people_dif)
	elif people_dif < 0:
		people_removed.emit(people_dif)
	
	people = new_people

func add_buildings(amount: int):
	buildings += amount
	# sets buildings to zero if below zero
	buildings = max(buildings, 0)
