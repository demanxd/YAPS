extends Node2D

onready var TIMER_STATE = true
onready var TEXT_SHOWING = false
onready var TIMER_SET_ONCE = false

onready var Timer = $Timer
onready var MCF1  = $NPC/MCFriend1
onready var DialSyst = $DialoguePlayer
onready var NPC_list = $NPC


func _ready():
	DialSyst.setup_dial_syst()
	var person
	
	while not DialSyst.last_sentence_reached:
		if person != null:
			if NPC_list.get_node(person.name) != null:
				NPC_list.get_node(person.name).hide_text()
		
		person = DialSyst.get_sentence()
		
		if NPC_list.get_node(person.name) == null:
			print_debug("WARNING: the person with ", person.name, " name doesn't exist")
		else :
			NPC_list.get_node(person.name).set_sentence_state(person)
			
		Timer.set_wait_time(int(person.live_time)) 		# Set the wait time
		Timer.start()			# Start it
		yield(Timer, "timeout")		# Finally, make the script stop with the yield
	
	if person != null:
		if NPC_list.get_node(person.name) != null:
			NPC_list.get_node(person.name).hide_text()
	
	print("last sentence was reached")
	


#timerblock================
func set_timer(s):
#	print_debug("setting timer")
	Timer.set_wait_time(s)
	Timer.set_one_shot(true)
	Timer.start()


func _on_Timer_timeout():
#	print_debug("called + Timer state = ", TIMER_STATE)
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
#	if !TEXT_SHOWING:
#		if !TIMER_SET_ONCE:
#			set_timer(2)
#			MCF1.set_text("Hello there!")
#			MCF1.show_text()
#			TIMER_SET_ONCE = true
#	else:
#		if !TIMER_SET_ONCE:
#			set_timer(2)
#			MCF1.hide_text()
#			TIMER_SET_ONCE = true
	pass
