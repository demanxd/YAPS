extends Node
#
#const SOURCE_DIRECTORY = "res://dialogues/Tavern"
#var DIAL_FILE = "Tavern.json"
#
#var characters : Dictionary
#
#func _ready() -> void:
#	var dir = Directory.new()
#	#assert
#	dir.dir_exists(SOURCE_DIRECTORY)
#	if not dir.open(SOURCE_DIRECTORY) == OK:
#		print("ERROR! Couldn't read directory %s" % SOURCE_DIRECTORY)
#	dir.list_dir_begin()
#	if not dir.file_exists(SOURCE_DIRECTORY.plus_file(DIAL_FILE)):
#		print("ERROR! Couldn't read a file %s" % DIAL_FILE)
#	characters[DIAL_FILE.get_basename()] = load(SOURCE_DIRECTORY.plus_file(DIAL_FILE))
