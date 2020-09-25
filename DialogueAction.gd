extends Node
#http://gameprogrammingpatterns.com/observer.html
#https://godotengine.org/qa/8291/how-to-parse-a-json-file-i-wrote-myself
#https://habr.com/ru/post/212837/
#https://generalistprogrammer.com/godot/godot-2d-platformer-tutorial/

# Wait 5 seconds, then resume execution.
#yield(get_tree().create_timer(5.0), "timeout")


class_name Dialogue_Action

export (String, FILE, "*.json") var dialogue_file_path : String

func interact() -> void:
	var dialogue : Dictionary = load_dialogue(dialogue_file_path)
	#yield(local_map.play_dialogue(dialogue), "complited")
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
