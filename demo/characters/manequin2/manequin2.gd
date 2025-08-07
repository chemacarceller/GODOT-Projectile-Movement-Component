class_name character2 extends CharacterBody3D

@export var movementComponent : PackedScene

# Timer used to adjust the weapon shape
var _timer := Timer.new()

var _movementComponent : Node = null
var _rotationSensitivity : float = 1.5

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_timer.queue_free()

const _walkingWeaponRotation : Vector3 = Vector3(-20*PI/180,90*PI/180,90*PI/180)
const _runingWeaponRotation : Vector3 = Vector3(-5*PI/180,90*PI/180,90*PI/180)

var _weapon : Weapon
var _weaponHull : CollisionShape3D
var _characterWeaponHull : CollisionShape3D

func _ready() -> void:
	_movementComponent = movementComponent.instantiate()
	
	# Movement Component Configuration
	_movementComponent.leftInput="ui_left"
	_movementComponent.rightInput="ui_right"
	_movementComponent.frontInput="ui_up"
	_movementComponent.rearInput="ui_down"
	_movementComponent.jumpInput="ui_select"
	
	_movementComponent.armature = $Armature
	_movementComponent.directionalObject = $SpringArm3D
	
	add_child(_movementComponent)
	
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
	get_weaponHull().global_position = get_bone().get_children()[0].get_node("WeaponHull").global_position
	get_weaponHull().global_rotation = get_bone().get_children()[0].get_node("WeaponHull").global_rotation

	if get_movementComponent().get_isRuning() :
		if _weapon.rotation != _runingWeaponRotation :
			_weapon.rotation = _runingWeaponRotation
	else :
		if _weapon.rotation != _walkingWeaponRotation :
			_weapon.rotation = _walkingWeaponRotation


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$SpringArm3D.rotation.y = $SpringArm3D.rotation.y - event.relative.x /1000 * _rotationSensitivity

	# If move_run action changes, the runing variable of the movement modified
	if Input.is_action_pressed("move_run_change"):
		_movementComponent.set_isRuning(not _movementComponent.get_isRuning())
	elif Input.is_action_pressed("move_run_continuos"):
		_movementComponent.set_isRuning(true)
	elif Input.is_action_just_released("move_run_continuos"):
		_movementComponent.set_isRuning(false)


# Getter and setter
func get_movementComponent() -> Node :
	return _movementComponent

func get_armature() -> Node3D:
	return get_node("Armature")

func get_weaponHull() -> CollisionShape3D:
	return get_node("WeaponHull")

func get_bone() -> BoneAttachment3D :
	return get_node("Armature/Skeleton3D/Bone")

	
func get_weapon() -> Weapon :
	return get_node("Armature/Skeleton3D/Bone/Weapon")
