extends Node

export(String, FILE, "*.json") var dialogue_file
var dialogue_keys = []
var dialogue_name = ""
var current = 0
var dialogue_text = ""

signal dialogue_started
signal dialogue_finished



func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		var dialogue = parse_json(file.get_as_text())
		print(dialogue)
		return dialogue


func generate_dict(dial):
	var dictionary_name : String
	var dictionary_text : String
	
	var dictionary = []
	
	for any in dial:
		dictionary.append(dial[any])
		continue
	
	for any in dictionary:
		dictionary_text = any.text
		dictionary_name = any.name
		print(dictionary_name, " :-=-=-: ", dictionary_text)
	
	for any in dictionary:
		print(any.emotion)
	
