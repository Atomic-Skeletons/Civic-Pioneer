extends Node

#dialougue texts
var test_file = "res://Txt/TestDialouge.txt"

var chatbox
var text_queue: Array[String]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chatbox = get_node("DialogueUi")
	var test_array = get_text_array(test_file)
	text_queue =  Array(Array(test_array), TYPE_STRING, "", null )
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Enter"):
		chatbox.set_to_ready()
		dialogue()
		if Global.TextboxOpen:
			if text_queue.is_empty():get_node("DialogueUi").hide_textbox();print("empty")
	
func add_to_queue(text):
	text_queue.append(text)

func get_text_array(res):
	var text_res = res
	var file = FileAccess.open(text_res,FileAccess.READ)
	var text = file.get_as_text()
	var text_array = text.split("\n")
	print(str(text_array))
	return text_array

func dialogue():
	#if !Global.TextboxOpen:chatbox.set_to_ready()
	if !text_queue.is_empty(): chatbox.add_text(text_queue[0]);text_queue.pop_front();print(str(text_queue))
	
