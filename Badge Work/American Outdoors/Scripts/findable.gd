extends AspectRatioContainer

@onready var icon: TextureRect = $Icon
@onready var grey_out: ColorRect = $GreyOut

@export var found = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !found:grey_out.show()
	else: grey_out.hide()
