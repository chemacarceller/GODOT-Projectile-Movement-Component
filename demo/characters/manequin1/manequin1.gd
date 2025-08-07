class_name character1 extends CharacterBody3D

# Timer used to adjust the weapon shape
var _timer := Timer.new()

var rotationSensitivity : float = 1.5

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_timer.queue_free()

const _walkingWeaponRotation : Vector3 = Vector3(-20*PI/180,90*PI/180,90*PI/180)
const _runingWeaponRotation : Vector3 = Vector3(-5*PI/180,90*PI/180,90*PI/180)

var _weapon : Weapon
var _weaponHull : CollisionShape3D
var _characterWeaponHull : CollisionShape3D

func _ready() -> void:
	_timer.timeout.connect(_on_timer_timeout)
	add_child(_timer)

	# Instead of adjusting the weapon shape each frame we do each 0.05 seconds 20fps
	_timer.wait_time = 0.05
	_timer.start()

	_weapon = get_weapon()
	_weaponHull = _weapon.get_node("WeaponHull")
	_characterWeaponHull = get_weaponHull()

# Adjusting the weapon shape, the weapon shape position and rotation must be translated to the weapon shape included in the character global shape
func _on_timer_timeout() -> void:
	_characterWeaponHull.global_position = _weaponHull.global_position
	_characterWeaponHull.global_rotation = _weaponHull.global_rotation
	
	if get_movementComponent().get_isRuning() :
		if _weapon.rotation != _runingWeaponRotation :
			_weapon.rotation = _runingWeaponRotation
	else :
		if _weapon.rotation != _walkingWeaponRotation :
			_weapon.rotation = _walkingWeaponRotation

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$SpringArm3D.rotation.y = $SpringArm3D.rotation.y - event.relative.x /1000 * rotationSensitivity

	# If move_run action changes, the runing variable of the movement modified
	if Input.is_action_pressed("move_run_change"):
		$BasicCharacterMovement.set_isRuning(not $BasicCharacterMovement.get_isRuning())
	elif Input.is_action_pressed("move_run_continuos"):
		$BasicCharacterMovement.set_isRuning(true)
	elif Input.is_action_just_released("move_run_continuos"):
		$BasicCharacterMovement.set_isRuning(false)

# Getter and setter
func get_movementComponent() -> Node :
	return get_node("BasicCharacterMovement")

func get_armature() -> Node3D:
	return get_node("Armature")

func get_weaponHull() -> CollisionShape3D:
	return get_node("WeaponHull")

func get_bone() -> BoneAttachment3D :
	return get_node("Armature/Skeleton3D/Bone")
	
func get_weapon() -> Weapon :
	return get_node("Armature/Skeleton3D/Bone/Weapon")
