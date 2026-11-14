extends Control


const MAIN_MENU : PackedScene = preload("uid://ofmadmqvrr2")

@onready var animation_player: AnimationPlayer = %AnimationPlayer

var next_scene: Variant

#region Transition functions
func transition_to_scene_path(scene_path: String):
	next_scene = scene_path
	start_transition()

func transition_to_main_menu():
	next_scene = MAIN_MENU
	start_transition()
#endregion

#region Animation Functions
func start_transition():
	animation_player.play("fade in")

# when the animation player's animation finishes, this function is called
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade in":
		"""
		There are 2 different ways to open a new scene
		depending on the type:
			String: loads the scene and swithes to the new loaded scene
			PackedScene: scene is already loaded, it just switches to the new one
		"""
		if next_scene is String:
			get_tree().change_scene_to_file(next_scene)
		elif next_scene is PackedScene:
			get_tree().change_scene_to_packed(next_scene)
		
		animation_player.play("fade out")
#endregion
