class_name BarController
extends Control

var town_variables: TownVariables

@onready var happiness_bar: TextureProgressBar = $"Happiness Bar"
@onready var people_amount: Label = $"People Amount"

var happiness_bar_tween: Tween
var people_amount_tween: Tween
var people_amount_counter: int:
	set(value):
		people_amount_counter = value
		people_amount.text = str(people_amount_counter)

func _ready() -> void:
	town_variables = get_tree().get_first_node_in_group("Town Variables")
	happiness_bar.max_value = town_variables.max_happiness
	happiness_bar.value = town_variables.happiness
	
	people_amount_counter = 0

func _physics_process(_delta: float) -> void:
	var citizen_count = get_tree().get_node_count_in_group("Citizen")
	people_amount_counter = citizen_count

func update_happiness_bar(_amount: int):
	happiness_bar.max_value = town_variables.max_happiness
	happiness_bar_tween = Utilities.reset_tween(happiness_bar_tween, self)
	
	happiness_bar_tween.tween_property(happiness_bar, "value", town_variables.happiness, .5)

func update_people_amount(_amount: int):
	if not town_variables: return
	
	people_amount_tween = Utilities.reset_tween(people_amount_tween, self)
	people_amount_tween.tween_property(self, "people_amount_counter", town_variables.people, .5)
