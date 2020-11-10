extends KinematicBody2D

onready var collision = $CollisionPolygon2D
onready var velocity = Vector2.ZERO
onready var timer = $Timer
onready var center_point = $Position2D

onready var alpha : float

export var rotation_speed : float = 0.001

onready var last_seen_pos
onready var contact_mass
onready var is_colliding : bool

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	alpha = rotation_speed * delta * last_seen_pos * contact_mass / 10 
	
	if is_colliding:
		rotation -= alpha
		is_colliding = false
	
	else:
		if ((fmod(self.rotation_degrees, 180) > -180 and fmod(self.rotation_degrees, 180) < -1) or
				(fmod(self.rotation_degrees, 180) < 180 and fmod(self.rotation_degrees, 180) > 1)):
			rotation -= alpha
		
		elif (fmod(self.rotation_degrees, 180) > 0 or fmod(self.rotation_degrees, 180) < 0):
			self.rotation_degrees -= fmod(self.rotation_degrees, 180)
		
		else:
			set_physics_process(false)


func collide_with(collision : KinematicCollision2D, collider : KinematicBody2D):
	is_colliding = true
	contact_mass = collider.mass
	last_seen_pos = abs(center_point.global_position.x) - abs(collider.global_position.x)
	set_physics_process(true)










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
