extends Area2D

var trash_collected = 0
@export var trash_max = 2
@onready var trash_counter: Label = %TrashCounter
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	trash_counter.text = (str(trash_collected)+"/"+str(trash_max))
	if has_overlapping_areas():
		var area_list = get_overlapping_areas()
		for area in area_list:
			if area.is_in_group("Trash"):
				trash_collected+=1
				print("Trash Collected: " + str(trash_collected))
				area.call_deferred("queue_free")
