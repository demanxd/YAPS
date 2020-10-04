extends Actor


export var health = 0
export var damage = 0

onready var platform_detector = $PlatformDetector
const FLOOR_DETECT_DISTANCE = 20.0

func _physics_process(_delta):
	var direction = get_direction()
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	var is_on_platform = platform_detector.is_colliding()
	
	if not is_on_platform:
		_velocity.y *= 0.6
	if direction.y != 0.0:
		_velocity.y = speed.y * direction.y
	
	_velocity = move_and_slide_with_snap(
		_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
		)


func get_direction():
	return Vector2(
			0,
			-1
			if platform_detector.is_colliding()
			else 0
	)
