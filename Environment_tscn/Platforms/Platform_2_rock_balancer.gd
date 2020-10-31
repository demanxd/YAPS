extends KinematicBody2D

onready var collision = $CollisionPolygon2D
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
onready var velocity = Vector2.ZERO
onready var timer = $Timer
onready var center_point = $Position2D
onready var is_triggered = false
onready var player_position

export var rotation_speed : float = 0.001
export var reset_time : float = 1.0

onready var reset_position = global_position

func _ready():
	print_debug(self.name, " ready called")
	set_physics_process(false)


func _physics_process(delta):
	print_debug(self.name, " physics_process called")
	if center_point.global_position.x - player_position.x < 30:
		print_debug(self.name, " center_point.global_position.x > player_position.x")
		rotation -= rotation_speed
	elif center_point.global_position.x - player_position.x > 30:
		print_debug(self.name, " center_point.global_position.x < player_position.x")
		rotation += rotation_speed


func collide_with(collision : KinematicCollision2D, collider : KinematicBody2D):
	print_debug(self.name, " collide_with triggered")
	if !is_triggered:
		player_position = collider.global_position
		timer.start(reset_time)
		set_physics_process(true)
		timer.start(reset_time)
		is_triggered = true
		velocity = Vector2.ZERO

#func _on_AnimationPlayer_animation_finished():

func _on_ResetTimer_timeout():
	set_physics_process(false)
	yield(get_tree(),"physics_frame")
	global_position = reset_position









"""
good for falling platform
"""

#extends KinematicBody2D
#
#onready var collision = $CollisionPolygon2D
#onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
#onready var velocity = Vector2.ZERO
#onready var timer = $Timer
#onready var is_triggered = false
#
#export var reset_time : float = 1.0
#
#onready var reset_position = global_position
#
#func _ready():
#	print_debug(self.name, " ready called")
#	set_physics_process(false)
#
#
#func _physics_process(delta):
#	print_debug(self.name, " physics_process called")
#	velocity.y += (gravity / 50) * delta
#	position += velocity
#
#
#func collide_with(collision : KinematicCollision2D, collider : KinematicBody2D):
#	print_debug(self.name, " collide_with triggered")
#	if !is_triggered:
#		timer.start(reset_time)
#		_on_AnimationPlayer_animation_finished()
#		is_triggered = true
#		velocity = Vector2.ZERO
#
#func _on_AnimationPlayer_animation_finished():
#	set_physics_process(true)
#	timer.start(reset_time)
#
#func _on_ResetTimer_timeout():
#	set_physics_process(false)
#	yield(get_tree(),"physics_frame")
#	global_position = reset_position
