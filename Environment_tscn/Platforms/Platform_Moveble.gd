extends KinematicBody2D

onready var collision = $CollisionPolygon2D
onready var velocity = Vector2.ZERO
onready var is_triggered = false

export var first_position : Vector2
export var second_position : Vector2

onready var reset_position = global_position

export var move_speed = 2.0
export var move_distance = 50.0
export var move_direction = Vector2(1, 1)
var time_since_init = 0.0
var origin = Vector2(0, 0)

onready var dir : bool


func _ready():
	time_since_init = 0.0
	origin = position
	move_direction = first_position - second_position


func _physics_process(delta):
	time_since_init = time_since_init + delta
	var position_on_curve
	var offset
	
	if position == first_position:
		dir = true
	
	elif position == second_position:
		dir = false
	
	if dir:
		position_on_curve = sin(time_since_init * PI * move_speed)
		offset = position_on_curve * (second_position - first_position)
		position = origin + offset
	
	else:
		position_on_curve = sin(time_since_init * PI * move_speed)
		offset = position_on_curve * (first_position - second_position)
		position = origin + offset




















#func _ready():
#	print_debug(self.name, " ready called")
#	set_physics_process(false)
#
#
#func _physics_process(delta):
#	print_debug(self.name, " physics_process called")
#	position += velocity
#
#
#func collide_with(collision : KinematicCollision2D, collider : KinematicBody2D):
#	print_debug(self.name, " collide_with triggered")
#	if !is_triggered:
#		set_physics_process(true)
#		is_triggered = true
#		velocity = Vector2.ZERO
#
#func _on_AnimationPlayer_animation_finished():
#	set_physics_process(true)
#
#func _on_ResetTimer_timeout():
#	set_physics_process(false)
#	yield(get_tree(),"physics_frame")
#	global_position = reset_position
