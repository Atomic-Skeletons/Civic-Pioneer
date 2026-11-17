extends Node2D

@export_dir var minigames_folder_path: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PivotalPointsGlobals.minigame_scenes.clear()
	var minigame_files = Utilities.get_project_files(minigames_folder_path)
	for filepath in minigame_files:
		var minigame_scene = load(filepath)
		PivotalPointsGlobals.minigame_scenes.append(minigame_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
