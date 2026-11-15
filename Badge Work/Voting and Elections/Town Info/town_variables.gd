class_name TownVariables
extends Node


var happiness : int = 0
var people : int = 0
var buildings : int = 0


func add_happiness(amount: int):
	happiness += amount
	print(happiness)

func add_people(amount: int):
	people += amount
	# sets people to zero if below zero
	people = max(people, 0)

func add_buildings(amount: int):
	buildings += amount
	# sets buildings to zero if below zero
	buildings = max(buildings, 0)
