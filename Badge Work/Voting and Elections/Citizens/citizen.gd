#@tool
extends Node2D

# DEV Buttons for showing off randomization
#@export_tool_button("Randomize Outfit") var rand_outfit_func = randomize_outfit
#@export_tool_button("Randomize Hat") var rand_hat_func = randomize_hat

# I'd like to move this to global at some point, for access in all games.
var color_palette = {
	"darkbrown": "2f1e00", 
	"darkpurple": "32003b", 
	"darkblue": "00223b", 
	"darkgreen": "343f13", 
	"purple": "553f59", 
	"burntorange": "7a5619", 
	"green": "7c8c49", 
	"lightpurple": "8f7594", 
	"steelblue": "497598",
	"darktan": "a68d62", 
	"darklime": "c3d392", 
	"blue": "79c5ff", 
	"orange": "f0ac33", 
	"tan": "ffd892", 
	"pink": "f3b5ff", 
	"lightblue": "c3e5ff", 
	"lime":"efffc0", 
	"lighttan": "ffeecf"
}

#These functions need to be split up to be a bit more usable imo, can discuss this
func randomize_outfit():
	# Gets all clothing sprites
	var outfit_arr = $Body/Outfits.get_children()
	# Hides all clothing sprites
	for sprite in outfit_arr:
		sprite.visible = false
	# Chooses one random clothing sprite
	var outfit_rand = outfit_arr[randi_range(0, outfit_arr.size() - 1)]
	# Makes that sprite visible
	outfit_rand.visible = true
	# Randomizes that sprite's color from palette
	$Body/Outfits.modulate = Color(color_palette.values().pick_random())

# Same process as randomize_outfit(), check that for comments
func randomize_hat():
	var hat_arr = $Body/Hats.get_children()
	for sprite in hat_arr:
		sprite.visible = false
	var hat_rand = hat_arr[randi_range(0, hat_arr.size() - 1)]
	hat_rand.visible = true
	$Body/Hats.modulate = Color(color_palette.values().pick_random())
