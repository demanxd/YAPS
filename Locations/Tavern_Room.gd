extends Node2D

onready var TIMER_STATE = true

onready var Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#timerblock================
func set_timer(s):
	Timer.set_wait_time(s)
	Timer.set_one_shot(true)
	Timer.start()


func _on_Timer_timeout():
	print_debug("called")
	if TIMER_STATE:
		timer_true()
	else:
		timer_false()
		
#timerblock================


func timer_false():
	TIMER_STATE = true


func timer_true():
	TIMER_STATE = false
