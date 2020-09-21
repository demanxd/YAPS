extends Node2D


onready var Label = $Label

func _ready():
	pass


func set_text(string):
	Label.text = string


func show_text():
	Label.visible = true


func hide_text():
	Label.visible = false
