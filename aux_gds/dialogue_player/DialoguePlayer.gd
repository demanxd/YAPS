extends Node

export(String, FILE, "*.json") var dialogue_file
onready var dialogue_array = []
onready var sentence_counter = 0
onready var last_sentence_reached = false


func setup_dial_syst():
	generate_dial_array(load_dialogue())


func load_dialogue():
	var _file = File.new()
	if _file.file_exists(dialogue_file):
		_file.open(dialogue_file, _file.READ)
		var _dialogue = parse_json(_file.get_as_text())
#		print(_dialogue)
		return _dialogue


func generate_dial_array(dial):
	for _any in dial:
		dialogue_array.append(dial[_any])
	
	if dialogue_array == null :
		last_sentence_reached = true
	else :
		last_sentence_reached = false
		sentence_counter = 0
#	var _dictionary_name : String
#	var _dictionary_text : String
#	for _any in dialogue_array:
#		_dictionary_text = _any.text
#		_dictionary_name = _any.name
#		print(dictionary_name, " :-=-=-: ", dictionary_text)
	
#	for any in dictionary:
#		print(any.emotion)


func get_sentence():
	if last_sentence_reached:
		print_debug("error in last sentence")
		return
	var _tmp_arr = dialogue_array[sentence_counter]
	sentence_counter += 1
	if dialogue_array.size() == sentence_counter :
		last_sentence_reached = true
#	print(_tmp_arr.text, " :-=-=-: ", _tmp_arr.name)
	return _tmp_arr
