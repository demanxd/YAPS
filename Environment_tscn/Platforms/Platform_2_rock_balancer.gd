extends KinematicBody2D

onready var collision = $CollisionPolygon2D
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
onready var velocity = Vector2.ZERO
onready var timer = $Timer
onready var center_point = $Position2D
onready var contact_obj : KinematicBody2D
export var max_distance = 30

onready var alpha : float


export var rotation_speed : float = 0.001
export var reset_time : float = 1.0

onready var reset_position = global_position

func _ready():
#	print_debug(self.name, " at position ", self.global_position)
	set_physics_process(false)


func _physics_process(delta):
	var delta_pos = abs(center_point.global_position.x) - abs(contact_obj.global_position.x)
	alpha = rotation_speed * delta_pos * contact_obj.mass / 10
#	print_debug(self.name, " rotation speed = ", alpha)
	if delta_pos > 0 and delta_pos < max_distance:
#		print_debug(self.name, " > 0", contact_obj.name, " in position ", contact_obj.global_position.x)
		rotation -= alpha
	elif delta_pos < 0 and delta_pos > -max_distance:
#		print_debug(self.name, " < 0", contact_obj.name, " in position ", contact_obj.global_position.x)
		rotation -= alpha
	else:
		if fmod(self.rotation, PI) > 0.1 or fmod(self.rotation, PI) < -0.1:
			timer.start(reset_time)
			rotation -= alpha
			print(self.name, "rotation = ", self.rotation_degrees)
		else:
			set_physics_process(false)


func collide_with(collision : KinematicCollision2D, collider : KinematicBody2D):
	contact_obj = collider
	timer.start(reset_time)
	set_physics_process(true)
	timer.start(reset_time)
	velocity = Vector2.ZERO










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
