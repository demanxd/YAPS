extends Actor


export var health = 0
export var damage = 0

onready var platform_detector = $PlatformDetector
const FLOOR_DETECT_DISTANCE = 20.0
onready var Label = $Label
onready var sentence = []

func _physics_process(_delta):
	var direction = get_direction()
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	var is_on_platform = platform_detector.is_colliding()
	var is_jump_interrupted = false
	
	if not is_on_platform:
		_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	
	_velocity = move_and_slide_with_snap(
		_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
		)

func calculate_move_velocity(
		linear_velocity,
		direction,
		speed, 
		is_jump_interrupted
	):
	var velocity = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		# Decrease the Y velocity by multiplying it, but don't set it to 0
		# as to not be too abrupt.
		velocity.y *= 0.6
	return velocity

func get_direction():
	return Vector2(
			0,
			-1
			if platform_detector.is_colliding()
			else 0
	)

func _ready():
	pass


func set_text(string):
	Label.text = string


func show_text():
	Label.visible = true


func hide_text():
	Label.visible = false

func set_sentence_state(_sentence):
	print("sentence input")
	sentence = _sentence
	set_text(sentence.text)
	show_text()


func set_state():
	pass
