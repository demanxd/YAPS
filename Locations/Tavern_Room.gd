extends Node2D

onready var TIMER_STATE = true
onready var TEXT_SHOWING = false
onready var TIMER_SET_ONCE = false

onready var Timer = $Timer
onready var MCF1  = $YSort/MCFriend1


func _ready():
	pass


#timerblock================
func set_timer(s):
	print_debug("setting timer")
	Timer.set_wait_time(s)
	Timer.set_one_shot(true)
	Timer.start()


func _on_Timer_timeout():
	print_debug("called + Timer state = ", TIMER_STATE)
	if TIMER_STATE:
		timer_true()
	else:
		timer_false()
		
#timerblock================


func timer_false():
	TIMER_STATE = true
	TEXT_SHOWING = true
	TIMER_SET_ONCE = false


func timer_true():
	TIMER_STATE = false
	TEXT_SHOWING = false
	TIMER_SET_ONCE = false


func _process(delta):
	if !TEXT_SHOWING:
		if !TIMER_SET_ONCE:
			set_timer(2)
			MCF1.set_text("Hello there!")
			MCF1.show_text()
			TIMER_SET_ONCE = true
	else:
		if !TIMER_SET_ONCE:
			set_timer(2)
			MCF1.hide_text()
			TIMER_SET_ONCE = true
