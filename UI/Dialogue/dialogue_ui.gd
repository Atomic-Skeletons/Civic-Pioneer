extends CanvasLayer

@onready var dialogue_box: PanelContainer = %DialogueBox
@onready var dialogue_label: RichTextLabel = %DialogueLabel

enum {
	READY,
	READING,
	FINISHED
}

var current = []
var on_switch = false
const CHAR_READ_RATE = .02
var state = READY
var time = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_textbox()
	state = READY

func set_to_ready():
	if state == FINISHED: state = READY

func _process(delta: float) -> void:
	pass

func hide_textbox():
	print("hide")
	dialogue_label.text = ""
	dialogue_box.hide()
	on_switch = false
	Global.TextboxOpen = false

func show_textbox():
	dialogue_box.show()
	Global.TextboxOpen = true
	on_switch = true
	
	
func add_text(text):
	if(state == READY):
		#texture = character
		var tween = get_tree().create_tween()
		state = READING
		time = len(text) * CHAR_READ_RATE
		dialogue_label.visible_ratio = 0.0
		dialogue_label.text = text
		show_textbox()
		tween.tween_property(dialogue_label,"visible_ratio",1.0,time)
		await get_tree().create_timer(time).timeout
		state = FINISHED
	
