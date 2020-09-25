extends Node

class_name Dialoge_Action

onready var Map = ".."


const SOURCE_DIRECTORY = "res://dialogues/Tavern"
var DIAL_FILE = "Tavern.json"

export (String, FILE, "*.json") var dialogue_file_path : String

func interact() -> void:
	var dialogue : Dictionary = load_dialogue(SOURCE_DIRECTORY.plus_file(DIAL_FILE))
	yield(Map.play_dialogue(dialogue), "complited")
	emit_signal("finished")


func load_dialogue(file_path) -> Dictionary:
	"""
	Parses a JSON file and returns it as a dictionary
	"""
	
	var file = File.new()
	#assert 
	file.file_exists(file_path)

	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	#assert 
	dialogue.size() > 0
	return dialogue


